function [params] = validateData(varargin)

%Darik O'Neil 12-13-2021 Rafael Yuste Laboratory

%Purpose: Function to generate a set of parameters (if not provided) and to
%parse provided input parameters. Primary validation is done in-line. Seocndary validation
%functions are constructed below and performed last.

%Steps

%(1, Construct the Parser)
%(2, Global Parameters)
%(3, Structural Learning Parameters)
%(4, Parameter Estimation Parameters)
%(5, Ensemble Identification Parameters)
%(6, Motif Identification Parameters)
%(7, Do the actual parsing)

%*Note that text is stored as type char to limit overhead* 
%-- Darik %12-13-2021

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Construct the Parser): Here we construct a parser to parse the
%provided inputs, flag if a full parameter set was passed, and initialize
%default parameters. 

p=inputParser();

%% (2, Generate Global Parameters): Here we construct the global parameters
% at their defaults

%Parameter to ignore parsing and accept fed parameter set
addParameter(p,'ignoreParsing',false, @(x) islogical(x));
%Parameter describing the partitioning of training/test data
addParameter(p,'split',0.8,@(x) isnumeric(x) && isscalar(x) && x>0 && x<=1);
%Parameter flagging parallel processing
addParameter(p,'parProc',false, @(x) islogical(x) && numel(x)==1);
%Parameter containing data
addParameter(p,'data',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));
%Parameter containing UDF
addParameter(p,'UDF',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));
%Parameter containing coords
addParameter(p,'coords',zeros(1,1), @(x)validateattributes(x,{'double'},{'2d'}));
%Parameter containing name
addParameter(p,'name','defaultName', @(x) ischar(x));
%Parameter containing data directory
addParameter(p,'data_directory','defaultDirectory',@(x) ischar(x));
%Parameter containing filename
addParameter(p,'Filename','defaultFilename',@(x) ischar(x));
%Parameter containing source directory
addParameter(p,'source_directory','defaultDirectory',@(x) ischar(x));
%Parameter containing experimental results directory
addParameter(p,'exptdir','defaultDirectory',@(x) ischar(x));
%Paramter flagging for shuffling data
addParameter(p,'dataShuffle',true,@(x) islogical(x));


%% (3, Generate Structural Learning Parameters): Here we generate the structural learning parameters

%Parameter constraining edges to connect to unique nodes
addParameter(p, 'no_same_neuron_edges',true, @(x) islogical(x));
%Parameter constraining simple edges
addParameter(p,'edges','simple', @(x) strcmp(x,'simple'));
%Parameter setting s_lambda range
addParameter(p,'s_lambda_count',100, @(x) isnumeric(x) && numel(x)==1 && x>=100);
%Parameter setting s_lambda min
addParameter(p,'s_lambda_min',1e-5,@(x) isnumeric(x) && numel(x)==1 && x<1 && x>0);
%Parameter setting s_lambda max
addParameter(p,'s_lambda_max',0.5, @(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);
%Parameter setting hyperedge constraints
addParameter(p,'hyperedge',2, @(x) isnumeric(x) && numel(x)==1 && x>=1 && x <=3);
%Parameter setting number of structures to feed parameter estimation
addParameter(p,'num_structures',8,@(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter setting the space of s_lambda
addParameter(p,'logSspace',true,@(x) islogical(x));
%Parameter settings to dictate the merging of UDF and neuronal nodes
addParameter(p,'merge',true,@(x) islogical(x));
%Parameter settings to dictate the density of edges
addParameter(p,'density',1,@(x) isnumeric(x) && numel(x)==1 && x<=1 && x>0);
%Parameter to describe the selection of edges during density constraint
addParameter(p,'absolute',false,@(x) islogical(x));
%Parameter to set alpha in GLM
addParameter(p,'alphaGLM',1,@(x) isnumeric(x) && numel(x)==1 && x>= 0 && x<=1);

%% (4, Generate Parameter Estimation Parameters): Here we generate the parameter estimation parameters

%Parameter setting space of p_lambda
addParameter(p, 'logPspace',false,@(x) islogical(x));
%Parameter describing the range of p_lambda
addParameter(p,'p_lambda_count',2,@(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter describing the minimum p_lambda
addParameter(p,'p_lambda_min',1000, @(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter describing the maximum p_lambda
addParameter(p,'p_lambda_max',10000, @(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter describing reweight used
addParameter(p,'reweight_denominator','mean_degree',@(x) ischar(x) && (strcmp(x,'mean_degree') || strcmp(x,'median_degree') || strcmp(x,'max_degree') || strcmp(x,'rms_degree')));
%Parameter flagging for exact computation of partition function
addParameter(p,'compute_true_logZ',false,@(x) islogical(x));
%Parameter flagging structure type (only loopy supported)
addParameter(p, 'structure_type','loopy',@(x) strcmp(x,'loopy'));
%Parameter setting upper bound for BCFW iterations
addParameter(p, 'BCFW_max_iterations',75000,@(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter setting epsilon
addParameter(p, 'BCFW_fval_epsilon',0.1, @(x) isnumeric(x) && numel(x)==1 && x<=1);
%Parameter setting print interval
addParameter(p, 'printInterval',1000,@(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter setting print test
addParameter(p, 'printTest',100', @(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter setting upper bound on time to converge
addParameter(p, 'MaxTime',Inf,@(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter setting chunk size
addParameter(p,'chunkSize',1,@(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter flagging chunk processing
addParameter(p,'chunk',false,@(x) islogical(x));

%% Generate Ensemble Identification Parameters

%Parameter setting number of control "random" ensembles
addParameter(p,'num_controls',100,@(x) isnumeric(x) && numel(x)==1 && x>=1);
%Parameter setting performance curve criterion
addParameter(p,'curveCrit','AUC',@(x) ischar(x) && (strcmp(x,'AUC') || strcmp(x,'PR')));
%Parameter setting the criterion for random ensemble size
addParameter(p,'sizeEnsCrit','coact',@(x) ischar(x) && (strcmp(x,'max_degree') || strcmp(x,'coact') || strcmp(x,'coactUDF')));
%Parameter flag to drop UDF from random ensembles
addParameter(p,'incRandEnsUDF',false,@(x) islogical(x));

%% Generate Motif Identification Parameters

%Parameter determing which overcomp score to invoke for motif analysis
addParameter(p,'overcompleteCrit','11', @(x) ischar(x) && (strcmp(x,'11') || strcmp(x, '00') || strcmp(x,'01') || strcmp(x,'10')));
%Parameter to constrain motifs to neurons only
addParameter(p,'neuronOnly',true,@(x) islogical(x));

%% Do the parsing & Export the parameter set

%parse
parse(p,varargin{:});

%send to structure
params = p.Results;

%secondary validation
[params.x_train,params.x_test,params.UDF_Count,params.Num_Nodes,params.data,params.UDF] = internalValidate_Dataset(params.data,params.UDF,params.split,params.merge,params.dataShuffle);
[params.p_lambda_sequence,params.s_lambda_sequence_LASSO,params.LASSO_options] = internal_generateSequences(params.p_lambda_count,params.p_lambda_min,params.p_lambda_max,params.logPspace,params.s_lambda_count,params.s_lambda_min,params.s_lambda_max,params.logSspace);

fprintf('\n');
fprintf('Data and Parameters Validated...\n');

end

