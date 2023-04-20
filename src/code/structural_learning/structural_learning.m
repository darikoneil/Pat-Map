function [params] = structural_learning(params)
%  for structural learning
%
% Reviewed Darik A O'Neil 04-15-2023
%
% Purpose: Consolidated function for structural learning 
%
% To accomplish this we do steps
% (1, Initialize Potential Neighborhoods)
% (2, Learn Neighborhoods)
% (3, Learn Structures)
% (4, Save Model Parameters)
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Initialize): Here we initialize a cell containing potential neighborhood of each node

fprintf('Initializing Structural Learning\n');
[params.neighborhoods] = initialize_neighborhoods(params.num_neurons, params.num_udf, params.edge_constraints); 


%% (2, Learn Neighborhoods: Here we learn the relationships between each node and its neighborhood over the given lambda sequence

%*Note, the parallel function is thread-safe but the catch/warnings are NOT
% thread-safe. If you have issues, make sure that the parameter sequence is appropriate.
% It is possible to recompile the function but it's quite annoying to
% create .mex functions that interact with FORTRAN on windows given it
% requires an expensive Intel compiler or some workout I haven't figured
% out yet. There is a free compiler which ought to do the job for students
% via intel, but the latest compilers (2021) are not yet commensurable with
% MATLAB. 

if params.par_struc
    [params] = learn_neighborhoods_par(params); %Learn in parallel
else
    [params] = learn_neighborhoods(params); %Learn Serially
end

%% (3, Learn the structures given these relationships):

%preallocate
params.raw_coef={};
params.learned_structures={};

wb = CmdLineProgressBar('Learning Structures'); %feedback
fprintf('\n');

start_time = tic;
current_time = tic;
end_time = start_time + 60*1e7;

i=1;
while length(params.learned_structures) < params.num_seed_structures
    % We use a while loop here because sometimes we'll set the lambda such that it generates empty structures
        % to protect against infinite looping   
        if i > params.num_seed_structures || i > length(params.s_lambda_sequence)
            new = setdiff(params.s_lambda_sequence_glm(round(0.2*length(params.s_lambda_sequence_glm)):end), params.s_lambda_sequence);
            new_val = new(randperm(length(new),1));
            params.s_lambda_sequence = [params.s_lambda_sequence new_val];
        end
        raw_coef = learn_structures(params, params.s_lambda_sequence(i));
        learned_structure =  process_structure(raw_coef, params.density, params.absolute, params.mode, params.neighborhoods); %binarize
        if sum(sum(learned_structure)) >= (params.num_neurons + params.num_udf)
            params.raw_coef{end+1} = raw_coef;
            params.learned_structures{end+1} = learned_structure;
            wb.print(i, params.num_seed_structures); %feedback update
        else
            % if params picked poorly the bracket points could be empty. in this case, switch to fully stochastic
            if i == 1 || i == 2
                params.s_lambda_sequence = [];
                i=0; % so that i starts with 1
            end
        end
        i=i+1;
        current_time = tic;
        %assert(current_time <= end_time, 'Timeout due to inability to generate sufficient structures. Please broaden lambda range'); 	
end


%% (4, Save our model parameters): Here we simply save the model parameters and structures 

fprintf('\n')
fprintf(strcat(num2str(params.num_seed_structures),' Structures Formed'))


save(strcat(params.experiment_directory,'/','model_parameters.mat'),'params');
fprintf('\n')
fprintf('Structural Learning Complete');

end