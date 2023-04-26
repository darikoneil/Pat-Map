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

**data**: M sample by N neuron dataset originally passed to PatMap              

**global_cluster_coefficient**: global clustering coefficient of best model structure

**identified_ensemble_performance**: Structure containing a performance metric structure for ensemble decoding on full, training, and test datasets. Each performance metric structure contains:                  

**log_likelihood_by_frame**: M node by N sample matrix containing the log-likelihood ratio of models in which the respective node is forced ON or OFF

**ensemble_nodes**: Cell array whose length is equal to the number of user-defined features. Each cell array contains a 1-order index of the identified ensembles neurons.      

**model_collection**: Structure containing:                 
* *models*: M model cell vector containing learned models. Each model is a stucture containing the same fields as the previously described *best_model*                 * *x_train*: M sample by N node training dataset      
* *x_test*: M sample by N node testing dataset     
* *x_valid*: M sample by N node validation dataset 

**models**: M seed model cell vector containing seed models. Each model is a stucture containing the same fields as the previously described *best_model*                 
**model_performance**: Structure containing a performance metric structure for model decoding on full, training, and test datasets. Each performance metric structure contains: 

**optimization_results**: snapshot of hyperparameter optimization object. 

**node_scores**: M neuron vector containing sum of 11 potentials for each node                      

**pattern_completion_nodes**: Cell array whose length is equal to the number of user-defined features. Each cell array contains a 1-order index of the identified pattern completion neurons.     

**random_ensemble_performance**: M number of user-defined features cell vector containing the AUC-ROC or AUC-PR performance of N random ensembles

**rois**: Structure of rois passed to PatMap. Contains:               
* *xpix*: M neuron cell vector containing x pixels for the mask of each roi               
* *ypix*: M neuron cell vector containing y pixels for the mask of each roi               
* *boundaryOutlines*: M neuron cell vector containing the index of pixels used to outline the roi             

**udf**: M sample by N user-defined feature matrix originally passed to PatMap                     

**udf_labels**: Cell array containing a text label associated with each user-defined features
