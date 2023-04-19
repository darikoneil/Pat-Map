function [params] = parameterize(varargin)
% Reviewed Darik A ONeil 04-15-2023
%
%Primary validation is done in-line. 
%
%Secondary validation functions are constructed below and performed last.

%Steps

%(1, Construct the Parser)
%(2, Global Parameters)
%(3, Structural Learning Parameters)
%(4, Parameter Estimation Parameters)
%(5, Ensemble Identification Parameters)
%(6, Motif Identification Parameters)
%(7, Do the actual parsing)

%% (1, Construct the Parser)

p=inputParser();
p.KeepUnmatched=1;

%% (2, Generate Global Parameters)

%Parameter to ignore parsing on the data itself
addParameter(p,'ignore_dataset_',false, @(x) islogical(x));

%Parameter describing the partitioning of training/test data
addParameter(p,'split',0.8,@(x) isnumeric(x) && isscalar(x) && x>0 && x<=1);

%Parameter indicating validation set
addParameter(p, 'validation', 0.125, @(x) isnumeric(x) && isscalar(x) && x>0 && x <=1);

%Parameter flagging parallel processing for general computations &
%structural learning
addParameter(p,'par_proc',false, @(x) islogical(x) && numel(x)==1);

%Parameter containing name
addParameter(p,'name','default_name', @(x) ischar(x));

%Parameter containing data directory
addParameter(p,'data_directory','default_data',@(x) ischar(x));

%Parameter containing filename
addParameter(p,'filename','default_filename',@(x) ischar(x));

%Parameter containing source directory
addParameter(p,'source_directory','default_source',@(x) ischar(x));

%Parameter containing experimental results directory
addParameter(p,'experiment_directory','default_experiment',@(x) ischar(x));

%Paramter flagging for randomly shuffling data
addParameter(p,'random_shuffle',true,@(x) islogical(x));

%shuffle index
addParameter(p,'shuffle_index', zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));


% CONTAINERS FOR MEASURES, CALCULATIONS, ETC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scalar with number of ORIGINAL nodes (aka neurons)
addParameter(p, 'num_neurons', 0, @(x) isscalar(x) && x>=0);

%scalar with number of udf
addParameter(p, 'num_udf', 0, @(x) isscalar(x) && x>=0);

%training dataset
addParameter(p, 'x_train', []);

%testing dataset
addParameter(p, 'x_test', []);

%validation dataset
addParameter(p, 'x_valid', []);

%EXPERIMENTAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addParameter(p,'temporal_steps', 0, @(x) isnumeric(x) && numel(x)==1 && x>=0);

% addParameter(p, 'recurrent_edges', false, @(x) islogical(x));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (3, Structural Learning)

% Number of s lambda for structural learning
addParameter(p,'s_lambda_count',100, @(x) isnumeric(x) && numel(x)==1 && x>=100);

% min s_lambda
addParameter(p,'s_lambda_min',1e-5,@(x) isnumeric(x) && numel(x)==1 && x<1 && x>0);

% maximum s_lambda
addParameter(p,'s_lambda_max',0.5, @(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);

%Parameter setting number of structures to feed parameter estimation
addParameter(p,'num_seed_structures', 2, @(x) isnumeric(x) && numel(x)==1 && x>=2);

%distribution for pulling s lambda samples
addParameter(p,'s_lambda_distribution',true,@(x) islogical(x));

% assert additional density constraint of certain percentage on learned
% structures
addParameter(p,'density',0.25,@(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);
 
%Parameter to describe the selection of edges during density constraint
addParameter(p,'absolute',false,@(x) islogical(x));

%Parameter to set alpha 
addParameter(p,'alpha',1,@(x) isnumeric(x) && numel(x)==1 && x>= 0 && x<=1);

%Parameter to structural learn in parallel
addParameter(p, 'par_struc', false, @(x) islogical(x));

%Parameter to set edge constraints
addParameter(p,'edge_constraints', true, @(x) islogical(x));

% CONTAINERS FOR MEASURES, CALCULATIONS, ETC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cell array with glm data
addParameter(p, 'glm_array',{}, @(x) iscell(x));

% a 1 x N structure cell vector
addParameter(p, 'learned_structures', {}, @(x) iscell(x));

% a 1 x N structure cell vector with raw coefficients of structure N
addParameter(p, 'raw_coef', {}, @(x) iscell(x));

% 1 x N vector of seed s lambda's
addParameter(p, 's_lambda_sequence', []);

% a 1 x N vector of s lambda for glm training
addParameter(p, 's_lambda_sequence_glm', []);

% a 1 x N node cell vector where each cell is a 1 x M index of potential edge partners (i.e., the
% neighborhood) for each node N
addParameter(p, 'neighborhoods', {}, @(x) iscell(x));

%container for glm options
addParameter(p, 'glm_options', []);

%EXPERIMENTAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addParameter(p, 'mode','threshold', @(x) (strcmp(x,'threshold') || strcmp(x,'calculated') || strcmp(x,'static')));

%% (4, Generate Parameter Estimation Parameters): Here we generate the parameter estimation parameters

%Parameter setting space of p_lambda
addParameter(p, 'p_lambda_distribution',false,@(x) islogical(x));
%Parameter describing the number of p lambda to retrieve

addParameter(p,'p_lambda_count',2,@(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter describing the minimum p_lambda
addParameter(p,'p_lambda_min',1000, @(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter describing the maximum p_lambda
addParameter(p,'p_lambda_max',100000, @(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter 
%Parameter describing reweight used see bethe
addParameter(p,'reweight_denominator','mean_degree',@(x) ischar(x) && (strcmp(x,'mean_degree') || strcmp(x,'median_degree') || strcmp(x,'max_degree') || strcmp(x,'rms_degree')));

% maintain CamelCase here 
%Parameter setting upper bound for BCFW iterations
addParameter(p, 'max_iterations',75000,@(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter setting epsilon
addParameter(p, 'fval_epsilon',0.1, @(x) isnumeric(x) && numel(x)==1 && x<=1);

%Parameter setting print interval
addParameter(p, 'print_interval',1000,@(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter setting upper bound on time to converge
addParameter(p, 'max_time',Inf,@(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter Implementation Mode
addParameter(p, 'implementation_mode', 1, @(x) isnumeric(x) && numel(x)==1 && x<=4);
% 1 is standard
% 2 is parallel
% 3 is seed-only
% 4 is parallel seed-only

%parameter contains temp model paths
addParameter(p, 'temp_model_paths', {}, @(x) iscell(x));

% ratio of train-test for model selection
addParameter(p, 'train_test_ratio', 1, @(x) isnumeric(x) && isscalar(x) && x>=0 && x<=1);

% CONTAINERS FOR MEASURES, CALCULATIONS, ETC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sequence of seed p_lambda
addParameter(p, 'p_lambda_sequence', []);

%% (5, Generate Ensemble Identification Parameters): 


%Parameter setting number of control "random" ensembles
addParameter(p,'num_controls',100,@(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter setting performance curve criterion
addParameter(p,'perf_curve_criterion','AUC',@(x) ischar(x) && (strcmp(x,'AUC') || strcmp(x,'PR')));

%Parameter flag to drop UDF from random ensembles
addParameter(p,'include_UDF_in_random_ensembles',false,@(x) islogical(x));

% number of deviations above mean for ensemble identification
addParameter(p, 'identify_ensemble_deviations', 3, @(x) isnumeric(x) && isscalar(x) && x>=0 );

% whether to include testing in ensemble identification
addParameter(p, 'include_testing_in_identify', false, @(x) islogical(x));

%Parameter setting the criterion for random ensemble size
addParameter(p,'size_random_ensemble','coact',@(x) ischar(x) && (strcmp(x,'max_degree') || strcmp(x,'coact') || strcmp(x,'coactUDF')));

%Parameter setting the number of deviations used to extract ensemble
addParameter(p, 'deviations_ensemble_id', 3, @(x) isscalar(x));

%%  (6, Generate 'Evaluation' Parameters): 

% Parameter for current stage
addParameter(p, 'stage', 0, @(x) isnumeric(x) && isscalar(x));

% Parameter to assess decoding
addParameter(p, 'assess_decoding', true, @(x) islogical(x));

% Parameter to assess clustering
addParameter(p, 'assess_clustering', true, @(x) islogical(x));

%% (7, Pattern completion parameters (god i hate matlab --sent from my pycharm)

%Parameter determing which overcomp score to invoke for motif analysis
addParameter(p,'node_score_criterion','11', @(x) ischar(x) && (strcmp(x,'11') || strcmp(x, '00') || strcmp(x,'01') || strcmp(x,'10')));

%Parameter to constrain motifs to neurons only
addParameter(p,'node_score_neurons_only',true,@(x) islogical(x));

% how to generate thresholds
addParameter(p, 'node_threshold_pattern_complete', 'Ensemble', @(x) ischar(x) && (strcmp(x,'Entire') || strcmp(x,'Ensemble') || strcmp(x,'Shuffling')));

%% (8, DATASET PARAMETERS)

% nil neurons
addParameter(p, 'nil_neurons', zeros(1,1), @(x)validateattributes(x, {'double'},{'2d'}));

% nil frames
addParameter(p, 'nil_frames', zeros(1,1), @(x)validateattributes(x, {'double'},{'2d'}));

%Parameter containing data
addParameter(p,'data',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));

%Parameter containing UDF
addParameter(p,'udf',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));

addParameter(p, 'rois', []);

%parameter of udf labels
addParameter(p, 'udf_labels', {});


%% (9, SMBO PARAMETERS)

% Parameter indicating max number of objective evaluations
addParameter(p, 'smbo_max_eval', 30, @(x) isscalar(x));

% Parameter indicating max time allowed for objective evaluation
addParameter(p, 'smbo_max_time', Inf, @(x) isscalar(x));

%% Do the parsing & Export the parameter set

%parse
parse(p,varargin{:});

%send to structure
params = p.Results;

params = calculate_number_of_models(params);

%secondary validation
if params.ignore_dataset_ == false
    [params.data, params.udf, params.rois, params.nil_neurons, params.nil_frames] = secondary_validation(params.data, params.udf, params.rois);
    [params.x_train, params.x_valid, params.x_test,params.num_udf,params.num_neurons,params.data,params.udf,params.shuffle_index] = data_segmentation(params.data, params.udf, params.split, params.validation, params.random_shuffle);
    [params.p_lambda_sequence,params.s_lambda_sequence_glm,params.glm_options] = generate_lambda_sequences(params.p_lambda_count,params.p_lambda_min,params.p_lambda_max,params.p_lambda_distribution,params.s_lambda_count,params.s_lambda_min,params.s_lambda_max,params.s_lambda_distribution,params);

end
  
end
