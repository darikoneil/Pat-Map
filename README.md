### PatMap: Identifying Pattern Completion Neurons in Neuronal Ensembles
Darik A. O'Neil, Alejandro Akrouh, & Rafael Yuste.

PatMap contains code and a simple graphical user interface for detecting pattern completion neurons using the approach utilized in [Identification of Pattern Completion Neurons in Neuronal Ensembles Using Probabilistic Graphical Models](https://www.jneurosci.org/content/41/41/8577).

##### Hardware:
Memory: scales with dataset size; a minimum of 8GB required. 

##### Licensed Software:
Matlab 2020b (Recommended), >=Matlab 2019a (Required)

##### Operating System:
PatMap is functional on Windows, Linux, and Mac operating systems.

##### Included Dependencies:
* MexCPP
* QPBO v1.32
* GLMNet
* ParWaitBar
* CmdLineProgressBar

##### Installation
No installation is required. Simply enter PatMap in the matlab terminal.

##### DEV Roadmaps & Changelogs

Version v1.0.1 - 04/20/2023
* More consistent namespace/conventions + general refactoring
* Increased verbosity of validation & enhanded data cleaning
* Option to overlay rois over imaging z-projection & graphical structure
* Improved data segmentation
* SMBO for hyperparameters (sequential model-based optimization)
* Live feed of optimization
* Option to pass a single multi class indicator vector for UDFs
* Parameter explanations on hover
* Button tooltips on hover
* Enhanced visualizer of graphical models
* Hotkeys

##### TODO v2.0.0 - TBD
* Incorporate temporal interactions from experimental branch
* Additional methods for dataset segmentation
* Support for additional hyperparameters

##### TODO vX.X.X - TBD
* cross-platform/language migration
