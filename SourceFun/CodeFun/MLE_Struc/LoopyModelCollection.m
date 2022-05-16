classdef LoopyModelCollection

    properties
        %Properties & Definitions
       
        models;
        x_train; x_test;
        computed_true_logZ;%archaic
        hidden_model;%arhaic
      
    end

    methods
        function self = LoopyModelCollection(models,params)
           self.models = models;
           self.x_train=params.x_train;
           self.x_test=params.x_test;
        end
                
        function self = do_parameter_estimation(self, BCFW_max_iterations, BCFW_fval_epsilon,...
                computed_true_logZ, reweight_denominator, printInterval, printTest, MaxTime)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%PARAMETER ESTIMATION%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

           %Iterate through non-modeled models and estimate parameters
           %(lol, tongue twister)
           L = numel(self.models);
            for i = 1:L
                if self.models{i}.pending_parameter_estimation == true
                    model = self.models{i};
                    fprintf('\n')
                    fprintf(strcat(num2str(i),' of'))
                    fprintf(' ');
                    fprintf(num2str(L))
                    fprintf('\n')
                    fprintf('\nParameter Estimation: s_lambda=%e; p_lambda=%e\n',...
                    model.s_lambda, model.p_lambda);
               
                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%OVERPARAMETERIZATION%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               

                % First we need to overcomplete the structure/samples to
                % run parameter estimation. 
                
                % We can save time by using an overcomplete_struct from the
                % prior model if the s_lambda is identical
                
                
               
                if i == 1 || any(any(self.models{i-1}.structure ~= model.structure))
                    overcomplete_struct = samples_to_overcomplete(self.x_train, model.structure);
                end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%REWEIGHTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Next we need to reweight to ensure a convex free-energy

                % define the reweight parameter
                if ischar(reweight_denominator)
                    if strcmp(reweight_denominator, 'max_degree')
                        reweight = 2/model.max_degree;
                    elseif strcmp(reweight_denominator, 'median_degree')
                        reweight = 2/model.median_degree;
                    elseif strcmp(reweight_denominator, 'mean_degree')
                        reweight = 2/model.mean_degree;
                    elseif strcmp(reweight_denominator, 'rms_degree')
                        reweight = 2/model.rms_degree;
                    else
                        error('Unknown reweighting denominator ''%s''', reweight_denominator);
                    end
                else
                   reweight = 2/reweight_denominator;
                end

                % sanity check
                if reweight > 1
                    reweight = 1;
                end

                % saves the reweight for future cross-validation
                model.reweight = reweight;

               % Now we create our model object.
                loopy_model_train_object = Ising( ...
                    overcomplete_struct.YN, ...
                    overcomplete_struct.YE, ...
                    overcomplete_struct.Ut, ...
                    overcomplete_struct.Vt, ...
                    overcomplete_struct.Ns, ...
                    overcomplete_struct.edges, ...
                    model.p_lambda, ...
                    'checkStuck', false, ...
                    'reweight', reweight);
             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%BCFW%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Now we actually do the meat n potatoes

%First we create/run the BCFW on our object

                bcfw = BCFW(loopy_model_train_object, ...
                    'printInterval', printInterval, ...
                    'printTest', printTest, ...
                    'printComputedDualityGap',true,...
                    'MaxTime',MaxTime,...
                    'MaxIter', BCFW_max_iterations, ...
                    'fvalEpsilon', BCFW_fval_epsilon);
                
                bcfw.run();
                %bcfw.fastrun();

%We now extract F and G, which score the two neuron states (ON/OFF) and
%four connectivity states (ON-ON, ON-OFF, OFF-ON, OFF-OFF). These are in
%the format of 2xNode 4xEdge by the way. These are the Phi's. 

                model.theta = bcfw.obj.computeParams();

%We now approx. the partion function which globally
%normalizes our scores
                
                logZ = bcfw.obj.partition_function(model.theta);

%We now convert F and G into the node and edge potentials of our model, and
%adjust partition function. Now we have a nice graphical model.
                fprintf('Converting F and G to node and edge potentials\n');
                [node_pot, edge_pot, logZ_pot] = get_node_and_edge_potentials(model.theta.F,...
                    model.theta.G, logZ, overcomplete_struct.edges{1}');
                model.theta.node_potentials = node_pot;
                model.theta.edge_potentials = edge_pot;
                model.theta.logZ = logZ_pot;
                model.theta.logZ_logZ = logZ;

%If you want you can compute exact true_logZ and true_node_marginals, but
%this is very computationally expensive and you almost certainly shouldn't.

                if self.computed_true_logZ
                    fprintf('Starting to run JTA to compute true partition function\n');
                    [true_node_marginals,~,~,~,~,~,true_logZ] = run_junction_tree(node_pot, edge_pot, 'verbose', true);
                    model.theta.true_logZ = true_logZ;
                    model.true_node_marginals = true_node_marginals;
                end           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%ASSESS MODEL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

                % Compute training likelihood
                    fprintf('Computing training likelihood\n');
                    model.train_likelihood = compute_avg_log_likelihood_no_loop( ...
                        model.theta.node_potentials, ...
                        model.theta.edge_potentials, ...
                        model.theta.logZ, ...
                        self.x_train);

                    % Compute test likelihood
                    fprintf('Computing test likelihood\n');
                    model.test_likelihood = compute_avg_log_likelihood_no_loop( ...
                        model.theta.node_potentials, ...
                        model.theta.edge_potentials, ...
                        model.theta.logZ, ...
                        self.x_test);
                    model.pending_parameter_estimation = false;
                    self.models{i} = model;
                end
            end
	    fprintf('\n')
            fprintf('Finished estimating parameters.\n');

         end
    end
end

