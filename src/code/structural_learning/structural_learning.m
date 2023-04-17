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
% The secondary functions invoked in these steps can be found below the primary function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Initialize): Here we initialize a cell containing potential neighborhood of each node

fprintf('Initializing Structural Learning');
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
params.raw_coef=cell(1,params.num_seed_structures);
params.learned_structures=cell(1,params.num_seed_structures);

wb = CmdLineProgressBar('Learning Structures'); %feedback
fprintf('\n');
for i = 1:params.num_seed_structures
    [params.raw_coef{i}] = learn_structures(params, params.s_lambda_sequence(i)); %learn structures at each s_lambda
    params.learned_structures{i} = process_structure(params.raw_coef{i}, params.density, params.absolute, params.mode, params.neighborhoods); %binarize
    wb.print(i, params.num_seed_structures); %feedback update
end


%% (4, Save our model parameters): Here we simply save the model parameters and structures 

fprintf('\n')
fprintf(strcat(num2str(params.num_seed_structures),' Structures Formed'))


save(strcat(params.experiment_directory,'/','model_parameters.mat'),'params');
fprintf('\n')
fprintf('Structural Learning Complete');

end