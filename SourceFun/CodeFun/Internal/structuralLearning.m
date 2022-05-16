function [params] = structuralLearning(params)

% Function for structural learning
% Darik O'Neil 12-13-2021, Rafael Yuste Laboratory
%
% Purpose: Consolidated function for structural learning 
%
% To accomplish this we do steps
% (1, Initialize)
% (2, Learn Neighborhoods)
% (3, Learn Structures)
% (4, Save Model Parameters)
%
% The secondary functions invoked in these steps can be found below the primary function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% (1, Initialize Neighborhoods): Here we initialize a cell containing the neighborhoods
%for each node

[params.variable_groups] = internal_initNeighbors(size(params.x_train,2),params.hyperedge,params.Num_Nodes,params.UDF_Count); %initialization of neighborhoods function

%% (2, Learn Neighborhoods: Here we learn the relationships between each node and its neighborhood over the given lambda sequence

%*Note, the parallel function is thread-safe but the catch/warnings are NOT
% thread-safe. If you have issues, make sure that the parameter sequence is appropriate.
% It is possible to recompile the function but it's quite annoying to
% create .mex functions that interact with FORTRAN on windows given it
% requires an expensive Intel compiler or some workout I haven't figured
% out yet. There is a free compiler which ought to do the job for students
% via intel, but the latest compilers (2021) are not yet commensurable with
% MATLAB

%First check if parallel processing permitted
if params.parProc
    [params] = learn_neighborhoods_p(params); %Learn in parallel
else
    [params] = learn_neighborhoods(params); %Learn Serially
end

%% (3, Learn the structures given these relationships):
fprintf('\n');
fprintf('Now Learning Structures');
fprintf('\n');

%preallocate
params.rawCoef=cell(1,params.num_structures);
params.learned_structures=cell(1,params.num_structures);

wb = CmdLineProgressBar('Learning Structures'); %feedback
fprintf('\n');
for i = 1:params.num_structures
    [params.rawCoef{i}] = learn_structures(params,params.s_lambda_sequence(i)); %learn structures at each s_lambda
    params.learned_structures{i} = processStructure(params.rawCoef{i},params.density,params.absolute); %binarize
    wb.print(i,params.num_structures); %feedback update
end
fprintf('Structural Learning Complete');
fprintf('\n');

%hotfix Darik 02/01/2022; Where did this check go? Check previous pushes...
%tmpRem = [];
%removeRecurrent = ~(diag(ones(1,size(params.x_train,2))));
%for i = 1:length(params.learned_structures)
  %  tmp = params.learned_structures{i}.*removeRecurrent;
  %  if sum(tmp)<2
  %      tmpRem = [tmpRem i];
 %   end
%end

%% (4, Save our model parameters): Here we simply save the model parameters and structures 

fprintf('\n')
fprintf(strcat(num2str(params.num_structures),' Structures Formed'))

%params.learned_structures(tmpRem) = [];
%params.num_structures = length(params.learned_structures);

%make sure to remove from other structural sequences (s_lambda and raw Coef)
%params.s_lambda_sequence(tmpRem)=[];
%params.rawCoef(tmpRem)=[];

%fprintf('\n')
%fprintf(strcat(num2str(numel(tmpRem)),' Invalid Structures Removed '))



save(strcat(params.exptdir,'/','model_parameters.mat'),'params');
fprintf('\n')
fprintf('Structures Saved');

end