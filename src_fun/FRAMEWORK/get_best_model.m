function [best_model_index] = get_best_model(model_collection)
            L = numel(model_collection.models);
            pb =[];
            sb=[];
            ttb=[];
            trnb=[];
            for i = 1:L
                pb = [pb model_collection.models{i}.p_lambda];
                sb = [sb model_collection.models{i}.s_lambda];
                ttb = [ttb model_collection.models{i}.test_likelihood];
                trnb = [trnb model_collection.models{i}.train_likelihood];
                i=i+1;
            end
            %difference in prediction
            %LL_diff = abs(trnb-ttb);
            %min-max normalized (LL_diff max-min normalized)
            %LL = (trnb-min(trnb))/(max(trnb)-min(trnb)).*(3/6)+(ttb-min(ttb))/(max(ttb)-min(ttb)).*(2/6)+(LL_diff-max(LL_diff))/(min(LL_diff)-max(LL_diff)).*(1/6);
            LL = trnb+ttb;
            
            [M,best_model_index] = max(LL);
            
            %sanity check, use sparsity as tie-breaker
            
            if numel(best_model_index)>1
                z=1;       
                for i = best_model_index
                    if model_collection.models{i}.mean_degree > z
                        z=i;
                    end
                end
                best_model_index = z;
            end
end
