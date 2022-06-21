function [completePerfs] = generateShuffledModelBatch(best_model, params, shuffleType, retainOptions, numShuffles)



%% Setup
shuffledDataFolder = strcat(params.exptdir,'/shuffledData');
if ~exist(shuffledDataFolder)
    mkdir(shuffledDataFolder)
end

shuffledModelsFolder = strcat(params.exptdir, 'shuffledModels');
if ~exist(shuffledModelsFolder)
    mkdir(shuffledModelsFolder);
end


%% First Generate Structures

for i = 1:numShuffles
    %duplicate Params
    dparams = params;
    numNeur = size(params.data,2);
    numStim = size(params.UDF,2);

    shuffledMatrix = shuffle([params.data params.UDF]', shuffleType)';

    dparams.data = shuffledMatrix(:,1:numNeur);
    dparams.UDF = shuffledMatrix(:,numNeur+1:end);
    dparams.x_train = shuffledMatrix(1:size(params.x_train,1),:);
    dparams.x_test = shuffledMatrix((size(params.x_train,1)+1):end,:);

    % match to best model
    dparams.s_lambda_count=1;
    dparams.p_lambda_count=1;


    %force parProc to false % neuronOnly
    %dparams.parProc=false;
    %dparams.neuronOnly=true;
    dparams.num_structures=1;

    %learn structure
    [dparams] = structuralLearning(dparams);
    %force learn 
    dparams.s_lambda_count=1;
    dparams.p_lambda_count=1;
    dparams.s_lambda_sequence = best_model.s_lambda;
    dparams.p_lambda_sequence = best_model.p_lambda;
    [dparams.rawCoef{1}] = learn_structures(dparams,dparams.s_lambda_sequence(1)); %learn structures at each s_lambda
    dparams.learned_structures{1} = processStructure(dparams.rawCoef{1},dparams.density,dparams.absolute); %binarize
    dparams.s_lambda_sequence = best_model.s_lambda;
    dparams.p_lambda_sequence = best_model.p_lambda;

    %preallocate
    [models] = pre_allocate_models(dparams);
    
    %save to temp
    tmpName = tempname(shuffledDataFolder);
    tmpName = strcat(tmpName,'.mat');
    save(tmpName, 'models','dparams');    
end


%% Import Generated Structures
% faster way to code it, not likely to be fast way to execute
myFiles = dir(fullfile(shuffledDataFolder,'*.mat'));
shufflesFound = length(myFiles);
shufflesBank = cell(1,numShuffles);

specFile = myFiles(1).name;
folFile = fullfile(myFiles(1).folder,specFile);

shufflesBank{1,1} = load(folFile);

for i=2:shufflesFound
    specFile = myFiles(i).name;
    folFile = fullfile(myFiles(i).folder,specFile);
    shufflesBank{1,i}=load(folFile);
end

%% Estimate Parameters in Parallel

parfor i = 1:shufflesFound
     [model_collection] = LoopyModelCollection2(shufflesBank{1,i}.models{1},shufflesBank{1,i}.dparams);
      model_collection = model_collection.do_parameter_estimation(...
           shufflesBank{1,i}.dparams.BCFW_max_iterations, shufflesBank{1,i}.dparams.BCFW_fval_epsilon,...
           shufflesBank{1,i}.dparams.compute_true_logZ, shufflesBank{1,i}.dparams.reweight_denominator,...
           shufflesBank{1,i}.dparams.printInterval, shufflesBank{1,i}.dparams.printTest, shufflesBank{1,i}.dparams.MaxTime);
       
        tmpName = tempname(shuffledModelsFolder);
        tmpName = strcat(tmpName,'.mat');
        parSave(tmpName,model_collection);
end

%% Secondary Evaluation
       
    myFiles = dir(fullfile(shuffledModelsFolder,'*.mat'));
    modelsFound=length(myFiles);
    completePerfs = cell(1,modelsFound);
    for i = 1:modelsFound
        completePerfs{1,i} = conductSecondaryShuffleEval(myFiles, i, shufflesBank, numNeur);
        fprintf(num2str(i));
        fprintf('of');
        fprintf(num2str(modelsFound));
    end
    
end


    
    