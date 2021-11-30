# Ensemble and Motif Analysis using Probabilistic Graphical Modeling  
Matlab code for using neighborhood-based regularization for structural learning and parameter estimation via condition random fielding modeling to identify ensembles and their motifs. Default motifs are pattern completion neurons and pattern suppression neurons, though it is easy to incorporate additional analysis. For improved performance, primary bottlenecks (structural learning, parameter estimation) are implemented in FORTRAN and C++. 

## Contains:  
Initialization GUI (Version 1.0)  
Analysis GUI (Version 0.69)  
C++ Wrapper for Windows (Version 1.0, modified version of MexCPP)  
Precompiled QPBO solvers for Windows and Linux (Source files included for Mac)  

## Third Party Dependencies  
MexCPP (Linux, modified for windows)  
QPBO-v1.32 (Kui Tang's implementation with rounding modification in WS precompilation)  
GLMNet  
ParWaitBar  
MLE-Struc  

### Changelog: 
11/30/2021: Updated Readme  
11/29/2021: Added pre-compiled mex functions with wrapper interface for C++   
11/29/2021: Removed rounding step in QPBO solver (for now at least)  

### To-Do (Order of Priority)  
Investigate Performance Impacts of Rounding via Boost Library  
Finish import of old functions to new Analysis GUI  
Implement structured prediction/secondary analysis into better performing language  
Integrate Initialization/Analysis into Single Application  
