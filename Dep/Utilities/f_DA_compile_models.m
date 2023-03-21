function f_DA_compile_models(app)

params = app.params;

input_collection = app.model_collection;

    

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
if ~(isempty(input_collection))
    model_collection.models = [model_collection.models input_collection.models];
end

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
    
app.best_model=best_model;
app.model_collection = model_collection;

%update pendings

    
end
