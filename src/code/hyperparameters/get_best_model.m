function [best_model_index] = get_best_model(model_collection)
            models = numel(model_collection.models);
            p_lambda = [];
            s_lambda = [];
            test_likelihood = [];
            train_likelihood = [];
            for i = 1:models
                p_lambda = [p_lambda model_collection.models{i}.p_lambda];
                s_lambda = [s_lambda model_collection.models{i}.s_lambda];
                test_likelihood = [test_likelihood model_collection.models{i}.test_likelihood];
                train_likelihood = [train_likelihood model_collection.models{i}.train_likelihood];
            end
            

            [~, best_model_index] = max(test_likelihood);
            
            %sanity check, use sparsity as tie-breaker
            if numel(best_model_index) > 1
                model_degrees = [];
                for model = best_model_index
                    model_degrees = [model_degrees model_collection.models{model}.mean_degree];
                end
                
                [~, idx] = min(model_degrees);
                
                best_model_index = best_model_index(idx);
            end
           
end
