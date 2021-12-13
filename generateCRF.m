function [params,results,best_model] = generateCRF()
% 
% Consolidated Function
% Darik O'Neil 12-13-2021, Rafael Yuste Laboratory
% 
% Purpose:
% Primary, consolidated function for one-stop shop generation for 
% Ensemble and Motif Analysis using Probabilistic Graphical Modeling.
%
% To accomplish this we do six-steps
% (1, Initialization): takes a set of parameters 'params' 
% (2, Validation): validates these parameters
% (3, Structural Learning): learns a graphical structure describing the data
% (4, Parameter Estimation): learns the parameters that describe their mutual dependencies, 
% (5, Ensemble Indentification): learns the ensemble which encode a set of user-defined features
% (6, Motif Identification): identifies motifs in their composition.
% 
% Input: a set of params may be fed to the function 
%
% See Read-me for further details

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% (1, Initialization): Here we take the set of parameters and run a
% start-up function to import our data, initialize parameters, and
% establish paths

[params] = start_up(); %start-up function

% (2, Validation): Here we validate the data to make sure it is
% commensurable with our requirements
[params] = validateData(params); %validation function

% (3, Structural Learning): Here we learn graphical structures that
% describe the permissible dependencies of the features in our dataset
[params] = structuralLearning(params); %structural learning function

% (4, Parameter Estimatino): Here we estimate the parameters that describe
% the mutual dependencies of our graphical structures
[params] = estimateParameters(params); %parameter estimation function

% (5, Ensemble Indetification): Here we identify the enembles which encode
% user-defined features
[params] = identifyEnsembles; %ensemble identification function

% (6, Motif Identification): Here we identify motifs within the composition
% of these ensembles
[params] = identifyMotifs; %motif identification function

end








