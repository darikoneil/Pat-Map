function [best_model, model_collection, params] = estimateParametersSeries(params, models, input_collection)

%This function runs and saves models in series to ensure completed models
%are saved in the event of error or overload.
modelL = length(models);

wb = CmdLineProgressBar('Estimating Parameters In Series');
for a = 1:modelL
    model = models{a};  %grab next chun
    
    if ~(model.pending_parameter_estimation)
        continue;
    end
    %make THIS iteration of the model_collection
    model_collection = LoopyModelCollection2(model,params);
    
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
            model=[];
            wb.print(a,modelL);
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
model_collection.models = [model_collection.models input_collection.models];
[model_collection.models] = sortModels(model_collection.models);

    [best_model_index] = get_best_model(model_collection);
    [best_model] = SingleLoopyModel(model_collection, best_model_index);
    best_model.best_model_index = best_model_index;
    
    %Convert to Structures for saving
    warning('off','all');
    model_collection=struct(model_collection);
    best_model = struct(best_model);
    save(strcat(params.exptdir, '/', 'model_collection.mat'), 'model_collection');
    save(strcat(params.exptdir, '/', 'best_model.mat'), 'best_model');
    
end