**auc_threshold**: 5 x number of user-defined features matrix in each which each column contains the values for 1 standard deviation below the mean performance of random ensembles, the mean performance of random ensembles, 1 standard deviation below the mean performance of random ensembles, the upper threshold for selecting ensemble members ( number of selected deviations * standard deviations plus the mean performance of random ensembles) and the number of selected deviations * standard deviations minus the mean performance of random ensembles      

**best_model**: A structure containing the best model. It contains:     
* *x_train*: M sample by N node training dataset      
* *x_test*: M sample by N node testing dataset     
* *x_valid*: M sample by N node validation dataset
* *s_lambda*: s_lambda value for this particular model
* *p_lambda*: p_lambda value for this particular model
* *structure*: graphical structure in the form of an M node by N node adjacency matrix      
* *max_degree*: maximum number of edges for one node in the model     
* *median_degree*: the most common number of edges for nodes in the model     
* *mean_degree*: the average number of edges for nodes in the model     
* *rms_degree*: root-mean square number of edges for nodes in the model
* *reweight*: reweighting value used in the Bethe approximation of the partition function     
* *train_likelihood*: average log-likelihood of each frame in training dataset
* *test_likelihood*: average log-likelihood of each frame in test dataset     
* *valid_likelihood*: average log-likelihood of each frame in validation dataset
* *best_model_index*: index of best model in model collection
* *theta*: a structure containing the estimated parameters
           * *F*: 2 x N node matrix of overcomplete node potentials (phi 0, phi 1)
           * *G*: 4 x N edge matrix of overcomplete edge potentials (phi 00, phi 01, phi 10, phi 11)
           * *node_potentials*: M node vector of potentials for each node. Equal to sum of phi's 0 & 1
           * *edge_potentials*: M node by N node weighted adjacency matrix of potentials for each edge. Equal to sum of phi's 11, 00, 01, 10
           * *lambda*: value of p lambda
           * *logZ*: log-partition function

**ensemble_nodes**: Cell array whose length is equal to the number of user-defined features. Each cell array contains a 1-order index of the identified ensembles neurons.      

**pattern_completion_nodes**: Cell array whose length is equal to the number of user-defined features. Each cell array contains a 1-order index of the identified pattern completion neurons.     

#####
