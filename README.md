# Ensemble and Motif Analysis using Probabilistic Graphical Modeling  
Matlab code to generate log-linear conditional random field models that identify neuronal ensembles and their motifs. Default motifs are pattern completion neurons and pattern suppression neurons, though it is easy to incorporate additional analysis. The pipeline uses GLM-driven neighborhood-based structural learning and MLE-Struc for parameter estimation. For improved performance, (increasing) aspects of the primary bottlenecks (structural learning, parameter estimation) are implemented in FORTRAN and C++. Secondary bottleneck is the massive amount of matrix multiplication possible in assessing each neuron's contribution to the model; in these cases, make sure to use the parallel processing flag ('parProc'). 
## Contains:  
    Initialization GUI (Version 1.0)  
    Analysis GUI (Version 0.8)  
    C++ Wrapper for Windows (Version 1.0, just a modified version of MexCPP)  
    Precompiled QPBO solvers for Windows and Linux (Source files included for Mac)          
    Compatible Solvers for Float & Double Precision.

## Third Party Dependencies  
    MexCPP (I modified this for windows)  
    QPBO-v1.32 (Kui Tang's implementation. I modified this by removing the rounding step for the WS compilation)
    GLMNet
    ParWaitBar  
    MLE-Struc
    CmdLineProgressBar
    

### Changelog: 
    05/12/2022: Pushed Merged GUI / .exe
    03/10/2022: Single function push to fix memory leak in ensemble identification function
    02/01/2022: Hotfix for blank structures
    01/13/2022: Multiclass classifier analysis panel integrated
    01/13/2022: Multiclass classifier function pushed
    01/12/2022: Pushed float solver (matlab's single precision)
    01/12/2022: Improved Logging Console
    01/12/2022: Integrated decoding panel in analysis GUI
    01/10/2022: Fixed bug in alpha parameter
    01/10/2022: Removed 10-fold cross-validation during neighborhood-wise structural learning at default settings.
    01/10/2022: Adjusted QPBOSolve.m function to remove unnecessary type-checking & reintegrate associated speed-boost
    01/02/2022: Reduced GUI memory load 
    12/30/2021: General tweaks to ensemble panel
    12/30/2021: Pushed ensemble structure plot
    12/30/2021: Fixed bug in storing/plotting size performance of multiple ensembles        
    12/28/2021: Pushed 'aesthetic' ensemble analysis GUI
    12/22/2021: Pushed working draft of ensemble panel of analysis GUI          
    12/22/2021: Added function for analysis of complete model prediction performance        
    12/22/2021: Added function for evaluation of ensembles          
    12/16/2021: Fixed bug in tensor reshaping during identify ensembles
    12/14/2021: Pushed new parameters and identify motifs function
    12/14/2021: Pushed new compilation of GLMNet to fix crash to desktop issues when using Matlab 2020b
    12/13/2021: Incorporated tensor-based/no-loop log-likelihood & support for parallel processing (parProc)
    12/13/2021: Pushed simplified functions and parameter design
    12/13/2021: Partial push (unincorporated, just to backup)     
    12/10/2021: Added tensor-based/no-loop log-likelihood by frame function (not incorporated)      
    12/10/2021: Added no-loop average log-likelihood function (not incorporated)
    11/30/2021: Updated Readme        
    11/29/2021: Added pre-compiled mex functions with wrapper interface for C++   
    11/29/2021: Removed rounding step in QPBO solver (for now at least)  

### To-Do (Order of Priority) 
    Log model convergence       
    Permit use of integers in pre-compiled code         
    Fnish integrating 'aesthetic' individual GUIs & import into one application         
    Permit rescaling for floating point error mitigation   
    Investigate Performance Impacts of Rounding via Boost Library   
    Parallel QPBO/BK implementation for better performance on larger datasets^      
    Multi-Plane Block-Coordinate Frank Wolfe implementation for better performance on larger datasets^         
    Integrate Initialization/Analysis into Single Application     

^ *Parallel QPBO/BK (P-QPBO) is probably a more fruitful performance boost because its dreadfully serialized and is currently a primary bottleneck. Not sure if both MP-BCWF & P-QPBO will be implemented and/or play nice. Ultimately, distributing the linesearch is probably the best move and is currently nearly ready to push (02/21/22).      
              


### Instructions
        "generateCRF" function is one-stop shop

        The "start_up" function will facilitate locating your datafile and relevant paths       
        From here, send arguments to the "validateData" function to generate and preprocess the dataset
        To learn structures, use the "structuralLearning" function
        To estimate parameters, use the "estimateParameters" function
        To identify ensembles, use the "identifyEnsembles" function
        To identify motifs using the overcomplete edge scores, using "identifyMotifs" function          
        To evaluate ensemble and model performance, use the "evaluateEnsembles" function
        To explore the different options, open the "validateData" function and read documentation       
        Note that float solver accumulates errors at a more rapid rate than double precision without offering noticeable improvements in iteration time.        
        
  ### Known Issues         
       Need to split ensemble evaluation into multiple functions        
       Size optimization method may not be appropriate when increasing size
       Documentation is not appropriately built at Read the Docs        
       Random ensembles threshold not appropriate for inhibitory neurons with dense connectivity
       
       
       
