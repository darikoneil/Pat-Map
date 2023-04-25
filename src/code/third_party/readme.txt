This folder contains several third-party dependencies:

    • CmdLineProgressBar for single-process actions
    • parwaitbar for parallel actions
    • glmnet_matlab for glmnet/matlab support of glmnet
    • QPBO 1.32 for quadratic pseudoboolean optimization *
    • libgfortran3.so for forwards compatibility of glmnet in recent linux distributions which consider libgfortran3 deprecated and unretrievable from source due to gcc compatability issues
    • Mexcpp for seamless interfacing between Matlab and QPBO *
      
* denote modification from original source for use with this application

If you run into segmentation faults on linux or macos, recompiling the mex functions will solve the issue. If you're on windows and for some reason have issues, full recompilation is a bit nasty due to some issues with obtaining the correct compiler & licensing. Try downloading from source again to see if it was just corrupted first. If recompiling doesn't work, you can reach out to me directly to walk you through it. Hopefully MATLAB and/or Intel solve this peculiar conundrum.


UPDATED: Darik A. O’Neil, 04/23/2023
      

