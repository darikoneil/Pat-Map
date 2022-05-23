function cleanUpParameterEstimation(app)


f_DA_compile_models(app);

for i = 1:length(app.model_collection.models)
    for j = 1:length(app.models)
        if app.model_collection.models{i}.s_lambda == app.models{j}.s_lambda && app.model_collection.models{i}.p_lambda == app.models{j}.p_lambda
            app.models{j}.pending_parameter_estimation=0;
        end
    end
end

f_DA_update_learned_models(app);
f_DA_update_unlearned_models(app);
f_DA_update_best_model_text(app);
f_DA_update_optimization_plots(app);

end

   