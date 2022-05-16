function [model_collection] = runTheModelsBank(models,params)
chunkSize = params.chunkSize;
%This function runs and saves models in chunks to avoid memory leak

modelsBank = models;

modelL = length(modelsBank);
numChunks = modelL/chunkSize;

%sanity check
if(rem(modelL,numChunks))
    fprintf('Choose a different chunk size');
    model_collection='error';
    return;
end


    
%for a = 1:numChunks
%mini chuck-test
for a = 1:numChunks
    models = modelsBank((1+(a-1)*chunkSize):(chunkSize+(a-1)*chunkSize)); %grab next chunk
    
    %make THIS iteration of the model_collection
    model_collection = LoopyModelCollection(models,params);
    
    %run parameter estimation
    fprintf('Parameter Estimation...\n');
            %Parameter Estimation
            model_collection = model_collection.do_parameter_estimation(...
            params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
            params.compute_true_logZ, params.reweight_denominator,...
            params.printInterval, params.printTest, params.MaxTime);
        
            %Save Collection to Temp Directory
            tmpName = tempname(strcat(params.exptdir,'/tmp'));
            tmpName = strcat(tmpName,'.mat');
            warning('off','all');
            model_collection = struct(model_collection);
            save(tmpName, 'model_collection');
            
            %clear memory
            tmpName=[];
            model_collection=[];
            models=[];
end

%Now load them all into one model_collection
myFiles = dir(fullfile(strcat(params.exptdir,'/tmp'),'*.mat'));
b=1; 
specFile = myFiles(b).name;
folFile = fullfile(myFiles(b).folder,specFile);
model_collection=load(folFile);
MDLaccum = model_collection;
model_collection=[];

for b = 2:length(myFiles)
    specFile = myFiles(b).name;
    folFile = fullfile(myFiles(b).folder,specFile);
    load(folFile);
    MDLaccum.model_collection.models = [MDLaccum.model_collection.models model_collection.models];
    model_collection=[];
end

model_collection=MDLaccum.model_collection;
%model_collection=1;
return;

end