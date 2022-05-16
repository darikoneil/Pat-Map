profile on

[model_collection] = LoopyModelCollection2(models{1},params);
model_collection = model_collection.do_parameter_estimation(...
           params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
           params.compute_true_logZ, params.reweight_denominator,...
           params.printInterval, params.printTest, params.MaxTime);
       
[model_collection] = LoopyModelCollection2(models{2},params);
model_collection = model_collection.do_parameter_estimation(...
           params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
           params.compute_true_logZ, params.reweight_denominator,...
           params.printInterval, params.printTest, params.MaxTime);
       
  profile viewer
  
  profile on
  
  L=2;
Storage = cell(1,L);
parfor  i = 1:L
    tmp_model = models{i};
    [model_collection] = LoopyModelCollection2(tmp_model,params);
    fprintf('Parameter Estimation...\n');
    %Parameter Estimation
    model_collection = model_collection.do_parameter_estimation(...
           params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
           params.compute_true_logZ, params.reweight_denominator,...
           params.printInterval, params.printTest, params.MaxTime);
       
    Storage{i}=model_collection;
end

profile viewer


tic
[model_collection] = LoopyModelCollection2(models{2},params);
model_collection = model_collection.do_parameter_estimation(...
           params.BCFW_max_iterations, params.BCFW_fval_epsilon,...
           params.compute_true_logZ, params.reweight_denominator,...
           5, params.printTest, params.MaxTime);
toc