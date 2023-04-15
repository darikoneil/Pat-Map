function [best_model_index] = get_best_model(model_collection)
            models = numel(model_collection.models);
            p_lambda = [];
            s_lambda = [];
            test_likelihood = [];
            valid_likelihood = [];
            train_likelihood = [];
            for i = 1:models
                p_lambda = [p_lambda model_collection.models{i}.p_lambda];
                s_lambda = [s_lambda model_collection.models{i}.s_lambda];
                test_likelihood = [test_likelihood model_collection.models{i}.test_likelihood];
                valid_likelihood = [valid_likelihood model_collection.models{i}.valid_likelihood];
                train_likelihood = [train_likelihood model_collection.models{i}.train_likelihood];
            end
            

            [~, best_model_index] = max(valid_likelihood);
            
            %sanity check, use training validation as tie-breaker
            if numel(best_model_index) > 1
                for model = best_model_index
                    train_ll = [train_ll model_collection.models{model}.train_likelihood];
                end
                
                [~, idx] = max(train_ll);
                
                best_model_index = best_model_index(idx);
            end
           
end
