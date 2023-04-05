function [params] = parameterize(varargin)

%Primary validation is done in-line. Seocndary validation
%functions are constructed below and performed last.

%Steps

%(1, Construct the Parser)
%(2, Global Parameters)
%(3, Structural Learning Parameters)
%(4, Parameter Estimation Parameters)
%(5, Ensemble Identification Parameters)
%(6, Motif Identification Parameters)
%(7, Do the actual parsing)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Construct the Parser)

p=inputParser();
p.KeepUnmatched=1;


%% (2, Generate Global Parameters)

%DEPRECATED THINGS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NONE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Parameter to ignore parsing on the data itself
addParameter(p,'ignore_dataset_',false, @(x) islogical(x));

%Parameter describing the partitioning of training/test data
addParameter(p,'split',0.8,@(x) isnumeric(x) && isscalar(x) && x>0 && x<=1);

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
addParameter(p, 'num_nodes', 0, @(x) isscalar(x) && x>=0);

%scalar with number of udf
addParameter(p, 'num_udf', 0, @(x) isscalar(x) && x>=0);

%training dataset
addParameter(p, 'x_train', []);

%testing dataset
addParameter(p, 'x_test', []);

%EXPERIMENTAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addParameter(p,'temporal_steps', 0, @(x) isnumeric(x) && numel(x)==1 && x>=0);

addParameter(p, 'recurrent_edges', false, @(x) islogical(x));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% (3, Structural Learning)

%DEPRECATED THINGS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parameter constraining edges to connect to unique nodes 
% DEPRECATED DAO 03/20/2023 ought only be true
addParameter(p, 'no_same_neuron_edges',true, @(x) islogical(x) && x==true(1));
%Parameter constraining simple edges 
%DEPRECATED DAO 03/20/2023 only be simple
addParameter(p,'edges','simple', @(x) strcmp(x,'simple'));
%DEPRECATED DAO 03/20/2023 only be UDF x Neuron & Neuron x Neuron
%Parameter setting hyperedge constraints
addParameter(p,'hyperedge',2, @(x) isnumeric(x) && numel(x)==1 && x>1 && x <3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Number of s lambda for structural learning
addParameter(p,'s_lambda_count',100, @(x) isnumeric(x) && numel(x)==1 && x>=100);

% min s_lambda
addParameter(p,'s_lambda_min',1e-5,@(x) isnumeric(x) && numel(x)==1 && x<1 && x>0);

% maximum s_lambda
addParameter(p,'s_lambda_max',0.5, @(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);

%Parameter setting number of structures to feed parameter estimation
addParameter(p,'num_structures',8,@(x) isnumeric(x) && numel(x)==1 && x>=1);

%distribution for pulling s lambda samples
addParameter(p,'s_lambda_distribution',true,@(x) islogical(x));

%Parameter settings to dictate the merging of UDF and neuronal nodes
addParameter(p,'merge',true,@(x) islogical(x));

% assert additional density constraint of certain percentage on learned
% structures
addParameter(p,'density',0.25,@(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);
 
%Parameter to describe the selection of edges during density constraint
addParameter(p,'absolute',false,@(x) islogical(x));

%Parameter to set alpha 
addParameter(p,'alpha',1,@(x) isnumeric(x) && numel(x)==1 && x>= 0 && x<=1);

%Parameter to structural learn in parallel
addParameter(p, 'par_struc', false, @(x) islogical(x));


% CONTAINERS FOR MEASURES, CALCULATIONS, ETC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cell array with glm data
addParameter(p, 'glm_array',{}, @(x) iscell(x));

%cell array with learned structures
addParameter(p, 'learned_structures', {}, @(x) iscell(x));

%cell array with raw coefficients of glm
addParameter(p, 'raw_coef', {}, @(x) iscell(x));

%vector of s lambda sequence
addParameter(p, 's_lambda_sequence', []);

%vector of s lambda sequence for glm training
addParameter(p, 's_lambda_sequence_glm', []);

%cell array containing all variables vs all others (all but me)
addParameter(p, 'variable_groups', {}, @(x) iscell(x));


%EXPERIMENTAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% minimum density
addParameter(p, 'min_density', 0.05,...
@(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);

% max density
addParameter(p, 'max_density', 0.25,...
@(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);

% static density
addParameter(p,'static_density', false, @(x) islogical(x));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% (4, Generate Parameter Estimation Parameters): Here we generate the parameter estimation parameters

% DEPRECATED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parameter flagging structure type (only loopy supported)
addParameter(p, 'structure_type','loopy',@(x) strcmp(x,'loopy'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%Parameter setting chunk size for param estimation implementation
addParameter(p,'chunk_size',1,@(x) isnumeric(x) && numel(x)==1 && x>=1);

%Parameter flagging chunk processing 
addParameter(p,'chunk',false,@(x) islogical(x));

%Parameter Implementation Mode
addParameter(p, 'implementation_mode', 1, @(x) isnumeric(x) && numel(x)==1 && x<=4);
% 1 equals bulk
% 2 equals chunk
% 3 equals series
% 4 equals parallel
% ratio of train-test for model selection

addParameter(p, 'train_test_ratio', 1, @(x) isnumeric(x) && isscalar(x) && x>=0 && x<=1);

% CONTAINERS FOR MEASURES, CALCULATIONS, ETC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sequence of p_lambda
addParameter(p, 'p_lambda_sequence', []);

%% (5, Generate Ensemble Identification Parameters): 

%DEPRECATED

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NONE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%  (6, Generate 'Evaluation' Parameters): 

% DEPRECATED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter to assess neurons
addParameter(p, 'assessNeurons', false, @(x) x==false);
% Parameter to assess nodes
addParameter(p, 'assessNodes',false, @(x) x==false);
% Parameter to assess linearity
addParameter(p, 'assessLinearity', false, @(x) x==false);
% Parameter to assess size
addParameter(p, 'assessSize', false, @(x) x==false);
% Parameter for step size
addParameter(p, 'stepSize', 5, @(x) isnumeric(x) && isscalar(x) && x>=0);
% Parameter for num Steps
addParameter(p, 'numSteps', 5, @(x) isnumeric(x) && isscalar(x) && x>=0);
% Parameter to assess multiclass predictions
addParameter(p, 'assessMulticlass', false, @(x) x==false);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%DEPRECATED THINGS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pruned neurons
addParameter(p, 'nil_idx', zeros(1,1), @(x)validateattributes(x, {'double'},{'2d'}));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Parameter containing data
addParameter(p,'data',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));

%Parameter containing UDF
addParameter(p,'udf',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));

%Parameter containing coords
addParameter(p,'coords',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));


%% Do the parsing & Export the parameter set

%parse
parse(p,varargin{:});

%send to structure
params = p.Results;

params = calculate_number_of_models(params);

%secondary validation
if params.ignore_dataset_ == false
    [params.x_train,params.x_test,params.num_udf,params.num_nodes,params.data,params.udf,params.shuffle_index] = data_segmentation(params.data,params.udf,params.split,params.merge,params.random_shuffle);
    [params.p_lambda_sequence,params.s_lambda_sequence_glm,params.glm_options] = generate_lambda_sequences(params.p_lambda_count,params.p_lambda_min,params.p_lambda_max,params.p_lambda_distribution,params.s_lambda_count,params.s_lambda_min,params.s_lambda_max,params.s_lambda_distribution,params);
end


end

