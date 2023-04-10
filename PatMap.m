classdef PatMap < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        IOPanel                         matlab.ui.container.Panel
        LoggingConsoleLabel             matlab.ui.control.Label
        PatMapLabel                     matlab.ui.control.Label
        v101Label                       matlab.ui.control.Label
        LogTextArea                     matlab.ui.control.TextArea
        ExportButton                    matlab.ui.control.Button
        TabGroup                        matlab.ui.container.TabGroup
        IOTab                           matlab.ui.container.Tab
        ParamsPanel                     matlab.ui.container.Panel
        ParamsFilePath                  matlab.ui.control.EditField
        BrowseParams                    matlab.ui.control.Button
        LoadParams                      matlab.ui.control.Button
        SaveParams                      matlab.ui.control.Button
        ParametersLabel                 matlab.ui.control.Label
        ShuffleDataEditFieldLabel       matlab.ui.control.Label
        ShuffleDataEditField            matlab.ui.control.NumericEditField
        ParallelProcessingEditFieldLabel  matlab.ui.control.Label
        ParallelProcessingEditField     matlab.ui.control.NumericEditField
        TrainingTestingSplitEditFieldLabel  matlab.ui.control.Label
        TrainingTestingSplitEditField   matlab.ui.control.NumericEditField
        AlphaEditFieldLabel             matlab.ui.control.Label
        AlphaEditField                  matlab.ui.control.NumericEditField
        DensityEditFieldLabel           matlab.ui.control.Label
        DensityEditField                matlab.ui.control.NumericEditField
        NumberofsLambdaEditFieldLabel   matlab.ui.control.Label
        NumberofsLambdaEditField        matlab.ui.control.NumericEditField
        MinimumsLambdaEditFieldLabel    matlab.ui.control.Label
        MinimumsLambdaEditField         matlab.ui.control.NumericEditField
        MaximumsLambdaEditFieldLabel    matlab.ui.control.Label
        MaximumsLambdaEditField         matlab.ui.control.NumericEditField
        sLambdaDistributionEditFieldLabel  matlab.ui.control.Label
        sLambdaDistributionEditField    matlab.ui.control.NumericEditField
        TemporalInteractionsEditFieldLabel  matlab.ui.control.Label
        TemporalInteractionsEditField   matlab.ui.control.NumericEditField
        MergeNodeClassesEditField       matlab.ui.control.NumericEditField
        MergeNodeClassesEditFieldLabel  matlab.ui.control.Label
        UDFUDFInteractionsEditFieldLabel  matlab.ui.control.Label
        UDFUDFInteractionsEditField     matlab.ui.control.NumericEditField
        RankAbsoluteValueofCoefficientsEditField  matlab.ui.control.NumericEditField
        RankAbsoluteValueofCoefficientsEditFieldLabel  matlab.ui.control.Label
        NumberofpLambdaEditFieldLabel   matlab.ui.control.Label
        NumberofpLambdaEditField        matlab.ui.control.NumericEditField
        MinimumpLambdaEditFieldLabel    matlab.ui.control.Label
        MinimumpLambdaEditField         matlab.ui.control.NumericEditField
        MaximumpLambdaEditFieldLabel    matlab.ui.control.Label
        MaximumpLambdaEditField         matlab.ui.control.NumericEditField
        fValEpsilonEditFieldLabel       matlab.ui.control.Label
        fValEpsilonEditField            matlab.ui.control.NumericEditField
        MaxIterationsEditFieldLabel     matlab.ui.control.Label
        MaxIterationsEditField          matlab.ui.control.NumericEditField
        MaximumTimetoConvergenceEditFieldLabel  matlab.ui.control.Label
        MaximumTimetoConvergenceEditField  matlab.ui.control.NumericEditField
        PrintIntervalEditFieldLabel     matlab.ui.control.Label
        PrintIntervalEditField          matlab.ui.control.NumericEditField
        ImplementationModeEditFieldLabel  matlab.ui.control.Label
        ImplementationModeEditField     matlab.ui.control.NumericEditField
        NumberofStructuresEditFieldLabel  matlab.ui.control.Label
        NumberofStructuresEditField     matlab.ui.control.NumericEditField
        NumberofModelsEditFieldLabel    matlab.ui.control.Label
        NumberofModelsEditField         matlab.ui.control.NumericEditField
        NumberofRandomControlsEditFieldLabel  matlab.ui.control.Label
        NumberofRandomControlsEditField  matlab.ui.control.NumericEditField
        IncludeUDFinEnsemblesEditFieldLabel  matlab.ui.control.Label
        IncludeUDFinEnsemblesEditField  matlab.ui.control.NumericEditField
        pLambdaDistributionEditFieldLabel  matlab.ui.control.Label
        pLambdaDistributionEditField    matlab.ui.control.NumericEditField
        AssessDecodingEditFieldLabel    matlab.ui.control.Label
        AssessDecodingEditField         matlab.ui.control.NumericEditField
        ReweightDenominatorDropDownLabel  matlab.ui.control.Label
        ReweightDenominatorDropDown     matlab.ui.control.DropDown
        TuningCriterionDropDownLabel    matlab.ui.control.Label
        TuningCriterionDropDown         matlab.ui.control.DropDown
        EnsembleSizeDropDownLabel       matlab.ui.control.Label
        EnsembleSizeDropDown            matlab.ui.control.DropDown
        AssessClusteringEditFieldLabel  matlab.ui.control.Label
        AssessClusteringEditField       matlab.ui.control.NumericEditField
        GeneralLabel                    matlab.ui.control.Label
        StructuralLearningLabel         matlab.ui.control.Label
        ParameterEstimationLabel        matlab.ui.control.Label
        ParallelLearningEditFieldLabel  matlab.ui.control.Label
        ParallelLearningEditField       matlab.ui.control.NumericEditField
        IOModelPanel                    matlab.ui.container.Panel
        NewModelPanel                   matlab.ui.container.Panel
        InitializeNewModelLabel         matlab.ui.control.Label
        NewModelButton                  matlab.ui.control.Button
        NewModelEditField               matlab.ui.control.EditField
        DataFilePath                    matlab.ui.control.EditField
        BrowseData                      matlab.ui.control.Button
        LoadData                        matlab.ui.control.Button
        UDFFilePath                     matlab.ui.control.EditField
        BrowseUDF                       matlab.ui.control.Button
        LoadUDF                         matlab.ui.control.Button
        ROIsFilePath                    matlab.ui.control.EditField
        BrowseROIs                      matlab.ui.control.Button
        LoadROIs                        matlab.ui.control.Button
        ValidateData                    matlab.ui.control.Button
        RunModel                        matlab.ui.control.Button
        IOExistingPanel                 matlab.ui.container.Panel
        ImportExistingModelLabel        matlab.ui.control.Label
        ModelPath                       matlab.ui.control.EditField
        BrowseModel                     matlab.ui.control.Button
        LoadModel                       matlab.ui.control.Button
        StructuresLamp                  matlab.ui.control.Lamp
        PotentialsLamp                  matlab.ui.control.Lamp
        NeuronsLamp                     matlab.ui.control.Lamp
        EnsemblesLamp                   matlab.ui.control.Lamp
        PCLamp                          matlab.ui.control.Lamp
        StructuresLabel                 matlab.ui.control.Label
        PotentialsLabel                 matlab.ui.control.Label
        NeuronsLabel                    matlab.ui.control.Label
        EnsemblesLabel                  matlab.ui.control.Label
        PatCompLabel                    matlab.ui.control.Label
        ParamsLamp                      matlab.ui.control.Lamp
        ParamsLabel                     matlab.ui.control.Label
        SpikeDataLamp                   matlab.ui.control.Lamp
        SpikesLabel                     matlab.ui.control.Label
        UDFLamp                         matlab.ui.control.Lamp
        UDFLabel                        matlab.ui.control.Label
        ROIsLamp                        matlab.ui.control.Lamp
        ROIsLabel                       matlab.ui.control.Label
        BestModelLamp                   matlab.ui.control.Lamp
        BestModelLabel                  matlab.ui.control.Label
        SLTab_2                         matlab.ui.container.Tab
        OptimizationPanel               matlab.ui.container.Panel
        TabGroup3                       matlab.ui.container.TabGroup
        Tab1                            matlab.ui.container.Tab
        OptInterface_PE                 matlab.ui.container.Panel
        AddLambdaSpecificField_PE       matlab.ui.control.NumericEditField
        AddLambdaButton_PE              matlab.ui.control.Button
        PlotModelEditField_PE           matlab.ui.control.NumericEditField
        PlotModel_PE                    matlab.ui.control.Button
        SLambdaModelEditField           matlab.ui.control.NumericEditField
        PLambdaModelEditField           matlab.ui.control.NumericEditField
        sLambdaLabel                    matlab.ui.control.Label
        pLambdaLabel                    matlab.ui.control.Label
        ImplementationModeLabel         matlab.ui.control.Label
        ImplementationModeEditField_PE  matlab.ui.control.NumericEditField
        Tab2                            matlab.ui.container.Tab
        OptInterface                    matlab.ui.container.Panel
        PreviewLambdaButton             matlab.ui.control.Button
        AddStructuresPreviewField       matlab.ui.control.NumericEditField
        AddStructuresSpecificField      matlab.ui.control.NumericEditField
        AddLambdaButton                 matlab.ui.control.Button
        Tab3                            matlab.ui.container.Tab
        OptInterface_2                  matlab.ui.container.Panel
        PreviewLambdaButton_2           matlab.ui.control.Button
        AddStructuresPreviewField_2     matlab.ui.control.NumericEditField
        AddStructuresSpecificField_2    matlab.ui.control.NumericEditField
        AddLambdaButton_2               matlab.ui.control.Button
        TabGroup2                       matlab.ui.container.TabGroup
        StructuralLearningTab           matlab.ui.container.Tab
        SLParams                        matlab.ui.container.Panel
        StructuralLearningParametersLabel  matlab.ui.control.Label
        ElasticNetLabel                 matlab.ui.control.Label
        LambdaLabel                     matlab.ui.control.Label
        ConstraintsLabel                matlab.ui.control.Label
        UDFUDFInteractionsEditFieldLabel_2  matlab.ui.control.Label
        UDFUDFInteractionsEditField_SL  matlab.ui.control.NumericEditField
        RankAbsoluteValueofCoefficientsEditField_SL  matlab.ui.control.NumericEditField
        RankAbsoluteValueofCoefficientsEditFieldLabel_2  matlab.ui.control.Label
        ParallelProcessingEditField_2Label  matlab.ui.control.Label
        ParallelProcessingEditField_SL  matlab.ui.control.NumericEditField
        AlphaEditField_2Label           matlab.ui.control.Label
        AlphaEditField_SL               matlab.ui.control.NumericEditField
        MergeNodeClassesEditField_SL    matlab.ui.control.NumericEditField
        MergeNodeClassesEditFieldLabel_2  matlab.ui.control.Label
        NumberofLambdaLabel             matlab.ui.control.Label
        NumberofsLambdaEditField_SL     matlab.ui.control.NumericEditField
        MinimumLambdaLabel              matlab.ui.control.Label
        MinimumsLambdaEditField_SL      matlab.ui.control.NumericEditField
        MaximumLambdaLabel              matlab.ui.control.Label
        MaximumsLambdaEditField_SL      matlab.ui.control.NumericEditField
        LambdaDistributionLabel         matlab.ui.control.Label
        sLambdaDistributionEditField_SL  matlab.ui.control.NumericEditField
        DensityEditField_2Label         matlab.ui.control.Label
        DensityEditField_SL             matlab.ui.control.NumericEditField
        RunningSL                       matlab.ui.container.Panel
        LearningLabel                   matlab.ui.control.Label
        PerformStructuralLearningButton  matlab.ui.control.Button
        FirstPassStructuresEditFieldLabel  matlab.ui.control.Label
        FirstPassStructuresEditField    matlab.ui.control.NumericEditField
        PreviewPassedStructuresButton   matlab.ui.control.Button
        TotalPassedStructuresEditFieldLabel  matlab.ui.control.Label
        TotalPassedStructuresEditField  matlab.ui.control.NumericEditField
        SelectedLambdasLabel            matlab.ui.control.Label
        PreviewAllStructuresButton      matlab.ui.control.Button
        PassAdditionalStructuresButton  matlab.ui.control.Button
        PassAddStructField              matlab.ui.control.NumericEditField
        SelectedLambdasTextArea         matlab.ui.control.TextArea
        ParameterSpacePanel_SL          matlab.ui.container.Panel
        DegreesSL                       matlab.ui.container.Panel
        ParameterEstimationTab          matlab.ui.container.Tab
        PEParams                        matlab.ui.container.Panel
        ParameterEstimationSettingsLabel  matlab.ui.control.Label
        LearningLabel_PE                matlab.ui.control.Label
        LambdaLabel_PE                  matlab.ui.control.Label
        ReportingExpensesLabel          matlab.ui.control.Label
        MaxTimeLabel_PE                 matlab.ui.control.Label
        MaxTimeEditField_PE             matlab.ui.control.NumericEditField
        PrintTestEditField_PE           matlab.ui.control.NumericEditField
        PrintTestLabel_PE               matlab.ui.control.Label
        ParallelProcessingEditField_2Label_2  matlab.ui.control.Label
        ParallelProcessingEditField_PE  matlab.ui.control.NumericEditField
        fValEpsilonLabel                matlab.ui.control.Label
        fValEpsilonEditField_PE         matlab.ui.control.NumericEditField
        ComputeTrueLogZEditField_PE     matlab.ui.control.NumericEditField
        ComputeTrueLogZLabel_PE         matlab.ui.control.Label
        NumberofLambdaLabel_2           matlab.ui.control.Label
        NumberofpLambdaEditField_PE     matlab.ui.control.NumericEditField
        MinimumLambdaLabel_2            matlab.ui.control.Label
        MinimumpLambdaEditField_PE      matlab.ui.control.NumericEditField
        PrintIntervalLabel              matlab.ui.control.Label
        PrintIntervalEditField_PE       matlab.ui.control.NumericEditField
        MaximumLambdaLabel_2            matlab.ui.control.Label
        MaximumpLambdaEditField_PE      matlab.ui.control.NumericEditField
        LambdaDistributionLabel_2       matlab.ui.control.Label
        pLambdaDistributionEditField_PE  matlab.ui.control.NumericEditField
        MaxIterationsLabel              matlab.ui.control.Label
        MaxIterEditField_PE             matlab.ui.control.NumericEditField
        ReweightDenominatorDropDown_2Label  matlab.ui.control.Label
        ReweightDenominatorDropDown_PE  matlab.ui.control.DropDown
        Learning_PE                     matlab.ui.container.Panel
        LearningLabelPanel_PE           matlab.ui.control.Label
        PerformParameterEstimationButton  matlab.ui.control.Button
        FirstPassModelsLabel            matlab.ui.control.Label
        FirstPassModelsEditField        matlab.ui.control.NumericEditField
        TotalLearnedModelsLabel         matlab.ui.control.Label
        TotalLearnedModelsEditField     matlab.ui.control.NumericEditField
        SelectedLambdasLabel_PE         matlab.ui.control.Label
        ModelsUnlearnedEditField        matlab.ui.control.NumericEditField
        SelectedLambdasTextArea_PE      matlab.ui.control.TextArea
        ModelsUnlearnedLabel            matlab.ui.control.Label
        LearnAdditionalModelsButton     matlab.ui.control.Button
        ParameterSpacePanel_PE          matlab.ui.container.Panel
        Potentials_PE                   matlab.ui.container.Panel
        BandwidthEditFieldLabel         matlab.ui.control.Label
        BandwidthEditField              matlab.ui.control.NumericEditField
        BandwidthEditField_2Label_2     matlab.ui.control.Label
        BandwidthEditField_2            matlab.ui.control.NumericEditField
        EVModel                         matlab.ui.container.Tab
        BigDecodingPlot                 matlab.ui.container.Panel
        EVParams                        matlab.ui.container.Panel
        ModelEvaluationLabel            matlab.ui.control.Label
        TrainTestWeightLabel            matlab.ui.control.Label
        TrTstWeighting                  matlab.ui.control.NumericEditField
        ReselectBestModelButton         matlab.ui.control.Button
        EvaluateBestModelButton         matlab.ui.control.Button
        AssessClusteringLabel           matlab.ui.control.Label
        AssessClustering                matlab.ui.control.NumericEditField
        TestLikelihoodLabel             matlab.ui.control.Label
        TestEM                          matlab.ui.control.NumericEditField
        BestModelIDLabel                matlab.ui.control.Label
        BestModelID                     matlab.ui.control.NumericEditField
        sLambdaLabel_3                  matlab.ui.control.Label
        sLambdaEM                       matlab.ui.control.NumericEditField
        pLambdaLabel_2                  matlab.ui.control.Label
        pLambdaEM                       matlab.ui.control.NumericEditField
        TrainLikelihoodLabel            matlab.ui.control.Label
        TrainEM                         matlab.ui.control.NumericEditField
        AssessDecodingLabel_2           matlab.ui.control.Label
        AssessDecoding                  matlab.ui.control.NumericEditField
        GlobalLabel                     matlab.ui.control.Label
        GlobalEM                        matlab.ui.control.NumericEditField
        LocalLabel                      matlab.ui.control.Label
        LocalEM                         matlab.ui.control.NumericEditField
        ClusteringCoefficientsLabel     matlab.ui.control.Label
        MaxDegreeLabel                  matlab.ui.control.Label
        MaxEM                           matlab.ui.control.NumericEditField
        MeanDegreeLabel                 matlab.ui.control.Label
        MeanEM                          matlab.ui.control.NumericEditField
        MedianDegreeLabel               matlab.ui.control.Label
        MedianEM                        matlab.ui.control.NumericEditField
        RMSDegreeLabel                  matlab.ui.control.Label
        RMSEM                           matlab.ui.control.NumericEditField
        EdgesLabel                      matlab.ui.control.Label
        EdgesEM                         matlab.ui.control.NumericEditField
        PredictionPerformancePanel_Decoding  matlab.ui.container.Panel
        TruePositiveEditField_2Label    matlab.ui.control.Label
        TruePositiveEditField_Decoding  matlab.ui.control.EditField
        FalsePositiveEditField_2Label   matlab.ui.control.Label
        FalsePositiveEditField_Decoding  matlab.ui.control.EditField
        TrueNegativeEditField_2Label    matlab.ui.control.Label
        TrueNegativeEditField_Decoding  matlab.ui.control.EditField
        FalseNegativeEditField_2Label   matlab.ui.control.Label
        FalseNegativeEditField_Decoding  matlab.ui.control.EditField
        ThresholdLabel                  matlab.ui.control.Label
        Threshold_Edit_Field_Decoding   matlab.ui.control.EditField
        SpecificityEditField_2Label     matlab.ui.control.Label
        SpecificityEditField_Decoding   matlab.ui.control.EditField
        SensitivityEditField_2Label     matlab.ui.control.Label
        SensitivityEditField_Decoding   matlab.ui.control.EditField
        AccuracyEditField_2Label        matlab.ui.control.Label
        AccuracyEditField_Decoding      matlab.ui.control.EditField
        PrecLabel_Decoding              matlab.ui.control.Label
        PrecEditField_Decoding          matlab.ui.control.EditField
        AUC_ROC_LABEL_Decoding          matlab.ui.control.Label
        AUC_ROC_EditField_Decoding      matlab.ui.control.EditField
        AUCPR_Label_Decoding            matlab.ui.control.Label
        AUCPR_EditLabel_Decoding        matlab.ui.control.EditField
        BalAccLabel_Decoding            matlab.ui.control.Label
        BalAcc_EditField_Decoding       matlab.ui.control.EditField
        DecodingPerformanceLabel        matlab.ui.control.Label
        UDFLabel_3                      matlab.ui.control.Label
        StimulusEM                      matlab.ui.control.NumericEditField
        DecodingButtonGroup             matlab.ui.container.ButtonGroup
        ROC_Decoding                    matlab.ui.control.ToggleButton
        PR_Decoding                     matlab.ui.control.ToggleButton
        Plot_Decoding_Label             matlab.ui.control.Label
        ViewDecodingPerfPanel           matlab.ui.container.Panel
        ViewPerfButtonGroup             matlab.ui.container.ButtonGroup
        ViewTrainPerf                   matlab.ui.control.ToggleButton
        ViewTestPerf                    matlab.ui.control.ToggleButton
        ViewFullPerf                    matlab.ui.control.ToggleButton
        ViewPerfLabel                   matlab.ui.control.Label
        IDEns                           matlab.ui.container.Tab
        IDParams                        matlab.ui.container.Panel
        IdentificationofNeuronalEnsemblesParametersLabel  matlab.ui.control.Label
        TuningCriterionDropDown_2Label  matlab.ui.control.Label
        TuningCriterionDropDown_ID      matlab.ui.control.DropDown
        EnsembleSizeDropDown_2Label     matlab.ui.control.Label
        EnsembleSizeDropDown_ID         matlab.ui.control.DropDown
        IncludeUDFinEnsemblesEditField_2Label  matlab.ui.control.Label
        IncludeUDFinEnsemblesEditField_ID  matlab.ui.control.NumericEditField
        NumberofRandomControlsLabel     matlab.ui.control.Label
        NumberofRandomControlsEditField_ID  matlab.ui.control.NumericEditField
        EvaluateNeuronalContributionsButton  matlab.ui.control.Button
        EvaluateNodePerformanceButton   matlab.ui.control.Button
        ComparetoRandomEnsemblesButton  matlab.ui.control.Button
        IdentifyNeuronalEnsemblesRunAllButton  matlab.ui.control.Button
        ManuallyThresholdEnsemblesButton  matlab.ui.control.Button
        RecomparetoRandomEnsemblesButton  matlab.ui.control.Button
        DeviationsEditField             matlab.ui.control.NumericEditField
        UDFEditFieldLabel               matlab.ui.control.Label
        StimulusEditField               matlab.ui.control.NumericEditField
        ThresholdEditFieldLabel         matlab.ui.control.Label
        ThresholdEditField              matlab.ui.control.NumericEditField
        DeviationsLabel                 matlab.ui.control.Label
        IncTestSetLabel                 matlab.ui.control.Label
        RestrictToTrainingEditField     matlab.ui.control.NumericEditField
        EnsIdStats_IDENS                matlab.ui.container.Panel
        EnsembleNeuronsTextAreaLabel    matlab.ui.control.Label
        EnsembleNeuronsTextArea         matlab.ui.control.TextArea
        UniqueNeuronsTextArea           matlab.ui.control.TextArea
        UniqueNeuronsTextAreaLabel      matlab.ui.control.Label
        PromNeuronsTextArea             matlab.ui.control.TextArea
        PromNeuronsLabel                matlab.ui.control.Label
        PercentUniqueLabel              matlab.ui.control.Label
        PercentUniqueVal                matlab.ui.control.Label
        CodingDensityLabel              matlab.ui.control.Label
        CodingDensityVal                matlab.ui.control.Label
        EnsID_IDENS                     matlab.ui.container.Panel
        NodePerformance_IDENS           matlab.ui.container.Panel
        BandwidthEditField_2Label       matlab.ui.control.Label
        BandwidthEditField_ID           matlab.ui.control.NumericEditField
        EVEns                           matlab.ui.container.Tab
        EnsembleEvalParams              matlab.ui.container.Panel
        NeuronalEnsembleEvaluationLabel_EV  matlab.ui.control.Label
        EvaluateButton_EV               matlab.ui.control.Button
        ReservedField_EV_4              matlab.ui.control.Label
        ReservedEditField_EV_4          matlab.ui.control.NumericEditField
        PredictionPerformancePanel_Decoding_2  matlab.ui.container.Panel
        TruePositiveEditField_2Label_2  matlab.ui.control.Label
        TruePositiveEditField_Eval      matlab.ui.control.EditField
        FalsePositiveEditField_2Label_2  matlab.ui.control.Label
        FalsePositiveEditField_Eval     matlab.ui.control.EditField
        TrueNegativeEditField_2Label_2  matlab.ui.control.Label
        TrueNegativeEditField_Eval      matlab.ui.control.EditField
        FalseNegativeEditField_2Label_2  matlab.ui.control.Label
        FalseNegativeEditField_Eval     matlab.ui.control.EditField
        ThresholdLabel_2                matlab.ui.control.Label
        Threshold_Edit_Field_Eval       matlab.ui.control.EditField
        SpecificityEditField_2Label_2   matlab.ui.control.Label
        SpecificityEditField_Eval       matlab.ui.control.EditField
        SensitivityEditField_2Label_2   matlab.ui.control.Label
        SensitivityEditField_Eval       matlab.ui.control.EditField
        AccuracyEditField_2Label_2      matlab.ui.control.Label
        AccuracyEditField_Eval          matlab.ui.control.EditField
        PrecLabel_Eval                  matlab.ui.control.Label
        PrecEditField_Eval              matlab.ui.control.EditField
        AUC_ROC_LABEL_Eval              matlab.ui.control.Label
        AUC_ROC_EditField_Eval          matlab.ui.control.EditField
        AUCPR_Label_Eval                matlab.ui.control.Label
        AUCPR_EditLabel_Eval            matlab.ui.control.EditField
        MissLabel_Eval                  matlab.ui.control.Label
        Miss_EditField_Eval             matlab.ui.control.EditField
        EvalPerformanceLabel            matlab.ui.control.Label
        UDFLabel_2                      matlab.ui.control.Label
        StimulusEV                      matlab.ui.control.NumericEditField
        ViewEnsPerfButtonGroup          matlab.ui.container.ButtonGroup
        TrainEnsPerf                    matlab.ui.control.ToggleButton
        TestEnsPerf                     matlab.ui.control.ToggleButton
        ViewEnsPerfLabel                matlab.ui.control.Label
        FullEnsPerf                     matlab.ui.control.ToggleButton
        EnsembleUDFAuc                  matlab.ui.container.Panel
        GraphPropertiesPanel            matlab.ui.container.Panel
        EnsembleUDFPR                   matlab.ui.container.Panel
        EnsembleAllAuc                  matlab.ui.container.Panel
        EnsembleAllPR                   matlab.ui.container.Panel
        EnsembleCoordinates             matlab.ui.container.Panel
        EnsembleGraphStructure          matlab.ui.container.Panel
        IDPCN                           matlab.ui.container.Tab
        PCNScatter                      matlab.ui.container.Panel
        PCNParams                       matlab.ui.container.Panel
        PatternCompletionNeuronsLabel   matlab.ui.control.Label
        IdentifyPatternCompletionNeuronsButton  matlab.ui.control.Button
        UDFLabel_4                      matlab.ui.control.Label
        Stimulus_PCN                    matlab.ui.control.NumericEditField
        NodeThresholdLabel              matlab.ui.control.Label
        NodeThresholdDropDown           matlab.ui.control.DropDown
        OverlayDropDownLabel            matlab.ui.control.Label
        OverlayDropDown                 matlab.ui.control.DropDown
        PCNNeuronsTextAreaLabel_PCN     matlab.ui.control.Label
        PCNNeuronsTextArea_PCN          matlab.ui.control.TextArea
        UniqueNeuronsTextArea_PCN       matlab.ui.control.TextArea
        UniqueNeuronsTextAreaLabel_PCN  matlab.ui.control.Label
        PercentUniqueVal_PCN            matlab.ui.control.Label
        PercentUniqueLabel_PCN          matlab.ui.control.Label
        PromNeuronsTextArea_PCN         matlab.ui.control.TextArea
        PromNeuronsLabel_PCN            matlab.ui.control.Label
        PCNDensity_PCN                  matlab.ui.control.Label
        PCDensityLabel_PCN              matlab.ui.control.Label
        PCNCoordinates                  matlab.ui.container.Panel
    end

    
    properties (Access = public)
        file_data; % Spike Matrix File Location
        file_udf; % UDF File Location
        file_rois; % ROIs File Location
        file_model; % Model File Location
        file_params; % Params File location
        model_Name = 'DefaultModel.mat'; % Name of Current Model
        data; %data
        udf; %user defined features in binary
        rois; %roi coordinates, can be many forms (see fucntion for details
        params; %params for modeling
        model_collection; %collection of learned models
        models; %collection of to be learned models
        roi_style; % Description
        newcolors; % color scheme
        
        % data handles
        best_model; % best model
        model_performance; % best model performance in decoding
        log_likelihood_by_frame;
        global_cluster_coefficient;
        node_performance;
        random_ensemble_performance;
        ensemble_nodes;
        identified_ensemble_performance;
        pattern_completion_nodes;
        node_scores;
        node_threshold;
        auc_threshold;
        
        
        % HERE ARE AXES HANDLES %
        roi_preview; % Axes Handle for ROI Preview
        data_preview; % Axes Handle for Data Preview
        max_degree_structural_learning; 
        % Axes Handle for Max Degree Distribution (Structural Learning)
        mean_degree_structural_learning;
        % Axes Handle for Mean Degree Distribution (Structural Learning)
        median_degree_structural_learning;
        % Axes Handle for Median Degree Distribution (Structural Learning)
        rms_degree_structural_learning;
        % Axes Handle for RMS Degree Distribution (Structural Learning)
        complexity_structural_learning;
        % Axes Handle for Complexity Distribution (Structural Learning)
        parameter_space_structural_learning;
        % Axes Handle for Parameter Space (Lambda) (Structural Learning)
        optimization_plot;
        % Axes Handles for optimization plot
        % Axes Handle for edge weights
        edge_weight_parameter_estimation;
        % Axes Handle for ndoe weights
        node_weight_parameter_estimation;
        % Axes Handle for parameter space parameter estimation
        parameter_space_parameter_estimation;
        % Axes Handle for model decoding evaluation (big plot)
        model_decoding_evaluation;
        % Axes handle for structured prediction plot
        model_evaluation;
        % Axes handle for third thing that idk what should be 
        model_relative_decoding;
        % Axes Handle distribution of node performance
        node_performance_distribution;
        % Axes Handle Ensemble ROIs
        ensemble_coordinates;
        % Axes Handle Ensemble Evaluation ROIs
        ensemble_evaluation_coordinates;
        % Axes Handle Ensemble Graph
        ensemble_graph;
        % Axes Handle Ensemble All UDF vs One Ensemble (auc)
        ensemble_all_udf_one_ens_auc;
        % Axes Handle Ensemble One UDF vs All Ensemble (auc)
        ensemble_one_udf_all_ens_auc;
        % Axes Handle Ensemble All UDF vs One Ensemble (pr)
        ensemble_all_udf_one_ens_pr;
        % Axes Handle Ensemble One UDF vs All Ensemble (pr)
        ensemble_one_udf_all_ens_pr;
        % Axes Handle PCN Scatter
        pattern_completion_scatter;
        % Axes Handle PCN ROIs
        pattern_completion_coordinates;
        % Axes Handle PCN graphical structure
        pattern_completion_structure;
    end
    
    properties (Access = private)
     
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
           generate_components(app);
           retrieve_gui_colors(app);
           load_default_parameters(app);
           update_params(app);
           b = 0;
        end

        % Button pushed function: BrowseData
        function BrowseDataButtonPushed(app, event)
            browse_data(app);
        end

        % Button pushed function: BrowseUDF
        function BrowseUDFButtonPushed(app, event)
            browse_udf(app);
        end

        % Button pushed function: BrowseROIs
        function BrowseROIsButtonPushed(app, event)
            browse_rois(app);
        end

        % Button pushed function: BrowseModel
        function BrowseModelButtonPushed(app, event)
            browse_models(app);
        end

        % Button pushed function: NewModelButton
        function NewModelButtonPushed(app, event)
            new_model(app);
        end

        % Button pushed function: LoadData
        function LoadDataButtonPushed(app, event)
            load_data_button_pushed(app);
        end

        % Button pushed function: LoadUDF
        function LoadUDFButtonPushed(app, event)
            load_udf_button_pushed(app);
        end

        % Button pushed function: LoadROIs
        function LoadROIsButtonPushed(app, event)
            load_rois_button_pushed(app);
        end

        % Button pushed function: LoadModel
        function LoadModelButtonPushed(app, event)
            load_model_button_pushed(app);
        end

        % Button pushed function: BrowseParams
        function BrowseParamsButtonPushed(app, event)
            browse_params(app);
        end

        % Button pushed function: LoadParams
        function LoadParamsButtonPushed(app, event)
            load_params_button_pushed(app);
        end

        % Button pushed function: SaveParams
        function SaveParamsButtonPushed(app, event)
            save_params(app);
            update_log(app, 'Saved Parameters');
        end

        % Value changed function: ShuffleDataEditField
        function ShuffleDataEditFieldValueChanged(app, event)
            app.params.random_shuffle = logical(app.ShuffleDataEditField.Value);       
            update_params(app);
        end

        % Value changed function: ParallelProcessingEditField
        function ParallelProcessingEditFieldValueChanged(app, event)
            app.params.par_proc = logical(app.ParallelProcessingEditField.Value);
            update_params(app);
        end

        % Value changed function: TrainingTestingSplitEditField
        function TrainingTestingSplitEditFieldValueChanged(app, event)
            app.params.split = double(app.TrainingTestingSplitEditField.Value);   
            update_params(app);
        end

        % Value changed function: AlphaEditField
        function AlphaEditFieldValueChanged(app, event)
            app.params.alpha = double(app.AlphaEditField.Value);
            update_params(app);
        end

        % Value changed function: DensityEditField
        function DensityEditFieldValueChanged(app, event)
            app.params.density = double(app.DensityEditField.Value);
            update_params(app);
        end

        % Value changed function: NumberofsLambdaEditField
        function NumberofsLambdaEditFieldValueChanged(app, event)
            app.params.s_lambda_count = double(app.NumberofsLambdaEditField.Value);
            update_params(app);
        end

        % Value changed function: MinimumsLambdaEditField
        function MinimumsLambdaEditFieldValueChanged(app, event)
            app.params.s_lambda_min = double(app.MinimumsLambdaEditField.Value);
            update_params(app);
        end

        % Value changed function: MaximumsLambdaEditField
        function MaximumsLambdaEditFieldValueChanged(app, event)
            app.params.s_lambda_max = double(app.MaximumsLambdaEditField.Value);
            update_params(app);
        end

        % Value changed function: sLambdaDistributionEditField
        function sLambdaDistributionEditFieldValueChanged(app, event)
            app.params.s_lambda_distribution = logical(app.sLambdaDistributionEditField.Value);
            update_params(app);
        end

        % Value changed function: TemporalInteractionsEditField
        function TemporalInteractionsEditFieldValueChanged(app, event)
            app.params.temporal_steps = double(app.TemporalInteractionsEditField.Value);
            update_params(app);
        end

        % Callback function
        function RecurrentInteractionsEditFieldValueChanged(app, event)
            app.params.no_same_neuron_edges = logical(app.RecurrentInteractionsEditField.Value);
            update_params(app);
        end

        % Value changed function: MergeNodeClassesEditField
        function MergeNodeClassesEditFieldValueChanged(app, event)
            app.params.merge = logical(app.MergeNodeClassesEditField.Value);
            update_params(app);
        end

        % Value changed function: UDFUDFInteractionsEditField
        function UDFUDFInteractionsEditFieldValueChanged(app, event)
            app.params.hyperedge = double(app.UDFUDFInteractionsEditField.Value);
            update_params(app);
        end

        % Value changed function: 
        % RankAbsoluteValueofCoefficientsEditField
        function RankAbsoluteValueofCoefficientsEditFieldValueChanged(app, event)
            app.params.absolute = logical(app.RankAbsoluteValueofCoefficientsEditField.Value);
            update_params(app);
        end

        % Value changed function: NumberofpLambdaEditField
        function NumberofpLambdaEditFieldValueChanged(app, event)
            app.params.p_lambda_count = double(app.NumberofpLambdaEditField.Value);
            update_params(app);
        end

        % Value changed function: MinimumpLambdaEditField
        function MinimumpLambdaEditFieldValueChanged(app, event)
            app.params.p_lambda_min = double(app.MinimumpLambdaEditField.Value);
            update_params(app);
        end

        % Value changed function: MaximumpLambdaEditField
        function MaximumpLambdaEditFieldValueChanged(app, event)
            app.params.p_lambda_max = double(app.MaximumpLambdaEditField.Value);
            update_params(app);
        end

        % Value changed function: fValEpsilonEditField
        function fValEpsilonEditFieldValueChanged(app, event)
           app.params.fval_epsilon = double(app.fValEpsilonEditField.Value);
           update_params(app);
        end

        % Value changed function: MaxIterationsEditField
        function MaxIterationsEditFieldValueChanged(app, event)
            app.params.max_iterations = double(app.MaxIterationsEditField.Value);
            update_params(app);
        end

        % Value changed function: MaximumTimetoConvergenceEditField
        function MaximumTimetoConvergenceEditFieldValueChanged(app, event)
            app.params.max_time = double(app.MaximumTimetoConvergenceEditField.Value);
            update_params(app);
        end

        % Value changed function: PrintIntervalEditField
        function PrintIntervalEditFieldValueChanged(app, event)
            app.params.print_interval = double(app.PrintIntervalEditField.Value);
            update_params(app);
        end

        % Callback function
        function PrintTestsEditFieldValueChanged(app, event)
            app.params.print_test = double(app.PrintTestsEditField.Value);
           update_params(app);
        end

        % Callback function
        function ComputeTrueLogZEditFieldValueChanged(app, event)
            app.params.compute_true_logZ = logical(app.ComputeTrueLogZEditField.Value);
            update_params(app);
        end

        % Value changed function: ImplementationModeEditField
        function ImplementationModeEditFieldValueChanged(app, event)
            app.params.implementation_mode = double(app.ImplementationModeEditField.Value);
            update_params(app);
        end

        % Value changed function: NumberofStructuresEditField
        function NumberofStructuresEditFieldValueChanged(app, event)
            app.params.num_structures = double(app.NumberofStructuresEditField.Value);
            update_params(app);
        end

        % Value changed function: NumberofRandomControlsEditField
        function NumberofRandomControlsEditFieldValueChanged(app, event)
            app.params.num_controls = double(app.NumberofRandomControlsEditField.Value);
           update_params(app);
        end

        % Value changed function: pLambdaDistributionEditField
        function pLambdaDistributionEditFieldValueChanged(app, event)
            app.params.p_lambda_distribution = logical(app.pLambdaDistributionEditField.Value);
            update_params(app);
        end

        % Button pushed function: ValidateData
        function ValidateDataButtonPushed(app, event)
            validate_data_button_pushed(app);
        end

        % Button pushed function: RunModel
        function RunModelButtonPushed(app, event)
            f_DA_app_wrapped_run_all(app);
        end

        % Value changed function: ReweightDenominatorDropDown
        function ReweightDenominatorDropDownValueChanged(app, event)
           app.params.reweight_denominator=app.ReweightDenominatorDropDown.Value;
           update_params(app);
        end

        % Value changed function: TuningCriterionDropDown
        function TuningCriterionDropDownValueChanged(app, event)
            app.params.performance_curve_criterion = app.TuningCriterionDropDown.Value;
            update_params(app);
        end

        % Value changed function: EnsembleSizeDropDown
        function EnsembleSizeDropDownValueChanged(app, event)
            app.params.size_random_ensemble = app.EnsembleSizeDropDown.Value;
            update_params(app);
        end

        % Value changed function: DensityEditField_SL
        function DensityEditField_SLValueChanged(app, event)
            app.params.density = app.DensityEditField_SL.Value;
            update_params(app);
        end

        % Value changed function: sLambdaDistributionEditField_SL
        function sLambdaDistributionEditField_SLValueChanged(app, event)
            app.params.s_lambda_distribution = logical(app.sLambdaDistributionEditField_SL.Value);
            update_params(app);
        end

        % Value changed function: MaximumsLambdaEditField_SL
        function MaximumsLambdaEditField_SLValueChanged(app, event)
            app.params.s_lambda_max = app.MaximumsLambdaEditField_SL.Value;
            update_params(app);
        end

        % Callback function
        function RecurrentInteractionsEditField_SLValueChanged(app, event)
            value = app.RecurrentInteractionsEditField_SL.Value;
            fprintf("NOT IMPLEMENTED");
        end

        % Value changed function: MinimumsLambdaEditField_SL
        function MinimumsLambdaEditField_SLValueChanged(app, event)
            app.params.s_lambda_min = app.MinimumsLambdaEditField_SL.Value;
            update_params(app);
        end

        % Value changed function: NumberofsLambdaEditField_SL
        function NumberofsLambdaEditField_SLValueChanged(app, event)
            app.params.s_lambda_count = app.NumberofsLambdaEditField_SL.Value;
            update_params(app);
        end

        % Callback function
        function TemporalInteractionsEditField_SLValueChanged(app, event)
            app.params.temporal_steps = app.TemporalInteractionsEditField_SL.Value;
            update_params(app);
        end

        % Value changed function: MergeNodeClassesEditField_SL
        function MergeNodeClassesEditField_SLValueChanged(app, event)
            app.params.merge = app.MergeNodeClassesEditField_SL.Value;
            update_params(app);
        end

        % Value changed function: AlphaEditField_SL
        function AlphaEditField_SLValueChanged(app, event)
            app.params.alpha = app.AlphaEditField_SL.Value;
            update_params(app);
        end

        % Value changed function: ParallelProcessingEditField_SL
        function ParallelProcessingEditField_SLValueChanged(app, event)
            app.params.par_struc = logical(app.ParallelProcessingEditField_SL.Value);
            update_params(app);
        end

        % Value changed function: 
        % RankAbsoluteValueofCoefficientsEditField_SL
        function RankAbsoluteValueofCoefficientsEditField_SLValueChanged(app, event)
            app.params.absolute = app.RankAbsoluteValueofCoefficientsEditField_SL.Value;
            update_params(app);
        end

        % Value changed function: UDFUDFInteractionsEditField_SL
        function UDFUDFInteractionsEditField_SLValueChanged(app, event)
            value = app.UDFUDFInteractionsEditField_SL.Value;
            fprintf("NOT IMPLEMENTED");
        end

        % Button pushed function: PreviewPassedStructuresButton
        function PreviewPassedStructuresButtonPushed(app, event)
            preview_passed_structures_button_pushed(app);
        end

        % Button pushed function: PreviewAllStructuresButton
        function PreviewAllStructuresButtonPushed(app, event)
            preview_all_structures_button_pushed(app);
        end

        % Value changed function: FirstPassStructuresEditField
        function FirstPassStructuresEditFieldValueChanged(app, event)
            app.params.num_structures = app.FirstPassStructuresEditField.Value;
            update_params(app);
        end

        % Button pushed function: PassAdditionalStructuresButton
        function PassAdditionalStructuresButtonPushed(app, event)
            pass_additional_structures_button_pushed(app);
        end

        % Button pushed function: PerformStructuralLearningButton
        function PerformStructuralLearningButtonPushed(app, event)
            perform_structural_learning_button_pushed(app);
        end

        % Button pushed function: PreviewLambdaButton
        function PreviewLambdaButtonPushed(app, event)
            preview_s_lambda_button_pushed(app);
        end

        % Button pushed function: AddLambdaButton
        function AddLambdaButtonPushed(app, event)
            add_s_lambda_button_pushed(app);
        end

        % Value changed function: MaxIterEditField_PE
        function MaxIterEditField_PEValueChanged(app, event)
            app.params.max_iterations = double(app.MaxIterEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: pLambdaDistributionEditField_PE
        function pLambdaDistributionEditField_PEValueChanged(app, event)
            app.params.logPspace = logical(app.pLambdaDistributionEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: MaximumpLambdaEditField_PE
        function MaximumpLambdaEditField_PEValueChanged(app, event)
            app.params.p_lambda_max = double(app.MaximumpLambdaEditField_PE.Value);
            update_params(app); 
        end

        % Value changed function: PrintIntervalEditField_PE
        function PrintIntervalEditField_PEValueChanged(app, event)
            app.params.print_interval = double(app.PrintIntervalEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: MinimumpLambdaEditField_PE
        function MinimumpLambdaEditField_PEValueChanged(app, event)
            app.params.p_lambda_min = double(app.MinimumpLambdaEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: NumberofpLambdaEditField_PE
        function NumberofpLambdaEditField_PEValueChanged(app, event)
            app.params.p_lambda_count = double(app.NumberofpLambdaEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: ComputeTrueLogZEditField_PE
        function ComputeTrueLogZEditField_PEValueChanged(app, event)
            app.params.compute_true_logZ = logical(app.ComputeTrueLogZEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: fValEpsilonEditField_PE
        function fValEpsilonEditField_PEValueChanged(app, event)
            app.params.fval_epsilon = double(app.fValEpsilonEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: ParallelProcessingEditField_PE
        function ParallelProcessingEditField_PEValueChanged(app, event)
            app.params.parProc = logical(app.ParallelProcessingEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: PrintTestEditField_PE
        function PrintTestEditField_PEValueChanged(app, event)
            app.params.print_test = double(app.PrintTestEditField_PE.Value);
            update_params(app);
        end

        % Value changed function: MaxTimeEditField_PE
        function MaxTimeEditField_PEValueChanged(app, event)
            app.params.max_time = double(app.MaxTimeEditField_PE.Value);
            update_params(app);
        end

        % Button pushed function: PerformParameterEstimationButton
        function PerformParameterEstimationButtonPushed(app, event)
            perform_parameter_estimation_button_pushed(app);
        end

        % Callback function
        function PassAdditionalModelsButtonPushed(app, event)
            % in progress
            fprintf('NOT IMPLEMENTED')
        end

        % Button pushed function: PlotModel_PE
        function PlotModel_PEPushed(app, event)
            preview_parameter_estimation_button_pushed(app);
        end

        % Button pushed function: AddLambdaButton_PE
        function AddLambdaButton_PEPushed(app, event)
            add_p_lambda_button_pushed(app);
        end

        % Value changed function: ImplementationModeEditField_PE
        function ImplementationModeEditField_PEValueChanged(app, event)
            app.params.implementation_mode = double(app.ImplementationModeEditField_PE.Value);
            update_params(app);
        end

        % Button pushed function: LearnAdditionalModelsButton
        function LearnAdditionalModelsButtonPushed(app, event)
            f_DA_learn_additional_PE(app);
        end

        % Button pushed function: EvaluateBestModelButton
        function EvaluateBestModelButtonPushed(app, event)
         evaluate_best_model_button_pushed(app);
        end

        % Callback function
        function ButtonPushed(app, event)
            shortDebug(app);
        end

        % Selection changed function: DecodingButtonGroup
        function DecodingButtonGroupSelectionChanged(app, event)
            decoding_udf_selection_change_button_pushed(app);
        end

        % Value changed function: StimulusEM
        function StimulusEMValueChanged(app, event)
            decoding_udf_selection_change_button_pushed(app);
        end

        % Callback function
        function StepSizeEditFieldValueChanged(app, event)
            app.params.stepSize = app.StepSizeEditField.Value;
            update_params(app);
        end

        % Callback function
        function SizeOptimizationEditFieldValueChanged(app, event)
            app.params.assessSize = logical(app.SizeOptimizationEditField.Value);
            update_params(app);
        end

        % Callback function
        function AssessMulticlassEditFieldValueChanged(app, event)
            app.params.assessMulticlass = logical(app.AssessMulticlassEditField.Value);
            update_params(app);
        end

        % Value changed function: AssessClusteringEditField
        function AssessClusteringEditFieldValueChanged(app, event)
            app.params.assess_clustering = logical(app.AssessClusteringEditField.Value);
            update_params(app);
        end

        % Value changed function: AssessDecodingEditField
        function AssessDecodingEditFieldValueChanged(app, event)
            app.params.assess_decoding = logical(app.AssessDecodingEditField.Value);
            update_params(app);
        end

        % Callback function
        function AssessLinearityEditFieldValueChanged(app, event)
            app.params.assessLinearity = logical(app.AssessLinearityEditField.Value);
            update_params(app);
        end

        % Callback function
        function AssessNodesEditFieldValueChanged(app, event)
            app.params.assessNodes = logical(app.AssessNodesEditField.Value);
            update_params(app);
        end

        % Callback function
        function AssessNeuronsEditFieldValueChanged(app, event)
            app.params.assessNeurons = logical(app.AssessNeuronsEditField.Value);
            update_params(app);
        end

        % Value changed function: AssessDecoding
        function AssessDecodingValueChanged(app, event)
            app.params.assess_decoding = logical(app.AssessDecoding.Value);
             update_params(app);
        end

        % Value changed function: AssessClustering
        function AssessClusteringValueChanged(app, event)
            app.params.assess_clustering = logical(app.AssessClustering.Value);
            update_params(app);
        end

        % Value changed function: TrTstWeighting
        function TrTstWeightingValueChanged(app, event)
            app.params.trainTestWeight = app.TrTstWeighting.Value;
            update_params(app);
        end

        % Button pushed function: ReselectBestModelButton
        function ReselectBestModelButtonPushed(app, event)
            f_DA_reselect_best_model(app);
        end

        % Selection change function: TabGroup
        function TabGroupSelectionChanged(app, event)
            %f_DA_parse_tab_and_generate(app);
        end

        % Button pushed function: 
        % EvaluateNeuronalContributionsButton
        function EvaluateNeuronalContributionsButtonPushed(app, event)
            evaluate_neuronal_contributions_button_pushed(app);
        end

        % Button pushed function: EvaluateNodePerformanceButton
        function EvaluateNodePerformanceButtonPushed(app, event)
            evaluate_node_performance_button_pushed(app);
        end

        % Button pushed function: ComparetoRandomEnsemblesButton
        function ComparetoRandomEnsemblesButtonPushed(app, event)
            compare_to_random_ensembles_button_pushed(app);
        end

        % Value changed function: StimulusEditField
        function StimulusEditFieldValueChanged(app, event)
            identified_ensemble_id_button_changed(app);
        end

        % Button pushed function: 
        % IdentifyNeuronalEnsemblesRunAllButton
        function IdentifyNeuronalEnsemblesRunAllButtonPushed(app, event)
            identify_ensembles_run_all_button_pushed(app);
        end

        % Callback function
        function AssessNeuronsEditField_EVValueChanged(app, event)
            app.params.assessNeurons = logical(app.AssessNeuronsEditField_EV.Value);
            update_params(app);
        end

        % Callback function
        function AssessNodesEditField_EVValueChanged(app, event)
            app.params.assessNodes = logical(app.AssessNodesEditField_EV.Value);
            update_params(app);
        end

        % Callback function
        function AssessLinearityEditField_EVValueChanged(app, event)
            app.params.assessLinearity = logical(app.AssessLinearityEditField_EV.Value);
            update_params(app);
        end

        % Callback function
        function SizeOptimizationEditField_EVValueChanged(app, event)
            app.params.assessSize = logical(app.SizeOptimizationEditField_EV.Value);
            update_params(app);
        end

        % Callback function
        function NumberofStepsEditField_EVValueChanged(app, event)
            app.params.numSteps = double(app.NumberofStepsEditField_EV.Value);
            update_params(app);
        end

        % Callback function
        function StepSizeEditField_EVValueChanged(app, event)
            app.params.stepSize = double(app.StepSizeEditField_EV.Value);
            update_params(app);
        end

        % Button pushed function: ManuallyThresholdEnsemblesButton
        function ManuallyThresholdEnsemblesButtonPushed(app, event)
            manually_threshold_ensembles_button_pushed(app);
        end

        % Button pushed function: RecomparetoRandomEnsemblesButton
        function RecomparetoRandomEnsemblesButtonPushed(app, event)
            recompare_random_ensembles_button_pushed(app);
        end

        % Value changed function: IncludeUDFinEnsemblesEditField_ID
        function IncludeUDFinEnsemblesEditField_IDValueChanged(app, event)
            app.params.include_UDF_in_random_ensembles = logical(app.IncludeUDFinEnsemblesEditField_ID.Value);
            update_params(app);
        end

        % Value changed function: IncludeUDFinEnsemblesEditField
        function IncludeUDFinEnsemblesEditFieldValueChanged(app, event)
            app.params.include_UDF_in_random_ensembles = logical(app.IncludeUDFinEnsemblesEditField.Value);
            update_params(app);
        end

        % Value changed function: NumberofRandomControlsEditField_ID
        function NumberofRandomControlsEditField_IDValueChanged(app, event)
           app.params.num_controls = double(app.NumberofRandomControlsEditField_ID.Value);
           update_params(app); 
        end

        % Value changed function: EnsembleSizeDropDown_ID
        function EnsembleSizeDropDown_IDValueChanged(app, event)
            app.params.size_random_ensemble=app.EnsembleSizeDropDown_ID.Value;
        end

        % Value changed function: TuningCriterionDropDown_ID
        function TuningCriterionDropDown_IDValueChanged(app, event)
            app.params.performance_curve_criterion = app.TuningCriterionDropDown_ID.Value;
        end

        % Value changed function: ReweightDenominatorDropDown_PE
        function ReweightDenominatorDropDown_PEValueChanged(app, event)
             app.params.reweight_denominator = app.ReweightDenominatorDropDown_PE.Value;
             update_params(app);    
        end

        % Button pushed function: EvaluateButton_EV
        function EvaluateButton_EVPushed(app, event)
            evaluate_ensembles_button_pushed(app);
            app.params.stage=8;
        end

        % Callback function
        function EVButtonGroupSelectionChanged(app, event)
            update_ensemble_eval_text(app);
        end

        % Value changed function: StimulusEV
        function StimulusEVValueChanged(app, event)
            udf_selection_ensemble_evaluation_button_changed(app);
        end

        % Value changed function: BandwidthEditField
        function BandwidthEditFieldValueChanged(app, event)
            plot_potentials(app);
        end

        % Value changed function: BandwidthEditField_2
        function BandwidthEditField_2ValueChanged(app, event)
            plot_potentials(app);
        end

        % Value changed function: BandwidthEditField_ID
        function BandwidthEditField_IDValueChanged(app, event)
            plot_node_performance_distribution(app);
        end

        % Button pushed function: 
        % IdentifyPatternCompletionNeuronsButton
        function IdentifyPatternCompletionNeuronsButtonPushed(app, event)
            find_pattern_completion(app);
            app.params.stage=9;
        end

        % Value changed function: Stimulus_PCN
        function Stimulus_PCNValueChanged(app, event)
                        udf_id_pcn_button_changed(app);
        end

        % Button pushed function: ExportButton
        function ExportButtonPushed(app, event)
            save_all(app);
        end

        % Selection changed function: ViewPerfButtonGroup
        function ViewPerfButtonGroupSelectionChanged(app, event)
            decoding_udf_selection_change_button_pushed(app);
        end

        % Selection changed function: ViewEnsPerfButtonGroup
        function ViewEnsPerfButtonGroupSelectionChanged(app, event)
            dataset_segment_ensemble_evaluation_button_changed(app);
        end

        % Value changed function: ParallelLearningEditField
        function ParallelLearningEditFieldValueChanged(app, event)
            value = app.ParallelLearningEditField.Value;
            app.params.par_struc = logical(value);
            update_params(app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Colormap = [0.2431 0.149 0.6588;0.2431 0.1529 0.6745;0.2471 0.1569 0.6863;0.2471 0.1608 0.698;0.251 0.1647 0.7059;0.251 0.1686 0.7176;0.2549 0.1725 0.7294;0.2549 0.1765 0.7412;0.2588 0.1804 0.749;0.2588 0.1843 0.7608;0.2627 0.1882 0.7725;0.2627 0.1922 0.7843;0.2627 0.1961 0.7922;0.2667 0.2 0.8039;0.2667 0.2039 0.8157;0.2706 0.2078 0.8235;0.2706 0.2157 0.8353;0.2706 0.2196 0.8431;0.2745 0.2235 0.851;0.2745 0.2275 0.8627;0.2745 0.2314 0.8706;0.2745 0.2392 0.8784;0.2784 0.2431 0.8824;0.2784 0.2471 0.8902;0.2784 0.2549 0.898;0.2784 0.2588 0.902;0.2784 0.2667 0.9098;0.2784 0.2706 0.9137;0.2784 0.2745 0.9216;0.2824 0.2824 0.9255;0.2824 0.2863 0.9294;0.2824 0.2941 0.9333;0.2824 0.298 0.9412;0.2824 0.3059 0.9451;0.2824 0.3098 0.949;0.2824 0.3137 0.9529;0.2824 0.3216 0.9569;0.2824 0.3255 0.9608;0.2824 0.3294 0.9647;0.2784 0.3373 0.9686;0.2784 0.3412 0.9686;0.2784 0.349 0.9725;0.2784 0.3529 0.9765;0.2784 0.3569 0.9804;0.2784 0.3647 0.9804;0.2745 0.3686 0.9843;0.2745 0.3765 0.9843;0.2745 0.3804 0.9882;0.2706 0.3843 0.9882;0.2706 0.3922 0.9922;0.2667 0.3961 0.9922;0.2627 0.4039 0.9922;0.2627 0.4078 0.9961;0.2588 0.4157 0.9961;0.2549 0.4196 0.9961;0.251 0.4275 0.9961;0.2471 0.4314 1;0.2431 0.4392 1;0.2353 0.4431 1;0.2314 0.451 1;0.2235 0.4549 1;0.2196 0.4627 0.9961;0.2118 0.4667 0.9961;0.2078 0.4745 0.9922;0.2 0.4784 0.9922;0.1961 0.4863 0.9882;0.1922 0.4902 0.9882;0.1882 0.498 0.9843;0.1843 0.502 0.9804;0.1843 0.5098 0.9804;0.1804 0.5137 0.9765;0.1804 0.5176 0.9725;0.1804 0.5255 0.9725;0.1804 0.5294 0.9686;0.1765 0.5333 0.9647;0.1765 0.5412 0.9608;0.1765 0.5451 0.9569;0.1765 0.549 0.9529;0.1765 0.5569 0.949;0.1725 0.5608 0.9451;0.1725 0.5647 0.9412;0.1686 0.5686 0.9373;0.1647 0.5765 0.9333;0.1608 0.5804 0.9294;0.1569 0.5843 0.9255;0.1529 0.5922 0.9216;0.1529 0.5961 0.9176;0.149 0.6 0.9137;0.149 0.6039 0.9098;0.1451 0.6078 0.9098;0.1451 0.6118 0.9059;0.1412 0.6196 0.902;0.1412 0.6235 0.898;0.1373 0.6275 0.898;0.1373 0.6314 0.8941;0.1333 0.6353 0.8941;0.1294 0.6392 0.8902;0.1255 0.6471 0.8902;0.1216 0.651 0.8863;0.1176 0.6549 0.8824;0.1137 0.6588 0.8824;0.1137 0.6627 0.8784;0.1098 0.6667 0.8745;0.1059 0.6706 0.8706;0.102 0.6745 0.8667;0.098 0.6784 0.8627;0.0902 0.6824 0.8549;0.0863 0.6863 0.851;0.0784 0.6902 0.8471;0.0706 0.6941 0.8392;0.0627 0.698 0.8353;0.0549 0.702 0.8314;0.0431 0.702 0.8235;0.0314 0.7059 0.8196;0.0235 0.7098 0.8118;0.0157 0.7137 0.8078;0.0078 0.7176 0.8;0.0039 0.7176 0.7922;0 0.7216 0.7882;0 0.7255 0.7804;0 0.7294 0.7765;0.0039 0.7294 0.7686;0.0078 0.7333 0.7608;0.0157 0.7333 0.7569;0.0235 0.7373 0.749;0.0353 0.7412 0.7412;0.051 0.7412 0.7373;0.0627 0.7451 0.7294;0.0784 0.7451 0.7216;0.0902 0.749 0.7137;0.102 0.7529 0.7098;0.1137 0.7529 0.702;0.1255 0.7569 0.6941;0.1373 0.7569 0.6863;0.1451 0.7608 0.6824;0.1529 0.7608 0.6745;0.1608 0.7647 0.6667;0.1686 0.7647 0.6588;0.1725 0.7686 0.651;0.1804 0.7686 0.6471;0.1843 0.7725 0.6392;0.1922 0.7725 0.6314;0.1961 0.7765 0.6235;0.2 0.7804 0.6157;0.2078 0.7804 0.6078;0.2118 0.7843 0.6;0.2196 0.7843 0.5882;0.2235 0.7882 0.5804;0.2314 0.7882 0.5725;0.2392 0.7922 0.5647;0.251 0.7922 0.5529;0.2588 0.7922 0.5451;0.2706 0.7961 0.5373;0.2824 0.7961 0.5255;0.2941 0.7961 0.5176;0.3059 0.8 0.5059;0.3176 0.8 0.498;0.3294 0.8 0.4863;0.3412 0.8 0.4784;0.3529 0.8 0.4667;0.3686 0.8039 0.4549;0.3804 0.8039 0.4471;0.3922 0.8039 0.4353;0.4039 0.8039 0.4235;0.4196 0.8039 0.4118;0.4314 0.8039 0.4;0.4471 0.8039 0.3922;0.4627 0.8 0.3804;0.4745 0.8 0.3686;0.4902 0.8 0.3569;0.5059 0.8 0.349;0.5176 0.8 0.3373;0.5333 0.7961 0.3255;0.5451 0.7961 0.3176;0.5608 0.7961 0.3059;0.5765 0.7922 0.2941;0.5882 0.7922 0.2824;0.6039 0.7882 0.2745;0.6157 0.7882 0.2627;0.6314 0.7843 0.251;0.6431 0.7843 0.2431;0.6549 0.7804 0.2314;0.6706 0.7804 0.2235;0.6824 0.7765 0.2157;0.698 0.7765 0.2078;0.7098 0.7725 0.2;0.7216 0.7686 0.1922;0.7333 0.7686 0.1843;0.7451 0.7647 0.1765;0.7608 0.7647 0.1725;0.7725 0.7608 0.1647;0.7843 0.7569 0.1608;0.7961 0.7569 0.1569;0.8078 0.7529 0.1529;0.8157 0.749 0.1529;0.8275 0.749 0.1529;0.8392 0.7451 0.1529;0.851 0.7451 0.1569;0.8588 0.7412 0.1569;0.8706 0.7373 0.1608;0.8824 0.7373 0.1647;0.8902 0.7373 0.1686;0.902 0.7333 0.1765;0.9098 0.7333 0.1804;0.9176 0.7294 0.1882;0.9255 0.7294 0.1961;0.9373 0.7294 0.2078;0.9451 0.7294 0.2157;0.9529 0.7294 0.2235;0.9608 0.7294 0.2314;0.9686 0.7294 0.2392;0.9765 0.7294 0.2431;0.9843 0.7333 0.2431;0.9882 0.7373 0.2431;0.9961 0.7412 0.2392;0.9961 0.7451 0.2353;0.9961 0.7529 0.2314;0.9961 0.7569 0.2275;0.9961 0.7608 0.2235;0.9961 0.7686 0.2196;0.9961 0.7725 0.2157;0.9961 0.7804 0.2078;0.9961 0.7843 0.2039;0.9961 0.7922 0.2;0.9922 0.7961 0.1961;0.9922 0.8039 0.1922;0.9922 0.8078 0.1922;0.9882 0.8157 0.1882;0.9843 0.8235 0.1843;0.9843 0.8275 0.1804;0.9804 0.8353 0.1804;0.9765 0.8392 0.1765;0.9765 0.8471 0.1725;0.9725 0.851 0.1686;0.9686 0.8588 0.1647;0.9686 0.8667 0.1647;0.9647 0.8706 0.1608;0.9647 0.8784 0.1569;0.9608 0.8824 0.1569;0.9608 0.8902 0.1529;0.9608 0.898 0.149;0.9608 0.902 0.149;0.9608 0.9098 0.1451;0.9608 0.9137 0.1412;0.9608 0.9216 0.1373;0.9608 0.9255 0.1333;0.9608 0.9333 0.1294;0.9647 0.9373 0.1255;0.9647 0.9451 0.1216;0.9647 0.949 0.1176;0.9686 0.9569 0.1098;0.9686 0.9608 0.1059;0.9725 0.9686 0.102;0.9725 0.9725 0.0941;0.9765 0.9765 0.0863;0.9765 0.9843 0.0824];
            app.UIFigure.Position = [1 30 1920 1020];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Resize = 'off';

            % Create IOPanel
            app.IOPanel = uipanel(app.UIFigure);
            app.IOPanel.AutoResizeChildren = 'off';
            app.IOPanel.Position = [1 821 1920 200];

            % Create LoggingConsoleLabel
            app.LoggingConsoleLabel = uilabel(app.IOPanel);
            app.LoggingConsoleLabel.HorizontalAlignment = 'center';
            app.LoggingConsoleLabel.FontName = 'Arial';
            app.LoggingConsoleLabel.FontSize = 16;
            app.LoggingConsoleLabel.FontWeight = 'bold';
            app.LoggingConsoleLabel.Position = [241 108 1340 41];
            app.LoggingConsoleLabel.Text = 'Logging Console';

            % Create PatMapLabel
            app.PatMapLabel = uilabel(app.IOPanel);
            app.PatMapLabel.HorizontalAlignment = 'center';
            app.PatMapLabel.FontName = 'Arial';
            app.PatMapLabel.FontSize = 32;
            app.PatMapLabel.FontWeight = 'bold';
            app.PatMapLabel.Position = [65 100 119 39];
            app.PatMapLabel.Text = 'PatMap';

            % Create v101Label
            app.v101Label = uilabel(app.IOPanel);
            app.v101Label.FontName = 'Arial';
            app.v101Label.FontSize = 20;
            app.v101Label.FontWeight = 'bold';
            app.v101Label.Position = [91 75 61 24];
            app.v101Label.Text = 'v1.0.1';

            % Create LogTextArea
            app.LogTextArea = uitextarea(app.IOPanel);
            app.LogTextArea.Editable = 'off';
            app.LogTextArea.FontName = 'Arial';
            app.LogTextArea.FontSize = 14;
            app.LogTextArea.Position = [242 17 1339 92];

            % Create ExportButton
            app.ExportButton = uibutton(app.IOPanel, 'push');
            app.ExportButton.ButtonPushedFcn = createCallbackFcn(app, @ExportButtonPushed, true);
            app.ExportButton.Position = [75 38 100 22];
            app.ExportButton.Text = 'Export';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.AutoResizeChildren = 'off';
            app.TabGroup.SelectionChangedFcn = createCallbackFcn(app, @TabGroupSelectionChanged, true);
            app.TabGroup.Position = [21 31 1880 770];

            % Create IOTab
            app.IOTab = uitab(app.TabGroup);
            app.IOTab.AutoResizeChildren = 'off';
            app.IOTab.Title = 'IO';

            % Create ParamsPanel
            app.ParamsPanel = uipanel(app.IOTab);
            app.ParamsPanel.AutoResizeChildren = 'off';
            app.ParamsPanel.FontName = 'Arial';
            app.ParamsPanel.Position = [951 25 910 700];

            % Create ParamsFilePath
            app.ParamsFilePath = uieditfield(app.ParamsPanel, 'text');
            app.ParamsFilePath.Editable = 'off';
            app.ParamsFilePath.FontName = 'Arial';
            app.ParamsFilePath.Position = [324 630 567 22];
            app.ParamsFilePath.Value = 'Load Parameters File (.mat)';

            % Create BrowseParams
            app.BrowseParams = uibutton(app.ParamsPanel, 'push');
            app.BrowseParams.ButtonPushedFcn = createCallbackFcn(app, @BrowseParamsButtonPushed, true);
            app.BrowseParams.Position = [21 630 81 22];
            app.BrowseParams.Text = 'Browse';

            % Create LoadParams
            app.LoadParams = uibutton(app.ParamsPanel, 'push');
            app.LoadParams.ButtonPushedFcn = createCallbackFcn(app, @LoadParamsButtonPushed, true);
            app.LoadParams.Position = [122 630 81 22];
            app.LoadParams.Text = 'Load';

            % Create SaveParams
            app.SaveParams = uibutton(app.ParamsPanel, 'push');
            app.SaveParams.ButtonPushedFcn = createCallbackFcn(app, @SaveParamsButtonPushed, true);
            app.SaveParams.Position = [223 630 81 22];
            app.SaveParams.Text = 'Save';

            % Create ParametersLabel
            app.ParametersLabel = uilabel(app.ParamsPanel);
            app.ParametersLabel.FontName = 'Arial';
            app.ParametersLabel.FontSize = 16;
            app.ParametersLabel.FontWeight = 'bold';
            app.ParametersLabel.Position = [11 667 93 22];
            app.ParametersLabel.Text = 'Parameters';

            % Create ShuffleDataEditFieldLabel
            app.ShuffleDataEditFieldLabel = uilabel(app.ParamsPanel);
            app.ShuffleDataEditFieldLabel.HorizontalAlignment = 'right';
            app.ShuffleDataEditFieldLabel.Position = [97 500 71 22];
            app.ShuffleDataEditFieldLabel.Text = 'Shuffle Data';

            % Create ShuffleDataEditField
            app.ShuffleDataEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.ShuffleDataEditField.Limits = [0 1];
            app.ShuffleDataEditField.RoundFractionalValues = 'on';
            app.ShuffleDataEditField.ValueDisplayFormat = '%.0f';
            app.ShuffleDataEditField.ValueChangedFcn = createCallbackFcn(app, @ShuffleDataEditFieldValueChanged, true);
            app.ShuffleDataEditField.FontName = 'Arial';
            app.ShuffleDataEditField.Position = [170 500 100 22];
            app.ShuffleDataEditField.Value = 1;

            % Create ParallelProcessingEditFieldLabel
            app.ParallelProcessingEditFieldLabel = uilabel(app.ParamsPanel);
            app.ParallelProcessingEditFieldLabel.HorizontalAlignment = 'right';
            app.ParallelProcessingEditFieldLabel.FontName = 'Arial';
            app.ParallelProcessingEditFieldLabel.Position = [60 550 108 22];
            app.ParallelProcessingEditFieldLabel.Text = 'Parallel Processing';

            % Create ParallelProcessingEditField
            app.ParallelProcessingEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.ParallelProcessingEditField.Limits = [0 1];
            app.ParallelProcessingEditField.RoundFractionalValues = 'on';
            app.ParallelProcessingEditField.ValueDisplayFormat = '%.0f';
            app.ParallelProcessingEditField.ValueChangedFcn = createCallbackFcn(app, @ParallelProcessingEditFieldValueChanged, true);
            app.ParallelProcessingEditField.FontName = 'Arial';
            app.ParallelProcessingEditField.Position = [170 550 100 22];

            % Create TrainingTestingSplitEditFieldLabel
            app.TrainingTestingSplitEditFieldLabel = uilabel(app.ParamsPanel);
            app.TrainingTestingSplitEditFieldLabel.HorizontalAlignment = 'right';
            app.TrainingTestingSplitEditFieldLabel.FontName = 'Arial';
            app.TrainingTestingSplitEditFieldLabel.Position = [52 450 117 22];
            app.TrainingTestingSplitEditFieldLabel.Text = 'Training-Testing Split';

            % Create TrainingTestingSplitEditField
            app.TrainingTestingSplitEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.TrainingTestingSplitEditField.Limits = [0 1];
            app.TrainingTestingSplitEditField.ValueDisplayFormat = '%.2f';
            app.TrainingTestingSplitEditField.ValueChangedFcn = createCallbackFcn(app, @TrainingTestingSplitEditFieldValueChanged, true);
            app.TrainingTestingSplitEditField.FontName = 'Arial';
            app.TrainingTestingSplitEditField.Position = [170 450 100 22];
            app.TrainingTestingSplitEditField.Value = 0.8;

            % Create AlphaEditFieldLabel
            app.AlphaEditFieldLabel = uilabel(app.ParamsPanel);
            app.AlphaEditFieldLabel.HorizontalAlignment = 'right';
            app.AlphaEditFieldLabel.FontName = 'Arial';
            app.AlphaEditFieldLabel.Position = [421 450 36 22];
            app.AlphaEditFieldLabel.Text = 'Alpha';

            % Create AlphaEditField
            app.AlphaEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.AlphaEditField.Limits = [0 1];
            app.AlphaEditField.ValueChangedFcn = createCallbackFcn(app, @AlphaEditFieldValueChanged, true);
            app.AlphaEditField.FontName = 'Arial';
            app.AlphaEditField.Position = [459 450 100 22];
            app.AlphaEditField.Value = 1;

            % Create DensityEditFieldLabel
            app.DensityEditFieldLabel = uilabel(app.ParamsPanel);
            app.DensityEditFieldLabel.HorizontalAlignment = 'right';
            app.DensityEditFieldLabel.FontName = 'Arial';
            app.DensityEditFieldLabel.Position = [412 500 46 22];
            app.DensityEditFieldLabel.Text = 'Density';

            % Create DensityEditField
            app.DensityEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.DensityEditField.Limits = [0 1];
            app.DensityEditField.ValueDisplayFormat = '%.2f';
            app.DensityEditField.ValueChangedFcn = createCallbackFcn(app, @DensityEditFieldValueChanged, true);
            app.DensityEditField.FontName = 'Arial';
            app.DensityEditField.Position = [459 500 100 22];
            app.DensityEditField.Value = 0.25;

            % Create NumberofsLambdaEditFieldLabel
            app.NumberofsLambdaEditFieldLabel = uilabel(app.ParamsPanel);
            app.NumberofsLambdaEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofsLambdaEditFieldLabel.FontName = 'Arial';
            app.NumberofsLambdaEditFieldLabel.Position = [342 400 114 22];
            app.NumberofsLambdaEditFieldLabel.Text = 'Number of sLambda';

            % Create NumberofsLambdaEditField
            app.NumberofsLambdaEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.NumberofsLambdaEditField.Limits = [100 Inf];
            app.NumberofsLambdaEditField.RoundFractionalValues = 'on';
            app.NumberofsLambdaEditField.ValueDisplayFormat = '%.0f';
            app.NumberofsLambdaEditField.ValueChangedFcn = createCallbackFcn(app, @NumberofsLambdaEditFieldValueChanged, true);
            app.NumberofsLambdaEditField.FontName = 'Arial';
            app.NumberofsLambdaEditField.Position = [459 400 100 22];
            app.NumberofsLambdaEditField.Value = 100;

            % Create MinimumsLambdaEditFieldLabel
            app.MinimumsLambdaEditFieldLabel = uilabel(app.ParamsPanel);
            app.MinimumsLambdaEditFieldLabel.HorizontalAlignment = 'right';
            app.MinimumsLambdaEditFieldLabel.FontName = 'Arial';
            app.MinimumsLambdaEditFieldLabel.Position = [350 350 107 22];
            app.MinimumsLambdaEditFieldLabel.Text = 'Minimum sLambda';

            % Create MinimumsLambdaEditField
            app.MinimumsLambdaEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.MinimumsLambdaEditField.Limits = [0 0.99];
            app.MinimumsLambdaEditField.ValueDisplayFormat = '%e';
            app.MinimumsLambdaEditField.ValueChangedFcn = createCallbackFcn(app, @MinimumsLambdaEditFieldValueChanged, true);
            app.MinimumsLambdaEditField.FontName = 'Arial';
            app.MinimumsLambdaEditField.Position = [459 350 100 22];
            app.MinimumsLambdaEditField.Value = 1e-05;

            % Create MaximumsLambdaEditFieldLabel
            app.MaximumsLambdaEditFieldLabel = uilabel(app.ParamsPanel);
            app.MaximumsLambdaEditFieldLabel.HorizontalAlignment = 'right';
            app.MaximumsLambdaEditFieldLabel.FontName = 'Arial';
            app.MaximumsLambdaEditFieldLabel.Position = [348 300 110 22];
            app.MaximumsLambdaEditFieldLabel.Text = 'Maximum sLambda';

            % Create MaximumsLambdaEditField
            app.MaximumsLambdaEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.MaximumsLambdaEditField.Limits = [0 1];
            app.MaximumsLambdaEditField.ValueDisplayFormat = '%e';
            app.MaximumsLambdaEditField.ValueChangedFcn = createCallbackFcn(app, @MaximumsLambdaEditFieldValueChanged, true);
            app.MaximumsLambdaEditField.FontName = 'Arial';
            app.MaximumsLambdaEditField.Position = [459 300 100 22];
            app.MaximumsLambdaEditField.Value = 0.5;

            % Create sLambdaDistributionEditFieldLabel
            app.sLambdaDistributionEditFieldLabel = uilabel(app.ParamsPanel);
            app.sLambdaDistributionEditFieldLabel.HorizontalAlignment = 'right';
            app.sLambdaDistributionEditFieldLabel.FontName = 'Arial';
            app.sLambdaDistributionEditFieldLabel.Position = [340 250 118 22];
            app.sLambdaDistributionEditFieldLabel.Text = 'sLambda Distribution';

            % Create sLambdaDistributionEditField
            app.sLambdaDistributionEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.sLambdaDistributionEditField.Limits = [0 1];
            app.sLambdaDistributionEditField.RoundFractionalValues = 'on';
            app.sLambdaDistributionEditField.ValueDisplayFormat = '%.0f';
            app.sLambdaDistributionEditField.ValueChangedFcn = createCallbackFcn(app, @sLambdaDistributionEditFieldValueChanged, true);
            app.sLambdaDistributionEditField.FontName = 'Arial';
            app.sLambdaDistributionEditField.Position = [459 250 100 22];
            app.sLambdaDistributionEditField.Value = 1;

            % Create TemporalInteractionsEditFieldLabel
            app.TemporalInteractionsEditFieldLabel = uilabel(app.ParamsPanel);
            app.TemporalInteractionsEditFieldLabel.HorizontalAlignment = 'right';
            app.TemporalInteractionsEditFieldLabel.FontName = 'Arial';
            app.TemporalInteractionsEditFieldLabel.Enable = 'off';
            app.TemporalInteractionsEditFieldLabel.Visible = 'off';
            app.TemporalInteractionsEditFieldLabel.Position = [643 -11 120 22];
            app.TemporalInteractionsEditFieldLabel.Text = 'Temporal Interactions';

            % Create TemporalInteractionsEditField
            app.TemporalInteractionsEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.TemporalInteractionsEditField.Limits = [0 Inf];
            app.TemporalInteractionsEditField.RoundFractionalValues = 'on';
            app.TemporalInteractionsEditField.ValueDisplayFormat = '%.0f';
            app.TemporalInteractionsEditField.ValueChangedFcn = createCallbackFcn(app, @TemporalInteractionsEditFieldValueChanged, true);
            app.TemporalInteractionsEditField.FontName = 'Arial';
            app.TemporalInteractionsEditField.Enable = 'off';
            app.TemporalInteractionsEditField.Visible = 'off';
            app.TemporalInteractionsEditField.Position = [764 -11 100 22];

            % Create MergeNodeClassesEditField
            app.MergeNodeClassesEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.MergeNodeClassesEditField.Limits = [0 1];
            app.MergeNodeClassesEditField.RoundFractionalValues = 'on';
            app.MergeNodeClassesEditField.ValueDisplayFormat = '%.0f';
            app.MergeNodeClassesEditField.ValueChangedFcn = createCallbackFcn(app, @MergeNodeClassesEditFieldValueChanged, true);
            app.MergeNodeClassesEditField.FontName = 'Arial';
            app.MergeNodeClassesEditField.Position = [459 100 100 22];
            app.MergeNodeClassesEditField.Value = 1;

            % Create MergeNodeClassesEditFieldLabel
            app.MergeNodeClassesEditFieldLabel = uilabel(app.ParamsPanel);
            app.MergeNodeClassesEditFieldLabel.HorizontalAlignment = 'right';
            app.MergeNodeClassesEditFieldLabel.Position = [338 100 118 22];
            app.MergeNodeClassesEditFieldLabel.Text = 'Merge Node Classes';

            % Create UDFUDFInteractionsEditFieldLabel
            app.UDFUDFInteractionsEditFieldLabel = uilabel(app.ParamsPanel);
            app.UDFUDFInteractionsEditFieldLabel.HorizontalAlignment = 'right';
            app.UDFUDFInteractionsEditFieldLabel.FontName = 'Arial';
            app.UDFUDFInteractionsEditFieldLabel.Position = [333 200 124 22];
            app.UDFUDFInteractionsEditFieldLabel.Text = 'UDF-UDF Interactions';

            % Create UDFUDFInteractionsEditField
            app.UDFUDFInteractionsEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.UDFUDFInteractionsEditField.Limits = [0 2];
            app.UDFUDFInteractionsEditField.RoundFractionalValues = 'on';
            app.UDFUDFInteractionsEditField.ValueDisplayFormat = '%.0f';
            app.UDFUDFInteractionsEditField.ValueChangedFcn = createCallbackFcn(app, @UDFUDFInteractionsEditFieldValueChanged, true);
            app.UDFUDFInteractionsEditField.FontName = 'Arial';
            app.UDFUDFInteractionsEditField.Position = [459 200 100 22];

            % Create RankAbsoluteValueofCoefficientsEditField
            app.RankAbsoluteValueofCoefficientsEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.RankAbsoluteValueofCoefficientsEditField.Limits = [0 1];
            app.RankAbsoluteValueofCoefficientsEditField.RoundFractionalValues = 'on';
            app.RankAbsoluteValueofCoefficientsEditField.ValueDisplayFormat = '%.0f';
            app.RankAbsoluteValueofCoefficientsEditField.ValueChangedFcn = createCallbackFcn(app, @RankAbsoluteValueofCoefficientsEditFieldValueChanged, true);
            app.RankAbsoluteValueofCoefficientsEditField.Position = [459 150 100 22];

            % Create RankAbsoluteValueofCoefficientsEditFieldLabel
            app.RankAbsoluteValueofCoefficientsEditFieldLabel = uilabel(app.ParamsPanel);
            app.RankAbsoluteValueofCoefficientsEditFieldLabel.HorizontalAlignment = 'right';
            app.RankAbsoluteValueofCoefficientsEditFieldLabel.Position = [324 150 133 22];
            app.RankAbsoluteValueofCoefficientsEditFieldLabel.Text = 'Absolute Value Ranking';

            % Create NumberofpLambdaEditFieldLabel
            app.NumberofpLambdaEditFieldLabel = uilabel(app.ParamsPanel);
            app.NumberofpLambdaEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofpLambdaEditFieldLabel.FontName = 'Arial';
            app.NumberofpLambdaEditFieldLabel.Position = [631 500 115 22];
            app.NumberofpLambdaEditFieldLabel.Text = 'Number of pLambda';

            % Create NumberofpLambdaEditField
            app.NumberofpLambdaEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.NumberofpLambdaEditField.Limits = [1 Inf];
            app.NumberofpLambdaEditField.RoundFractionalValues = 'on';
            app.NumberofpLambdaEditField.ValueDisplayFormat = '%.0f';
            app.NumberofpLambdaEditField.ValueChangedFcn = createCallbackFcn(app, @NumberofpLambdaEditFieldValueChanged, true);
            app.NumberofpLambdaEditField.FontName = 'Arial';
            app.NumberofpLambdaEditField.Position = [748 500 100 22];
            app.NumberofpLambdaEditField.Value = 2;

            % Create MinimumpLambdaEditFieldLabel
            app.MinimumpLambdaEditFieldLabel = uilabel(app.ParamsPanel);
            app.MinimumpLambdaEditFieldLabel.HorizontalAlignment = 'right';
            app.MinimumpLambdaEditFieldLabel.FontName = 'Arial';
            app.MinimumpLambdaEditFieldLabel.Position = [636 449 108 22];
            app.MinimumpLambdaEditFieldLabel.Text = 'Minimum pLambda';

            % Create MinimumpLambdaEditField
            app.MinimumpLambdaEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.MinimumpLambdaEditField.Limits = [1 Inf];
            app.MinimumpLambdaEditField.RoundFractionalValues = 'on';
            app.MinimumpLambdaEditField.ValueDisplayFormat = '%.0f';
            app.MinimumpLambdaEditField.ValueChangedFcn = createCallbackFcn(app, @MinimumpLambdaEditFieldValueChanged, true);
            app.MinimumpLambdaEditField.FontName = 'Arial';
            app.MinimumpLambdaEditField.Position = [748 450 100 22];
            app.MinimumpLambdaEditField.Value = 1000;

            % Create MaximumpLambdaEditFieldLabel
            app.MaximumpLambdaEditFieldLabel = uilabel(app.ParamsPanel);
            app.MaximumpLambdaEditFieldLabel.HorizontalAlignment = 'right';
            app.MaximumpLambdaEditFieldLabel.FontName = 'Arial';
            app.MaximumpLambdaEditFieldLabel.Position = [635 400 111 22];
            app.MaximumpLambdaEditFieldLabel.Text = 'Maximum pLambda';

            % Create MaximumpLambdaEditField
            app.MaximumpLambdaEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.MaximumpLambdaEditField.Limits = [1 Inf];
            app.MaximumpLambdaEditField.RoundFractionalValues = 'on';
            app.MaximumpLambdaEditField.ValueDisplayFormat = '%.0f';
            app.MaximumpLambdaEditField.ValueChangedFcn = createCallbackFcn(app, @MaximumpLambdaEditFieldValueChanged, true);
            app.MaximumpLambdaEditField.FontName = 'Arial';
            app.MaximumpLambdaEditField.Position = [748 400 100 22];
            app.MaximumpLambdaEditField.Value = 100000;

            % Create fValEpsilonEditFieldLabel
            app.fValEpsilonEditFieldLabel = uilabel(app.ParamsPanel);
            app.fValEpsilonEditFieldLabel.HorizontalAlignment = 'right';
            app.fValEpsilonEditFieldLabel.FontName = 'Arial';
            app.fValEpsilonEditFieldLabel.Position = [677 300 68 22];
            app.fValEpsilonEditFieldLabel.Text = 'fVal Epsilon';

            % Create fValEpsilonEditField
            app.fValEpsilonEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.fValEpsilonEditField.Limits = [0 Inf];
            app.fValEpsilonEditField.ValueChangedFcn = createCallbackFcn(app, @fValEpsilonEditFieldValueChanged, true);
            app.fValEpsilonEditField.FontName = 'Arial';
            app.fValEpsilonEditField.Position = [748 300 100 22];
            app.fValEpsilonEditField.Value = 0.1;

            % Create MaxIterationsEditFieldLabel
            app.MaxIterationsEditFieldLabel = uilabel(app.ParamsPanel);
            app.MaxIterationsEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxIterationsEditFieldLabel.FontName = 'Arial';
            app.MaxIterationsEditFieldLabel.Position = [665 150 81 22];
            app.MaxIterationsEditFieldLabel.Text = 'Max Iterations';

            % Create MaxIterationsEditField
            app.MaxIterationsEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.MaxIterationsEditField.Limits = [1 Inf];
            app.MaxIterationsEditField.RoundFractionalValues = 'on';
            app.MaxIterationsEditField.ValueDisplayFormat = '%.0f';
            app.MaxIterationsEditField.ValueChangedFcn = createCallbackFcn(app, @MaxIterationsEditFieldValueChanged, true);
            app.MaxIterationsEditField.FontName = 'Arial';
            app.MaxIterationsEditField.Position = [748 150 100 22];
            app.MaxIterationsEditField.Value = 75000;

            % Create MaximumTimetoConvergenceEditFieldLabel
            app.MaximumTimetoConvergenceEditFieldLabel = uilabel(app.ParamsPanel);
            app.MaximumTimetoConvergenceEditFieldLabel.HorizontalAlignment = 'right';
            app.MaximumTimetoConvergenceEditFieldLabel.FontName = 'Arial';
            app.MaximumTimetoConvergenceEditFieldLabel.Position = [571 100 175 22];
            app.MaximumTimetoConvergenceEditFieldLabel.Text = 'Maximum Time to Convergence';

            % Create MaximumTimetoConvergenceEditField
            app.MaximumTimetoConvergenceEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.MaximumTimetoConvergenceEditField.Limits = [1 Inf];
            app.MaximumTimetoConvergenceEditField.RoundFractionalValues = 'on';
            app.MaximumTimetoConvergenceEditField.ValueDisplayFormat = '%.0f (s)';
            app.MaximumTimetoConvergenceEditField.ValueChangedFcn = createCallbackFcn(app, @MaximumTimetoConvergenceEditFieldValueChanged, true);
            app.MaximumTimetoConvergenceEditField.FontName = 'Arial';
            app.MaximumTimetoConvergenceEditField.Position = [748 100 100 22];
            app.MaximumTimetoConvergenceEditField.Value = Inf;

            % Create PrintIntervalEditFieldLabel
            app.PrintIntervalEditFieldLabel = uilabel(app.ParamsPanel);
            app.PrintIntervalEditFieldLabel.HorizontalAlignment = 'right';
            app.PrintIntervalEditFieldLabel.FontName = 'Arial';
            app.PrintIntervalEditFieldLabel.Position = [671 250 73 22];
            app.PrintIntervalEditFieldLabel.Text = 'Print Interval';

            % Create PrintIntervalEditField
            app.PrintIntervalEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.PrintIntervalEditField.Limits = [1 Inf];
            app.PrintIntervalEditField.RoundFractionalValues = 'on';
            app.PrintIntervalEditField.ValueDisplayFormat = '%.0f iterations';
            app.PrintIntervalEditField.ValueChangedFcn = createCallbackFcn(app, @PrintIntervalEditFieldValueChanged, true);
            app.PrintIntervalEditField.FontName = 'Arial';
            app.PrintIntervalEditField.Position = [749 250 100 22];
            app.PrintIntervalEditField.Value = 1000;

            % Create ImplementationModeEditFieldLabel
            app.ImplementationModeEditFieldLabel = uilabel(app.ParamsPanel);
            app.ImplementationModeEditFieldLabel.HorizontalAlignment = 'right';
            app.ImplementationModeEditFieldLabel.FontName = 'Arial';
            app.ImplementationModeEditFieldLabel.Position = [624 550 121 22];
            app.ImplementationModeEditFieldLabel.Text = 'Implementation Mode';

            % Create ImplementationModeEditField
            app.ImplementationModeEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.ImplementationModeEditField.Limits = [1 4];
            app.ImplementationModeEditField.RoundFractionalValues = 'on';
            app.ImplementationModeEditField.ValueDisplayFormat = '%.0f';
            app.ImplementationModeEditField.ValueChangedFcn = createCallbackFcn(app, @ImplementationModeEditFieldValueChanged, true);
            app.ImplementationModeEditField.FontName = 'Arial';
            app.ImplementationModeEditField.Position = [748 550 100 22];
            app.ImplementationModeEditField.Value = 1;

            % Create NumberofStructuresEditFieldLabel
            app.NumberofStructuresEditFieldLabel = uilabel(app.ParamsPanel);
            app.NumberofStructuresEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofStructuresEditFieldLabel.FontName = 'Arial';
            app.NumberofStructuresEditFieldLabel.Position = [47 100 120 22];
            app.NumberofStructuresEditFieldLabel.Text = 'Number of Structures';

            % Create NumberofStructuresEditField
            app.NumberofStructuresEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.NumberofStructuresEditField.Limits = [1 Inf];
            app.NumberofStructuresEditField.RoundFractionalValues = 'on';
            app.NumberofStructuresEditField.ValueDisplayFormat = '%.0f';
            app.NumberofStructuresEditField.ValueChangedFcn = createCallbackFcn(app, @NumberofStructuresEditFieldValueChanged, true);
            app.NumberofStructuresEditField.FontName = 'Arial';
            app.NumberofStructuresEditField.Position = [170 100 100 22];
            app.NumberofStructuresEditField.Value = 8;

            % Create NumberofModelsEditFieldLabel
            app.NumberofModelsEditFieldLabel = uilabel(app.ParamsPanel);
            app.NumberofModelsEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofModelsEditFieldLabel.FontName = 'Arial';
            app.NumberofModelsEditFieldLabel.Position = [62 50 104 22];
            app.NumberofModelsEditFieldLabel.Text = 'Number of Models';

            % Create NumberofModelsEditField
            app.NumberofModelsEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.NumberofModelsEditField.Editable = 'off';
            app.NumberofModelsEditField.FontName = 'Arial';
            app.NumberofModelsEditField.Position = [170 50 100 22];
            app.NumberofModelsEditField.Value = 16;

            % Create NumberofRandomControlsEditFieldLabel
            app.NumberofRandomControlsEditFieldLabel = uilabel(app.ParamsPanel);
            app.NumberofRandomControlsEditFieldLabel.HorizontalAlignment = 'right';
            app.NumberofRandomControlsEditFieldLabel.FontName = 'Arial';
            app.NumberofRandomControlsEditFieldLabel.Position = [11 400 158 22];
            app.NumberofRandomControlsEditFieldLabel.Text = 'Number of Random Controls';

            % Create NumberofRandomControlsEditField
            app.NumberofRandomControlsEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.NumberofRandomControlsEditField.ValueChangedFcn = createCallbackFcn(app, @NumberofRandomControlsEditFieldValueChanged, true);
            app.NumberofRandomControlsEditField.FontName = 'Arial';
            app.NumberofRandomControlsEditField.Position = [170 400 100 22];
            app.NumberofRandomControlsEditField.Value = 100;

            % Create IncludeUDFinEnsemblesEditFieldLabel
            app.IncludeUDFinEnsemblesEditFieldLabel = uilabel(app.ParamsPanel);
            app.IncludeUDFinEnsemblesEditFieldLabel.HorizontalAlignment = 'right';
            app.IncludeUDFinEnsemblesEditFieldLabel.FontName = 'Arial';
            app.IncludeUDFinEnsemblesEditFieldLabel.Position = [21 350 151 22];
            app.IncludeUDFinEnsemblesEditFieldLabel.Text = 'Include UDF in Ensembles ';

            % Create IncludeUDFinEnsemblesEditField
            app.IncludeUDFinEnsemblesEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.IncludeUDFinEnsemblesEditField.Limits = [0 1];
            app.IncludeUDFinEnsemblesEditField.RoundFractionalValues = 'on';
            app.IncludeUDFinEnsemblesEditField.ValueDisplayFormat = '%.0f';
            app.IncludeUDFinEnsemblesEditField.ValueChangedFcn = createCallbackFcn(app, @IncludeUDFinEnsemblesEditFieldValueChanged, true);
            app.IncludeUDFinEnsemblesEditField.FontName = 'Arial';
            app.IncludeUDFinEnsemblesEditField.Position = [170 350 100 22];

            % Create pLambdaDistributionEditFieldLabel
            app.pLambdaDistributionEditFieldLabel = uilabel(app.ParamsPanel);
            app.pLambdaDistributionEditFieldLabel.HorizontalAlignment = 'right';
            app.pLambdaDistributionEditFieldLabel.FontName = 'Arial';
            app.pLambdaDistributionEditFieldLabel.Position = [627 350 122 22];
            app.pLambdaDistributionEditFieldLabel.Text = 'pLambda Distribution ';

            % Create pLambdaDistributionEditField
            app.pLambdaDistributionEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.pLambdaDistributionEditField.ValueChangedFcn = createCallbackFcn(app, @pLambdaDistributionEditFieldValueChanged, true);
            app.pLambdaDistributionEditField.FontName = 'Arial';
            app.pLambdaDistributionEditField.Position = [748 350 100 22];

            % Create AssessDecodingEditFieldLabel
            app.AssessDecodingEditFieldLabel = uilabel(app.ParamsPanel);
            app.AssessDecodingEditFieldLabel.HorizontalAlignment = 'right';
            app.AssessDecodingEditFieldLabel.FontName = 'Arial';
            app.AssessDecodingEditFieldLabel.Position = [71 300 98 22];
            app.AssessDecodingEditFieldLabel.Text = 'Assess Decoding';

            % Create AssessDecodingEditField
            app.AssessDecodingEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.AssessDecodingEditField.RoundFractionalValues = 'on';
            app.AssessDecodingEditField.ValueDisplayFormat = '%.0f';
            app.AssessDecodingEditField.ValueChangedFcn = createCallbackFcn(app, @AssessDecodingEditFieldValueChanged, true);
            app.AssessDecodingEditField.FontName = 'Arial';
            app.AssessDecodingEditField.Position = [170 300 100 22];

            % Create ReweightDenominatorDropDownLabel
            app.ReweightDenominatorDropDownLabel = uilabel(app.ParamsPanel);
            app.ReweightDenominatorDropDownLabel.HorizontalAlignment = 'right';
            app.ReweightDenominatorDropDownLabel.FontName = 'Arial';
            app.ReweightDenominatorDropDownLabel.Position = [616 200 128 22];
            app.ReweightDenominatorDropDownLabel.Text = 'Reweight Denominator';

            % Create ReweightDenominatorDropDown
            app.ReweightDenominatorDropDown = uidropdown(app.ParamsPanel);
            app.ReweightDenominatorDropDown.Items = {'mean_degree', 'median_degree', 'max_degree', 'rms_degree', ''};
            app.ReweightDenominatorDropDown.Editable = 'on';
            app.ReweightDenominatorDropDown.ValueChangedFcn = createCallbackFcn(app, @ReweightDenominatorDropDownValueChanged, true);
            app.ReweightDenominatorDropDown.FontName = 'Arial';
            app.ReweightDenominatorDropDown.BackgroundColor = [1 1 1];
            app.ReweightDenominatorDropDown.Position = [748 200 100 22];
            app.ReweightDenominatorDropDown.Value = 'mean_degree';

            % Create TuningCriterionDropDownLabel
            app.TuningCriterionDropDownLabel = uilabel(app.ParamsPanel);
            app.TuningCriterionDropDownLabel.HorizontalAlignment = 'right';
            app.TuningCriterionDropDownLabel.Position = [72 150 90 22];
            app.TuningCriterionDropDownLabel.Text = 'Tuning Criterion';

            % Create TuningCriterionDropDown
            app.TuningCriterionDropDown = uidropdown(app.ParamsPanel);
            app.TuningCriterionDropDown.Items = {'AUC', 'PR'};
            app.TuningCriterionDropDown.Editable = 'on';
            app.TuningCriterionDropDown.ValueChangedFcn = createCallbackFcn(app, @TuningCriterionDropDownValueChanged, true);
            app.TuningCriterionDropDown.BackgroundColor = [1 1 1];
            app.TuningCriterionDropDown.Position = [170 150 100 22];
            app.TuningCriterionDropDown.Value = 'AUC';

            % Create EnsembleSizeDropDownLabel
            app.EnsembleSizeDropDownLabel = uilabel(app.ParamsPanel);
            app.EnsembleSizeDropDownLabel.HorizontalAlignment = 'right';
            app.EnsembleSizeDropDownLabel.Position = [72 200 86 22];
            app.EnsembleSizeDropDownLabel.Text = 'Ensemble Size';

            % Create EnsembleSizeDropDown
            app.EnsembleSizeDropDown = uidropdown(app.ParamsPanel);
            app.EnsembleSizeDropDown.Items = {'coact', 'max_degree', 'coactUDF'};
            app.EnsembleSizeDropDown.Editable = 'on';
            app.EnsembleSizeDropDown.ValueChangedFcn = createCallbackFcn(app, @EnsembleSizeDropDownValueChanged, true);
            app.EnsembleSizeDropDown.BackgroundColor = [1 1 1];
            app.EnsembleSizeDropDown.Position = [170 200 100 22];
            app.EnsembleSizeDropDown.Value = 'coact';

            % Create AssessClusteringEditFieldLabel
            app.AssessClusteringEditFieldLabel = uilabel(app.ParamsPanel);
            app.AssessClusteringEditFieldLabel.HorizontalAlignment = 'right';
            app.AssessClusteringEditFieldLabel.FontName = 'Arial';
            app.AssessClusteringEditFieldLabel.Position = [63 250 102 22];
            app.AssessClusteringEditFieldLabel.Text = 'Assess Clustering';

            % Create AssessClusteringEditField
            app.AssessClusteringEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.AssessClusteringEditField.Limits = [0 1];
            app.AssessClusteringEditField.ValueDisplayFormat = '%.0f';
            app.AssessClusteringEditField.ValueChangedFcn = createCallbackFcn(app, @AssessClusteringEditFieldValueChanged, true);
            app.AssessClusteringEditField.FontName = 'Arial';
            app.AssessClusteringEditField.Position = [170 250 100 22];

            % Create GeneralLabel
            app.GeneralLabel = uilabel(app.ParamsPanel);
            app.GeneralLabel.HorizontalAlignment = 'center';
            app.GeneralLabel.FontName = 'Arial';
            app.GeneralLabel.FontSize = 16;
            app.GeneralLabel.FontWeight = 'bold';
            app.GeneralLabel.Position = [60 575 210 34];
            app.GeneralLabel.Text = 'General';

            % Create StructuralLearningLabel
            app.StructuralLearningLabel = uilabel(app.ParamsPanel);
            app.StructuralLearningLabel.HorizontalAlignment = 'center';
            app.StructuralLearningLabel.FontName = 'Arial';
            app.StructuralLearningLabel.FontSize = 16;
            app.StructuralLearningLabel.FontWeight = 'bold';
            app.StructuralLearningLabel.Position = [359 575 210 34];
            app.StructuralLearningLabel.Text = 'Structural Learning';

            % Create ParameterEstimationLabel
            app.ParameterEstimationLabel = uilabel(app.ParamsPanel);
            app.ParameterEstimationLabel.HorizontalAlignment = 'center';
            app.ParameterEstimationLabel.FontName = 'Arial';
            app.ParameterEstimationLabel.FontSize = 16;
            app.ParameterEstimationLabel.FontWeight = 'bold';
            app.ParameterEstimationLabel.Position = [631 575 210 34];
            app.ParameterEstimationLabel.Text = 'Parameter Estimation';

            % Create ParallelLearningEditFieldLabel
            app.ParallelLearningEditFieldLabel = uilabel(app.ParamsPanel);
            app.ParallelLearningEditFieldLabel.HorizontalAlignment = 'right';
            app.ParallelLearningEditFieldLabel.FontName = 'Arial';
            app.ParallelLearningEditFieldLabel.Position = [362 550 96 22];
            app.ParallelLearningEditFieldLabel.Text = 'Parallel Learning';

            % Create ParallelLearningEditField
            app.ParallelLearningEditField = uieditfield(app.ParamsPanel, 'numeric');
            app.ParallelLearningEditField.Limits = [0 1];
            app.ParallelLearningEditField.RoundFractionalValues = 'on';
            app.ParallelLearningEditField.ValueDisplayFormat = '%.0f';
            app.ParallelLearningEditField.ValueChangedFcn = createCallbackFcn(app, @ParallelLearningEditFieldValueChanged, true);
            app.ParallelLearningEditField.FontName = 'Arial';
            app.ParallelLearningEditField.Position = [459 550 100 22];

            % Create IOModelPanel
            app.IOModelPanel = uipanel(app.IOTab);
            app.IOModelPanel.AutoResizeChildren = 'off';
            app.IOModelPanel.Position = [21 25 910 700];

            % Create NewModelPanel
            app.NewModelPanel = uipanel(app.IOModelPanel);
            app.NewModelPanel.AutoResizeChildren = 'off';
            app.NewModelPanel.Position = [21 449 870 230];

            % Create InitializeNewModelLabel
            app.InitializeNewModelLabel = uilabel(app.NewModelPanel);
            app.InitializeNewModelLabel.FontName = 'Arial';
            app.InitializeNewModelLabel.FontSize = 16;
            app.InitializeNewModelLabel.FontWeight = 'bold';
            app.InitializeNewModelLabel.Position = [28 194 161 22];
            app.InitializeNewModelLabel.Text = 'Initialize New Model ';

            % Create NewModelButton
            app.NewModelButton = uibutton(app.NewModelPanel, 'push');
            app.NewModelButton.ButtonPushedFcn = createCallbackFcn(app, @NewModelButtonPushed, true);
            app.NewModelButton.FontName = 'Arial';
            app.NewModelButton.Position = [21 168 80 22];
            app.NewModelButton.Text = 'New Model';

            % Create NewModelEditField
            app.NewModelEditField = uieditfield(app.NewModelPanel, 'text');
            app.NewModelEditField.FontName = 'Arial';
            app.NewModelEditField.Position = [251 168 599 22];
            app.NewModelEditField.Value = 'New Model File Name (.mat)';

            % Create DataFilePath
            app.DataFilePath = uieditfield(app.NewModelPanel, 'text');
            app.DataFilePath.Editable = 'off';
            app.DataFilePath.FontName = 'Arial';
            app.DataFilePath.Position = [250 131 600 22];
            app.DataFilePath.Value = 'Load Spike Matrix (.mat)';

            % Create BrowseData
            app.BrowseData = uibutton(app.NewModelPanel, 'push');
            app.BrowseData.ButtonPushedFcn = createCallbackFcn(app, @BrowseDataButtonPushed, true);
            app.BrowseData.FontName = 'Arial';
            app.BrowseData.Position = [20 131 80 22];
            app.BrowseData.Text = 'Browse';

            % Create LoadData
            app.LoadData = uibutton(app.NewModelPanel, 'push');
            app.LoadData.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButtonPushed, true);
            app.LoadData.FontName = 'Arial';
            app.LoadData.Position = [140 131 80 22];
            app.LoadData.Text = 'Load';

            % Create UDFFilePath
            app.UDFFilePath = uieditfield(app.NewModelPanel, 'text');
            app.UDFFilePath.Editable = 'off';
            app.UDFFilePath.FontName = 'Arial';
            app.UDFFilePath.Position = [250 94 600 22];
            app.UDFFilePath.Value = 'Load User-Defined Features (.mat)';

            % Create BrowseUDF
            app.BrowseUDF = uibutton(app.NewModelPanel, 'push');
            app.BrowseUDF.ButtonPushedFcn = createCallbackFcn(app, @BrowseUDFButtonPushed, true);
            app.BrowseUDF.FontName = 'Arial';
            app.BrowseUDF.Position = [20 94 80 22];
            app.BrowseUDF.Text = 'Browse';

            % Create LoadUDF
            app.LoadUDF = uibutton(app.NewModelPanel, 'push');
            app.LoadUDF.ButtonPushedFcn = createCallbackFcn(app, @LoadUDFButtonPushed, true);
            app.LoadUDF.FontName = 'Arial';
            app.LoadUDF.Position = [140 94 80 22];
            app.LoadUDF.Text = 'Load';

            % Create ROIsFilePath
            app.ROIsFilePath = uieditfield(app.NewModelPanel, 'text');
            app.ROIsFilePath.Editable = 'off';
            app.ROIsFilePath.FontName = 'Arial';
            app.ROIsFilePath.Position = [250 57 600 22];
            app.ROIsFilePath.Value = 'Load ROI Coordinates (.mat)';

            % Create BrowseROIs
            app.BrowseROIs = uibutton(app.NewModelPanel, 'push');
            app.BrowseROIs.ButtonPushedFcn = createCallbackFcn(app, @BrowseROIsButtonPushed, true);
            app.BrowseROIs.FontName = 'Arial';
            app.BrowseROIs.Position = [20 57 80 22];
            app.BrowseROIs.Text = 'Browse';

            % Create LoadROIs
            app.LoadROIs = uibutton(app.NewModelPanel, 'push');
            app.LoadROIs.ButtonPushedFcn = createCallbackFcn(app, @LoadROIsButtonPushed, true);
            app.LoadROIs.FontName = 'Arial';
            app.LoadROIs.Position = [140 57 80 22];
            app.LoadROIs.Text = 'Load';

            % Create ValidateData
            app.ValidateData = uibutton(app.NewModelPanel, 'push');
            app.ValidateData.ButtonPushedFcn = createCallbackFcn(app, @ValidateDataButtonPushed, true);
            app.ValidateData.FontName = 'Arial';
            app.ValidateData.Position = [140 168 80 22];
            app.ValidateData.Text = 'Validate';

            % Create RunModel
            app.RunModel = uibutton(app.NewModelPanel, 'push');
            app.RunModel.ButtonPushedFcn = createCallbackFcn(app, @RunModelButtonPushed, true);
            app.RunModel.FontName = 'Arial';
            app.RunModel.Enable = 'off';
            app.RunModel.Visible = 'off';
            app.RunModel.Position = [251 168 94 22];
            app.RunModel.Text = 'Run Model';

            % Create IOExistingPanel
            app.IOExistingPanel = uipanel(app.IOModelPanel);
            app.IOExistingPanel.AutoResizeChildren = 'off';
            app.IOExistingPanel.Position = [21 299 870 130];

            % Create ImportExistingModelLabel
            app.ImportExistingModelLabel = uilabel(app.IOExistingPanel);
            app.ImportExistingModelLabel.FontName = 'Arial';
            app.ImportExistingModelLabel.FontSize = 16;
            app.ImportExistingModelLabel.FontWeight = 'bold';
            app.ImportExistingModelLabel.Position = [21 92 173 22];
            app.ImportExistingModelLabel.Text = 'Import Existing Model';

            % Create ModelPath
            app.ModelPath = uieditfield(app.IOExistingPanel, 'text');
            app.ModelPath.Editable = 'off';
            app.ModelPath.FontName = 'Arial';
            app.ModelPath.Position = [250 58 600 22];
            app.ModelPath.Value = 'Load Model (.mat)';

            % Create BrowseModel
            app.BrowseModel = uibutton(app.IOExistingPanel, 'push');
            app.BrowseModel.ButtonPushedFcn = createCallbackFcn(app, @BrowseModelButtonPushed, true);
            app.BrowseModel.FontName = 'Arial';
            app.BrowseModel.Position = [20 58 80 22];
            app.BrowseModel.Text = 'Browse';

            % Create LoadModel
            app.LoadModel = uibutton(app.IOExistingPanel, 'push');
            app.LoadModel.ButtonPushedFcn = createCallbackFcn(app, @LoadModelButtonPushed, true);
            app.LoadModel.FontName = 'Arial';
            app.LoadModel.Position = [140 58 80 22];
            app.LoadModel.Text = 'Load';

            % Create StructuresLamp
            app.StructuresLamp = uilamp(app.IOExistingPanel);
            app.StructuresLamp.Position = [403 21 20 20];
            app.StructuresLamp.Color = [0.0745 0.6235 1];

            % Create PotentialsLamp
            app.PotentialsLamp = uilamp(app.IOExistingPanel);
            app.PotentialsLamp.Position = [489 21 20 20];
            app.PotentialsLamp.Color = [0.0745 0.6235 1];

            % Create NeuronsLamp
            app.NeuronsLamp = uilamp(app.IOExistingPanel);
            app.NeuronsLamp.Position = [661 21 20 20];
            app.NeuronsLamp.Color = [0.0745 0.6235 1];

            % Create EnsemblesLamp
            app.EnsemblesLamp = uilamp(app.IOExistingPanel);
            app.EnsemblesLamp.Position = [747 21 20 20];
            app.EnsemblesLamp.Color = [0.0745 0.6235 1];

            % Create PCLamp
            app.PCLamp = uilamp(app.IOExistingPanel);
            app.PCLamp.Position = [833 21 20 20];
            app.PCLamp.Color = [0.0745 0.6235 1];

            % Create StructuresLabel
            app.StructuresLabel = uilabel(app.IOExistingPanel);
            app.StructuresLabel.Position = [344 20 60 22];
            app.StructuresLabel.Text = 'Structures';

            % Create PotentialsLabel
            app.PotentialsLabel = uilabel(app.IOExistingPanel);
            app.PotentialsLabel.Position = [430 20 58 22];
            app.PotentialsLabel.Text = 'Potentials';

            % Create NeuronsLabel
            app.NeuronsLabel = uilabel(app.IOExistingPanel);
            app.NeuronsLabel.Position = [606 20 51 22];
            app.NeuronsLabel.Text = 'Neurons';

            % Create EnsemblesLabel
            app.EnsemblesLabel = uilabel(app.IOExistingPanel);
            app.EnsemblesLabel.Position = [683 20 65 22];
            app.EnsemblesLabel.Text = 'Ensembles';

            % Create PatCompLabel
            app.PatCompLabel = uilabel(app.IOExistingPanel);
            app.PatCompLabel.Position = [774 20 56 22];
            app.PatCompLabel.Text = 'PatComp';

            % Create ParamsLamp
            app.ParamsLamp = uilamp(app.IOExistingPanel);
            app.ParamsLamp.Position = [59 21 20 20];
            app.ParamsLamp.Color = [0.0745 0.6235 1];

            % Create ParamsLabel
            app.ParamsLabel = uilabel(app.IOExistingPanel);
            app.ParamsLabel.FontName = 'Arial';
            app.ParamsLabel.Position = [8 20 47 22];
            app.ParamsLabel.Text = 'Params';

            % Create SpikeDataLamp
            app.SpikeDataLamp = uilamp(app.IOExistingPanel);
            app.SpikeDataLamp.Position = [145 21 20 20];
            app.SpikeDataLamp.Color = [0.0706 0.6196 1];

            % Create SpikesLabel
            app.SpikesLabel = uilabel(app.IOExistingPanel);
            app.SpikesLabel.FontName = 'Arial';
            app.SpikesLabel.Position = [93 20 42 22];
            app.SpikesLabel.Text = 'Spikes';

            % Create UDFLamp
            app.UDFLamp = uilamp(app.IOExistingPanel);
            app.UDFLamp.Position = [231 21 20 20];
            app.UDFLamp.Color = [0.0706 0.6196 1];

            % Create UDFLabel
            app.UDFLabel = uilabel(app.IOExistingPanel);
            app.UDFLabel.FontName = 'Arial';
            app.UDFLabel.Position = [180 20 30 22];
            app.UDFLabel.Text = 'UDF';

            % Create ROIsLamp
            app.ROIsLamp = uilamp(app.IOExistingPanel);
            app.ROIsLamp.Position = [317 21 20 20];
            app.ROIsLamp.Color = [0.0745 0.6235 1];

            % Create ROIsLabel
            app.ROIsLabel = uilabel(app.IOExistingPanel);
            app.ROIsLabel.FontName = 'Arial';
            app.ROIsLabel.Position = [259 20 33 22];
            app.ROIsLabel.Text = 'ROIs';

            % Create BestModelLamp
            app.BestModelLamp = uilamp(app.IOExistingPanel);
            app.BestModelLamp.Position = [575 21 20 20];
            app.BestModelLamp.Color = [0.0745 0.6235 1];

            % Create BestModelLabel
            app.BestModelLabel = uilabel(app.IOExistingPanel);
            app.BestModelLabel.Position = [514 20 66 22];
            app.BestModelLabel.Text = 'Best Model';

            % Create SLTab_2
            app.SLTab_2 = uitab(app.TabGroup);
            app.SLTab_2.AutoResizeChildren = 'off';
            app.SLTab_2.Title = 'Training';

            % Create OptimizationPanel
            app.OptimizationPanel = uipanel(app.SLTab_2);
            app.OptimizationPanel.AutoResizeChildren = 'off';
            app.OptimizationPanel.Position = [961 15 900 730];

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.OptimizationPanel);
            app.TabGroup3.AutoResizeChildren = 'off';
            app.TabGroup3.Position = [21 8 860 161];

            % Create Tab1
            app.Tab1 = uitab(app.TabGroup3);
            app.Tab1.AutoResizeChildren = 'off';
            app.Tab1.Title = 'Tab1';

            % Create OptInterface_PE
            app.OptInterface_PE = uipanel(app.Tab1);
            app.OptInterface_PE.AutoResizeChildren = 'off';
            app.OptInterface_PE.Position = [8 13 841 111];

            % Create AddLambdaSpecificField_PE
            app.AddLambdaSpecificField_PE = uieditfield(app.OptInterface_PE, 'numeric');
            app.AddLambdaSpecificField_PE.LowerLimitInclusive = 'off';
            app.AddLambdaSpecificField_PE.Limits = [0 Inf];
            app.AddLambdaSpecificField_PE.RoundFractionalValues = 'on';
            app.AddLambdaSpecificField_PE.ValueDisplayFormat = '%.0f';
            app.AddLambdaSpecificField_PE.HorizontalAlignment = 'center';
            app.AddLambdaSpecificField_PE.FontName = 'Arial';
            app.AddLambdaSpecificField_PE.FontSize = 14;
            app.AddLambdaSpecificField_PE.Position = [146 59 100 40];
            app.AddLambdaSpecificField_PE.Value = 1;

            % Create AddLambdaButton_PE
            app.AddLambdaButton_PE = uibutton(app.OptInterface_PE, 'push');
            app.AddLambdaButton_PE.ButtonPushedFcn = createCallbackFcn(app, @AddLambdaButton_PEPushed, true);
            app.AddLambdaButton_PE.FontName = 'Arial';
            app.AddLambdaButton_PE.FontSize = 14;
            app.AddLambdaButton_PE.Position = [7 59 112 40];
            app.AddLambdaButton_PE.Text = 'Add Lambda';

            % Create PlotModelEditField_PE
            app.PlotModelEditField_PE = uieditfield(app.OptInterface_PE, 'numeric');
            app.PlotModelEditField_PE.Limits = [1 Inf];
            app.PlotModelEditField_PE.RoundFractionalValues = 'on';
            app.PlotModelEditField_PE.ValueDisplayFormat = '%.0f';
            app.PlotModelEditField_PE.HorizontalAlignment = 'center';
            app.PlotModelEditField_PE.FontName = 'Arial';
            app.PlotModelEditField_PE.FontSize = 14;
            app.PlotModelEditField_PE.Position = [392 58 141 40];
            app.PlotModelEditField_PE.Value = 1;

            % Create PlotModel_PE
            app.PlotModel_PE = uibutton(app.OptInterface_PE, 'push');
            app.PlotModel_PE.ButtonPushedFcn = createCallbackFcn(app, @PlotModel_PEPushed, true);
            app.PlotModel_PE.FontName = 'Arial';
            app.PlotModel_PE.FontSize = 14;
            app.PlotModel_PE.Position = [262 59 112 40];
            app.PlotModel_PE.Text = 'Plot Model';

            % Create SLambdaModelEditField
            app.SLambdaModelEditField = uieditfield(app.OptInterface_PE, 'numeric');
            app.SLambdaModelEditField.LowerLimitInclusive = 'off';
            app.SLambdaModelEditField.Limits = [0 1];
            app.SLambdaModelEditField.ValueDisplayFormat = '%e';
            app.SLambdaModelEditField.Editable = 'off';
            app.SLambdaModelEditField.HorizontalAlignment = 'center';
            app.SLambdaModelEditField.FontName = 'Arial';
            app.SLambdaModelEditField.FontSize = 14;
            app.SLambdaModelEditField.Position = [389 9 141 40];
            app.SLambdaModelEditField.Value = 0.1;

            % Create PLambdaModelEditField
            app.PLambdaModelEditField = uieditfield(app.OptInterface_PE, 'numeric');
            app.PLambdaModelEditField.Limits = [1 Inf];
            app.PLambdaModelEditField.ValueDisplayFormat = '%.0f';
            app.PLambdaModelEditField.Editable = 'off';
            app.PLambdaModelEditField.HorizontalAlignment = 'center';
            app.PLambdaModelEditField.FontName = 'Arial';
            app.PLambdaModelEditField.FontSize = 14;
            app.PLambdaModelEditField.Position = [613 59 180 40];
            app.PLambdaModelEditField.Value = 10000;

            % Create sLambdaLabel
            app.sLambdaLabel = uilabel(app.OptInterface_PE);
            app.sLambdaLabel.FontName = 'Arial';
            app.sLambdaLabel.FontSize = 14;
            app.sLambdaLabel.Position = [294 27 63 22];
            app.sLambdaLabel.Text = 'sLambda';

            % Create pLambdaLabel
            app.pLambdaLabel = uilabel(app.OptInterface_PE);
            app.pLambdaLabel.FontName = 'Arial';
            app.pLambdaLabel.FontSize = 14;
            app.pLambdaLabel.Position = [541 69 64 22];
            app.pLambdaLabel.Text = 'pLambda';

            % Create ImplementationModeLabel
            app.ImplementationModeLabel = uilabel(app.OptInterface_PE);
            app.ImplementationModeLabel.FontName = 'Arial';
            app.ImplementationModeLabel.FontSize = 14;
            app.ImplementationModeLabel.Position = [7 18 140 22];
            app.ImplementationModeLabel.Text = 'Implementation Mode';

            % Create ImplementationModeEditField_PE
            app.ImplementationModeEditField_PE = uieditfield(app.OptInterface_PE, 'numeric');
            app.ImplementationModeEditField_PE.Limits = [1 4];
            app.ImplementationModeEditField_PE.RoundFractionalValues = 'on';
            app.ImplementationModeEditField_PE.ValueDisplayFormat = '%.0f';
            app.ImplementationModeEditField_PE.ValueChangedFcn = createCallbackFcn(app, @ImplementationModeEditField_PEValueChanged, true);
            app.ImplementationModeEditField_PE.HorizontalAlignment = 'center';
            app.ImplementationModeEditField_PE.FontName = 'Arial';
            app.ImplementationModeEditField_PE.FontSize = 14;
            app.ImplementationModeEditField_PE.Position = [146 8 100 40];
            app.ImplementationModeEditField_PE.Value = 1;

            % Create Tab2
            app.Tab2 = uitab(app.TabGroup3);
            app.Tab2.AutoResizeChildren = 'off';
            app.Tab2.Title = 'Tab2';

            % Create OptInterface
            app.OptInterface = uipanel(app.Tab2);
            app.OptInterface.AutoResizeChildren = 'off';
            app.OptInterface.Position = [8 23 419 101];

            % Create PreviewLambdaButton
            app.PreviewLambdaButton = uibutton(app.OptInterface, 'push');
            app.PreviewLambdaButton.ButtonPushedFcn = createCallbackFcn(app, @PreviewLambdaButtonPushed, true);
            app.PreviewLambdaButton.FontName = 'Arial';
            app.PreviewLambdaButton.FontSize = 14;
            app.PreviewLambdaButton.Position = [16 58 180 40];
            app.PreviewLambdaButton.Text = 'Preview Lambda';

            % Create AddStructuresPreviewField
            app.AddStructuresPreviewField = uieditfield(app.OptInterface, 'numeric');
            app.AddStructuresPreviewField.LowerLimitInclusive = 'off';
            app.AddStructuresPreviewField.Limits = [0 Inf];
            app.AddStructuresPreviewField.ValueDisplayFormat = '%e';
            app.AddStructuresPreviewField.HorizontalAlignment = 'center';
            app.AddStructuresPreviewField.FontName = 'Arial';
            app.AddStructuresPreviewField.FontSize = 14;
            app.AddStructuresPreviewField.Position = [224 57 180 40];
            app.AddStructuresPreviewField.Value = 1;

            % Create AddStructuresSpecificField
            app.AddStructuresSpecificField = uieditfield(app.OptInterface, 'numeric');
            app.AddStructuresSpecificField.LowerLimitInclusive = 'off';
            app.AddStructuresSpecificField.Limits = [0 Inf];
            app.AddStructuresSpecificField.ValueDisplayFormat = '%e';
            app.AddStructuresSpecificField.HorizontalAlignment = 'center';
            app.AddStructuresSpecificField.FontName = 'Arial';
            app.AddStructuresSpecificField.FontSize = 14;
            app.AddStructuresSpecificField.Position = [224 7 180 40];
            app.AddStructuresSpecificField.Value = 1;

            % Create AddLambdaButton
            app.AddLambdaButton = uibutton(app.OptInterface, 'push');
            app.AddLambdaButton.ButtonPushedFcn = createCallbackFcn(app, @AddLambdaButtonPushed, true);
            app.AddLambdaButton.FontName = 'Arial';
            app.AddLambdaButton.FontSize = 14;
            app.AddLambdaButton.Position = [16 7 180 40];
            app.AddLambdaButton.Text = 'Add Lambda';

            % Create Tab3
            app.Tab3 = uitab(app.TabGroup3);
            app.Tab3.Title = 'Tab3';

            % Create OptInterface_2
            app.OptInterface_2 = uipanel(app.Tab3);
            app.OptInterface_2.AutoResizeChildren = 'off';
            app.OptInterface_2.Position = [12 8 413 113];

            % Create PreviewLambdaButton_2
            app.PreviewLambdaButton_2 = uibutton(app.OptInterface_2, 'push');
            app.PreviewLambdaButton_2.FontName = 'Arial';
            app.PreviewLambdaButton_2.FontSize = 14;
            app.PreviewLambdaButton_2.Position = [13 62 180 40];
            app.PreviewLambdaButton_2.Text = 'Preview Lambda';

            % Create AddStructuresPreviewField_2
            app.AddStructuresPreviewField_2 = uieditfield(app.OptInterface_2, 'numeric');
            app.AddStructuresPreviewField_2.LowerLimitInclusive = 'off';
            app.AddStructuresPreviewField_2.Limits = [0 Inf];
            app.AddStructuresPreviewField_2.ValueDisplayFormat = '%e';
            app.AddStructuresPreviewField_2.HorizontalAlignment = 'center';
            app.AddStructuresPreviewField_2.FontName = 'Arial';
            app.AddStructuresPreviewField_2.FontSize = 14;
            app.AddStructuresPreviewField_2.Position = [221 62 180 40];
            app.AddStructuresPreviewField_2.Value = 1;

            % Create AddStructuresSpecificField_2
            app.AddStructuresSpecificField_2 = uieditfield(app.OptInterface_2, 'numeric');
            app.AddStructuresSpecificField_2.LowerLimitInclusive = 'off';
            app.AddStructuresSpecificField_2.Limits = [0 Inf];
            app.AddStructuresSpecificField_2.ValueDisplayFormat = '%e';
            app.AddStructuresSpecificField_2.HorizontalAlignment = 'center';
            app.AddStructuresSpecificField_2.FontName = 'Arial';
            app.AddStructuresSpecificField_2.FontSize = 14;
            app.AddStructuresSpecificField_2.Position = [221 11 180 40];
            app.AddStructuresSpecificField_2.Value = 1;

            % Create AddLambdaButton_2
            app.AddLambdaButton_2 = uibutton(app.OptInterface_2, 'push');
            app.AddLambdaButton_2.FontName = 'Arial';
            app.AddLambdaButton_2.FontSize = 14;
            app.AddLambdaButton_2.Position = [13 11 180 40];
            app.AddLambdaButton_2.Text = 'Add Lambda';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.SLTab_2);
            app.TabGroup2.AutoResizeChildren = 'off';
            app.TabGroup2.Position = [0 15 962 730];

            % Create StructuralLearningTab
            app.StructuralLearningTab = uitab(app.TabGroup2);
            app.StructuralLearningTab.AutoResizeChildren = 'off';
            app.StructuralLearningTab.Title = 'Structural Learning';

            % Create SLParams
            app.SLParams = uipanel(app.StructuralLearningTab);
            app.SLParams.AutoResizeChildren = 'off';
            app.SLParams.Position = [17 478 920 216];

            % Create StructuralLearningParametersLabel
            app.StructuralLearningParametersLabel = uilabel(app.SLParams);
            app.StructuralLearningParametersLabel.FontName = 'Arial';
            app.StructuralLearningParametersLabel.FontSize = 16;
            app.StructuralLearningParametersLabel.FontWeight = 'bold';
            app.StructuralLearningParametersLabel.Position = [8 184 247 22];
            app.StructuralLearningParametersLabel.Text = 'Structural Learning Parameters';

            % Create ElasticNetLabel
            app.ElasticNetLabel = uilabel(app.SLParams);
            app.ElasticNetLabel.HorizontalAlignment = 'center';
            app.ElasticNetLabel.FontName = 'Arial';
            app.ElasticNetLabel.FontWeight = 'bold';
            app.ElasticNetLabel.Position = [11 163 233 22];
            app.ElasticNetLabel.Text = 'Elastic Net';

            % Create LambdaLabel
            app.LambdaLabel = uilabel(app.SLParams);
            app.LambdaLabel.HorizontalAlignment = 'center';
            app.LambdaLabel.FontName = 'Arial';
            app.LambdaLabel.FontWeight = 'bold';
            app.LambdaLabel.Position = [344 163 233 22];
            app.LambdaLabel.Text = 'Lambda';

            % Create ConstraintsLabel
            app.ConstraintsLabel = uilabel(app.SLParams);
            app.ConstraintsLabel.HorizontalAlignment = 'center';
            app.ConstraintsLabel.FontName = 'Arial';
            app.ConstraintsLabel.FontWeight = 'bold';
            app.ConstraintsLabel.Position = [677 163 233 22];
            app.ConstraintsLabel.Text = 'Constraints';

            % Create UDFUDFInteractionsEditFieldLabel_2
            app.UDFUDFInteractionsEditFieldLabel_2 = uilabel(app.SLParams);
            app.UDFUDFInteractionsEditFieldLabel_2.HorizontalAlignment = 'right';
            app.UDFUDFInteractionsEditFieldLabel_2.FontName = 'Arial';
            app.UDFUDFInteractionsEditFieldLabel_2.Position = [661 94 124 22];
            app.UDFUDFInteractionsEditFieldLabel_2.Text = 'UDF-UDF Interactions';

            % Create UDFUDFInteractionsEditField_SL
            app.UDFUDFInteractionsEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.UDFUDFInteractionsEditField_SL.Limits = [0 2];
            app.UDFUDFInteractionsEditField_SL.RoundFractionalValues = 'on';
            app.UDFUDFInteractionsEditField_SL.ValueDisplayFormat = '%.0f';
            app.UDFUDFInteractionsEditField_SL.ValueChangedFcn = createCallbackFcn(app, @UDFUDFInteractionsEditField_SLValueChanged, true);
            app.UDFUDFInteractionsEditField_SL.Position = [789 94 100 22];

            % Create RankAbsoluteValueofCoefficientsEditField_SL
            app.RankAbsoluteValueofCoefficientsEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.RankAbsoluteValueofCoefficientsEditField_SL.Limits = [0 1];
            app.RankAbsoluteValueofCoefficientsEditField_SL.RoundFractionalValues = 'on';
            app.RankAbsoluteValueofCoefficientsEditField_SL.ValueDisplayFormat = '%.0f';
            app.RankAbsoluteValueofCoefficientsEditField_SL.ValueChangedFcn = createCallbackFcn(app, @RankAbsoluteValueofCoefficientsEditField_SLValueChanged, true);
            app.RankAbsoluteValueofCoefficientsEditField_SL.Position = [789 53 100 22];

            % Create RankAbsoluteValueofCoefficientsEditFieldLabel_2
            app.RankAbsoluteValueofCoefficientsEditFieldLabel_2 = uilabel(app.SLParams);
            app.RankAbsoluteValueofCoefficientsEditFieldLabel_2.HorizontalAlignment = 'right';
            app.RankAbsoluteValueofCoefficientsEditFieldLabel_2.FontName = 'Arial';
            app.RankAbsoluteValueofCoefficientsEditFieldLabel_2.Position = [652 52 133 22];
            app.RankAbsoluteValueofCoefficientsEditFieldLabel_2.Text = 'Absolute Value Ranking';

            % Create ParallelProcessingEditField_2Label
            app.ParallelProcessingEditField_2Label = uilabel(app.SLParams);
            app.ParallelProcessingEditField_2Label.HorizontalAlignment = 'right';
            app.ParallelProcessingEditField_2Label.FontName = 'Arial';
            app.ParallelProcessingEditField_2Label.Position = [31 134 108 22];
            app.ParallelProcessingEditField_2Label.Text = 'Parallel Processing';

            % Create ParallelProcessingEditField_SL
            app.ParallelProcessingEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.ParallelProcessingEditField_SL.Limits = [0 1];
            app.ParallelProcessingEditField_SL.RoundFractionalValues = 'on';
            app.ParallelProcessingEditField_SL.ValueDisplayFormat = '%.0f';
            app.ParallelProcessingEditField_SL.ValueChangedFcn = createCallbackFcn(app, @ParallelProcessingEditField_SLValueChanged, true);
            app.ParallelProcessingEditField_SL.FontName = 'Arial';
            app.ParallelProcessingEditField_SL.Position = [141 134 100 22];

            % Create AlphaEditField_2Label
            app.AlphaEditField_2Label = uilabel(app.SLParams);
            app.AlphaEditField_2Label.HorizontalAlignment = 'right';
            app.AlphaEditField_2Label.FontName = 'Arial';
            app.AlphaEditField_2Label.Position = [101 94 36 22];
            app.AlphaEditField_2Label.Text = 'Alpha';

            % Create AlphaEditField_SL
            app.AlphaEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.AlphaEditField_SL.Limits = [0 1];
            app.AlphaEditField_SL.ValueChangedFcn = createCallbackFcn(app, @AlphaEditField_SLValueChanged, true);
            app.AlphaEditField_SL.FontName = 'Arial';
            app.AlphaEditField_SL.Position = [141 94 100 22];
            app.AlphaEditField_SL.Value = 1;

            % Create MergeNodeClassesEditField_SL
            app.MergeNodeClassesEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.MergeNodeClassesEditField_SL.Limits = [0 1];
            app.MergeNodeClassesEditField_SL.RoundFractionalValues = 'on';
            app.MergeNodeClassesEditField_SL.ValueDisplayFormat = '%.0f';
            app.MergeNodeClassesEditField_SL.ValueChangedFcn = createCallbackFcn(app, @MergeNodeClassesEditField_SLValueChanged, true);
            app.MergeNodeClassesEditField_SL.FontName = 'Arial';
            app.MergeNodeClassesEditField_SL.Position = [141 54 100 22];
            app.MergeNodeClassesEditField_SL.Value = 1;

            % Create MergeNodeClassesEditFieldLabel_2
            app.MergeNodeClassesEditFieldLabel_2 = uilabel(app.SLParams);
            app.MergeNodeClassesEditFieldLabel_2.HorizontalAlignment = 'right';
            app.MergeNodeClassesEditFieldLabel_2.Position = [20 53 118 22];
            app.MergeNodeClassesEditFieldLabel_2.Text = 'Merge Node Classes';

            % Create NumberofLambdaLabel
            app.NumberofLambdaLabel = uilabel(app.SLParams);
            app.NumberofLambdaLabel.HorizontalAlignment = 'right';
            app.NumberofLambdaLabel.FontName = 'Arial';
            app.NumberofLambdaLabel.Position = [349 134 108 22];
            app.NumberofLambdaLabel.Text = 'Number of Lambda';

            % Create NumberofsLambdaEditField_SL
            app.NumberofsLambdaEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.NumberofsLambdaEditField_SL.Limits = [100 Inf];
            app.NumberofsLambdaEditField_SL.RoundFractionalValues = 'on';
            app.NumberofsLambdaEditField_SL.ValueDisplayFormat = '%.0f';
            app.NumberofsLambdaEditField_SL.ValueChangedFcn = createCallbackFcn(app, @NumberofsLambdaEditField_SLValueChanged, true);
            app.NumberofsLambdaEditField_SL.FontName = 'Arial';
            app.NumberofsLambdaEditField_SL.Position = [461 134 100 22];
            app.NumberofsLambdaEditField_SL.Value = 100;

            % Create MinimumLambdaLabel
            app.MinimumLambdaLabel = uilabel(app.SLParams);
            app.MinimumLambdaLabel.HorizontalAlignment = 'right';
            app.MinimumLambdaLabel.FontName = 'Arial';
            app.MinimumLambdaLabel.Position = [356 94 101 22];
            app.MinimumLambdaLabel.Text = 'Minimum Lambda';

            % Create MinimumsLambdaEditField_SL
            app.MinimumsLambdaEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.MinimumsLambdaEditField_SL.Limits = [0 0.99];
            app.MinimumsLambdaEditField_SL.ValueDisplayFormat = '%e';
            app.MinimumsLambdaEditField_SL.ValueChangedFcn = createCallbackFcn(app, @MinimumsLambdaEditField_SLValueChanged, true);
            app.MinimumsLambdaEditField_SL.FontName = 'Arial';
            app.MinimumsLambdaEditField_SL.Position = [461 94 100 22];
            app.MinimumsLambdaEditField_SL.Value = 1e-05;

            % Create MaximumLambdaLabel
            app.MaximumLambdaLabel = uilabel(app.SLParams);
            app.MaximumLambdaLabel.HorizontalAlignment = 'right';
            app.MaximumLambdaLabel.FontName = 'Arial';
            app.MaximumLambdaLabel.Position = [353 54 104 22];
            app.MaximumLambdaLabel.Text = 'Maximum Lambda';

            % Create MaximumsLambdaEditField_SL
            app.MaximumsLambdaEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.MaximumsLambdaEditField_SL.Limits = [0 1];
            app.MaximumsLambdaEditField_SL.ValueDisplayFormat = '%e';
            app.MaximumsLambdaEditField_SL.ValueChangedFcn = createCallbackFcn(app, @MaximumsLambdaEditField_SLValueChanged, true);
            app.MaximumsLambdaEditField_SL.FontName = 'Arial';
            app.MaximumsLambdaEditField_SL.Position = [461 54 100 22];
            app.MaximumsLambdaEditField_SL.Value = 0.5;

            % Create LambdaDistributionLabel
            app.LambdaDistributionLabel = uilabel(app.SLParams);
            app.LambdaDistributionLabel.HorizontalAlignment = 'right';
            app.LambdaDistributionLabel.FontName = 'Arial';
            app.LambdaDistributionLabel.Position = [345 14 112 22];
            app.LambdaDistributionLabel.Text = 'Lambda Distribution';

            % Create sLambdaDistributionEditField_SL
            app.sLambdaDistributionEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.sLambdaDistributionEditField_SL.Limits = [0 1];
            app.sLambdaDistributionEditField_SL.RoundFractionalValues = 'on';
            app.sLambdaDistributionEditField_SL.ValueDisplayFormat = '%.0f';
            app.sLambdaDistributionEditField_SL.ValueChangedFcn = createCallbackFcn(app, @sLambdaDistributionEditField_SLValueChanged, true);
            app.sLambdaDistributionEditField_SL.FontName = 'Arial';
            app.sLambdaDistributionEditField_SL.Position = [461 14 100 22];
            app.sLambdaDistributionEditField_SL.Value = 1;

            % Create DensityEditField_2Label
            app.DensityEditField_2Label = uilabel(app.SLParams);
            app.DensityEditField_2Label.HorizontalAlignment = 'right';
            app.DensityEditField_2Label.FontName = 'Arial';
            app.DensityEditField_2Label.Position = [741 133 46 22];
            app.DensityEditField_2Label.Text = 'Density';

            % Create DensityEditField_SL
            app.DensityEditField_SL = uieditfield(app.SLParams, 'numeric');
            app.DensityEditField_SL.Limits = [0 1];
            app.DensityEditField_SL.ValueDisplayFormat = '%.2f';
            app.DensityEditField_SL.ValueChangedFcn = createCallbackFcn(app, @DensityEditField_SLValueChanged, true);
            app.DensityEditField_SL.FontName = 'Arial';
            app.DensityEditField_SL.Position = [789 134 100 22];
            app.DensityEditField_SL.Value = 0.25;

            % Create RunningSL
            app.RunningSL = uipanel(app.StructuralLearningTab);
            app.RunningSL.AutoResizeChildren = 'off';
            app.RunningSL.Position = [17 250 640 220];

            % Create LearningLabel
            app.LearningLabel = uilabel(app.RunningSL);
            app.LearningLabel.HorizontalAlignment = 'center';
            app.LearningLabel.FontName = 'Arial';
            app.LearningLabel.FontSize = 16;
            app.LearningLabel.FontWeight = 'bold';
            app.LearningLabel.Position = [11 187 100 22];
            app.LearningLabel.Text = 'Learning';

            % Create PerformStructuralLearningButton
            app.PerformStructuralLearningButton = uibutton(app.RunningSL, 'push');
            app.PerformStructuralLearningButton.ButtonPushedFcn = createCallbackFcn(app, @PerformStructuralLearningButtonPushed, true);
            app.PerformStructuralLearningButton.FontName = 'Arial';
            app.PerformStructuralLearningButton.FontSize = 14;
            app.PerformStructuralLearningButton.Position = [21 139 190 40];
            app.PerformStructuralLearningButton.Text = 'Perform Structural Learning';

            % Create FirstPassStructuresEditFieldLabel
            app.FirstPassStructuresEditFieldLabel = uilabel(app.RunningSL);
            app.FirstPassStructuresEditFieldLabel.HorizontalAlignment = 'center';
            app.FirstPassStructuresEditFieldLabel.FontName = 'Arial';
            app.FirstPassStructuresEditFieldLabel.FontSize = 14;
            app.FirstPassStructuresEditFieldLabel.Position = [231 139 170 40];
            app.FirstPassStructuresEditFieldLabel.Text = 'First Pass Structures';

            % Create FirstPassStructuresEditField
            app.FirstPassStructuresEditField = uieditfield(app.RunningSL, 'numeric');
            app.FirstPassStructuresEditField.Limits = [1 Inf];
            app.FirstPassStructuresEditField.RoundFractionalValues = 'on';
            app.FirstPassStructuresEditField.ValueDisplayFormat = '%.0f';
            app.FirstPassStructuresEditField.ValueChangedFcn = createCallbackFcn(app, @FirstPassStructuresEditFieldValueChanged, true);
            app.FirstPassStructuresEditField.HorizontalAlignment = 'center';
            app.FirstPassStructuresEditField.FontName = 'Arial';
            app.FirstPassStructuresEditField.FontSize = 14;
            app.FirstPassStructuresEditField.Position = [421 139 40 40];
            app.FirstPassStructuresEditField.Value = 8;

            % Create PreviewPassedStructuresButton
            app.PreviewPassedStructuresButton = uibutton(app.RunningSL, 'push');
            app.PreviewPassedStructuresButton.ButtonPushedFcn = createCallbackFcn(app, @PreviewPassedStructuresButtonPushed, true);
            app.PreviewPassedStructuresButton.FontName = 'Arial';
            app.PreviewPassedStructuresButton.FontSize = 14;
            app.PreviewPassedStructuresButton.Position = [21 79 190 40];
            app.PreviewPassedStructuresButton.Text = 'Preview Passed Structures';

            % Create TotalPassedStructuresEditFieldLabel
            app.TotalPassedStructuresEditFieldLabel = uilabel(app.RunningSL);
            app.TotalPassedStructuresEditFieldLabel.HorizontalAlignment = 'center';
            app.TotalPassedStructuresEditFieldLabel.FontName = 'Arial';
            app.TotalPassedStructuresEditFieldLabel.FontSize = 14;
            app.TotalPassedStructuresEditFieldLabel.Position = [221 79 190 40];
            app.TotalPassedStructuresEditFieldLabel.Text = 'Total Passed Structures';

            % Create TotalPassedStructuresEditField
            app.TotalPassedStructuresEditField = uieditfield(app.RunningSL, 'numeric');
            app.TotalPassedStructuresEditField.UpperLimitInclusive = 'off';
            app.TotalPassedStructuresEditField.Limits = [0 Inf];
            app.TotalPassedStructuresEditField.RoundFractionalValues = 'on';
            app.TotalPassedStructuresEditField.ValueDisplayFormat = '%.0f';
            app.TotalPassedStructuresEditField.Editable = 'off';
            app.TotalPassedStructuresEditField.HorizontalAlignment = 'center';
            app.TotalPassedStructuresEditField.FontName = 'Arial';
            app.TotalPassedStructuresEditField.FontSize = 14;
            app.TotalPassedStructuresEditField.Position = [422 79 40 40];

            % Create SelectedLambdasLabel
            app.SelectedLambdasLabel = uilabel(app.RunningSL);
            app.SelectedLambdasLabel.HorizontalAlignment = 'center';
            app.SelectedLambdasLabel.FontName = 'Arial';
            app.SelectedLambdasLabel.FontSize = 14;
            app.SelectedLambdasLabel.Position = [481 139 140 40];
            app.SelectedLambdasLabel.Text = 'Selected Lambdas';

            % Create PreviewAllStructuresButton
            app.PreviewAllStructuresButton = uibutton(app.RunningSL, 'push');
            app.PreviewAllStructuresButton.ButtonPushedFcn = createCallbackFcn(app, @PreviewAllStructuresButtonPushed, true);
            app.PreviewAllStructuresButton.FontName = 'Arial';
            app.PreviewAllStructuresButton.FontSize = 14;
            app.PreviewAllStructuresButton.Position = [21 19 190 40];
            app.PreviewAllStructuresButton.Text = 'Preview All Structures';

            % Create PassAdditionalStructuresButton
            app.PassAdditionalStructuresButton = uibutton(app.RunningSL, 'push');
            app.PassAdditionalStructuresButton.ButtonPushedFcn = createCallbackFcn(app, @PassAdditionalStructuresButtonPushed, true);
            app.PassAdditionalStructuresButton.FontName = 'Arial';
            app.PassAdditionalStructuresButton.FontSize = 14;
            app.PassAdditionalStructuresButton.Position = [221 19 190 40];
            app.PassAdditionalStructuresButton.Text = 'Pass Additional Structures';

            % Create PassAddStructField
            app.PassAddStructField = uieditfield(app.RunningSL, 'numeric');
            app.PassAddStructField.HorizontalAlignment = 'center';
            app.PassAddStructField.Position = [421 19 40 40];

            % Create SelectedLambdasTextArea
            app.SelectedLambdasTextArea = uitextarea(app.RunningSL);
            app.SelectedLambdasTextArea.Position = [481 19 140 99];

            % Create ParameterSpacePanel_SL
            app.ParameterSpacePanel_SL = uipanel(app.StructuralLearningTab);
            app.ParameterSpacePanel_SL.AutoResizeChildren = 'off';
            app.ParameterSpacePanel_SL.Position = [677 250 260 220];

            % Create DegreesSL
            app.DegreesSL = uipanel(app.StructuralLearningTab);
            app.DegreesSL.AutoResizeChildren = 'off';
            app.DegreesSL.Position = [18 10 921 230];

            % Create ParameterEstimationTab
            app.ParameterEstimationTab = uitab(app.TabGroup2);
            app.ParameterEstimationTab.AutoResizeChildren = 'off';
            app.ParameterEstimationTab.Title = 'Parameter Estimation';

            % Create PEParams
            app.PEParams = uipanel(app.ParameterEstimationTab);
            app.PEParams.AutoResizeChildren = 'off';
            app.PEParams.Position = [18 481 920 216];

            % Create ParameterEstimationSettingsLabel
            app.ParameterEstimationSettingsLabel = uilabel(app.PEParams);
            app.ParameterEstimationSettingsLabel.FontName = 'Arial';
            app.ParameterEstimationSettingsLabel.FontSize = 16;
            app.ParameterEstimationSettingsLabel.FontWeight = 'bold';
            app.ParameterEstimationSettingsLabel.Position = [8 184 240 22];
            app.ParameterEstimationSettingsLabel.Text = 'Parameter Estimation Settings';

            % Create LearningLabel_PE
            app.LearningLabel_PE = uilabel(app.PEParams);
            app.LearningLabel_PE.HorizontalAlignment = 'center';
            app.LearningLabel_PE.FontName = 'Arial';
            app.LearningLabel_PE.FontWeight = 'bold';
            app.LearningLabel_PE.Position = [11 163 233 22];
            app.LearningLabel_PE.Text = 'Learning';

            % Create LambdaLabel_PE
            app.LambdaLabel_PE = uilabel(app.PEParams);
            app.LambdaLabel_PE.HorizontalAlignment = 'center';
            app.LambdaLabel_PE.FontName = 'Arial';
            app.LambdaLabel_PE.FontWeight = 'bold';
            app.LambdaLabel_PE.Position = [344 163 233 22];
            app.LambdaLabel_PE.Text = 'Lambda';

            % Create ReportingExpensesLabel
            app.ReportingExpensesLabel = uilabel(app.PEParams);
            app.ReportingExpensesLabel.HorizontalAlignment = 'center';
            app.ReportingExpensesLabel.FontName = 'Arial';
            app.ReportingExpensesLabel.FontWeight = 'bold';
            app.ReportingExpensesLabel.Position = [677 163 233 22];
            app.ReportingExpensesLabel.Text = 'Reporting/Expenses';

            % Create MaxTimeLabel_PE
            app.MaxTimeLabel_PE = uilabel(app.PEParams);
            app.MaxTimeLabel_PE.HorizontalAlignment = 'right';
            app.MaxTimeLabel_PE.FontName = 'Arial';
            app.MaxTimeLabel_PE.Position = [727 94 58 22];
            app.MaxTimeLabel_PE.Text = 'Max Time';

            % Create MaxTimeEditField_PE
            app.MaxTimeEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.MaxTimeEditField_PE.Limits = [1 Inf];
            app.MaxTimeEditField_PE.RoundFractionalValues = 'on';
            app.MaxTimeEditField_PE.ValueDisplayFormat = '%.0f (s)';
            app.MaxTimeEditField_PE.ValueChangedFcn = createCallbackFcn(app, @MaxTimeEditField_PEValueChanged, true);
            app.MaxTimeEditField_PE.Position = [789 94 100 22];
            app.MaxTimeEditField_PE.Value = Inf;

            % Create PrintTestEditField_PE
            app.PrintTestEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.PrintTestEditField_PE.Limits = [1 Inf];
            app.PrintTestEditField_PE.ValueDisplayFormat = '%.0f iterations';
            app.PrintTestEditField_PE.ValueChangedFcn = createCallbackFcn(app, @PrintTestEditField_PEValueChanged, true);
            app.PrintTestEditField_PE.Position = [789 14 100 22];
            app.PrintTestEditField_PE.Value = 100;

            % Create PrintTestLabel_PE
            app.PrintTestLabel_PE = uilabel(app.PEParams);
            app.PrintTestLabel_PE.HorizontalAlignment = 'right';
            app.PrintTestLabel_PE.FontName = 'Arial';
            app.PrintTestLabel_PE.Position = [729 13 56 22];
            app.PrintTestLabel_PE.Text = 'Print Test';

            % Create ParallelProcessingEditField_2Label_2
            app.ParallelProcessingEditField_2Label_2 = uilabel(app.PEParams);
            app.ParallelProcessingEditField_2Label_2.HorizontalAlignment = 'right';
            app.ParallelProcessingEditField_2Label_2.FontName = 'Arial';
            app.ParallelProcessingEditField_2Label_2.Position = [31 134 108 22];
            app.ParallelProcessingEditField_2Label_2.Text = 'Parallel Processing';

            % Create ParallelProcessingEditField_PE
            app.ParallelProcessingEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.ParallelProcessingEditField_PE.Limits = [0 1];
            app.ParallelProcessingEditField_PE.RoundFractionalValues = 'on';
            app.ParallelProcessingEditField_PE.ValueDisplayFormat = '%.0f';
            app.ParallelProcessingEditField_PE.ValueChangedFcn = createCallbackFcn(app, @ParallelProcessingEditField_PEValueChanged, true);
            app.ParallelProcessingEditField_PE.FontName = 'Arial';
            app.ParallelProcessingEditField_PE.Position = [141 134 100 22];

            % Create fValEpsilonLabel
            app.fValEpsilonLabel = uilabel(app.PEParams);
            app.fValEpsilonLabel.HorizontalAlignment = 'right';
            app.fValEpsilonLabel.FontName = 'Arial';
            app.fValEpsilonLabel.Position = [69 94 68 22];
            app.fValEpsilonLabel.Text = 'fVal Epsilon';

            % Create fValEpsilonEditField_PE
            app.fValEpsilonEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.fValEpsilonEditField_PE.Limits = [0 Inf];
            app.fValEpsilonEditField_PE.ValueChangedFcn = createCallbackFcn(app, @fValEpsilonEditField_PEValueChanged, true);
            app.fValEpsilonEditField_PE.FontName = 'Arial';
            app.fValEpsilonEditField_PE.Position = [141 94 100 22];
            app.fValEpsilonEditField_PE.Value = 0.1;

            % Create ComputeTrueLogZEditField_PE
            app.ComputeTrueLogZEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.ComputeTrueLogZEditField_PE.Limits = [0 1];
            app.ComputeTrueLogZEditField_PE.RoundFractionalValues = 'on';
            app.ComputeTrueLogZEditField_PE.ValueDisplayFormat = '%.0f';
            app.ComputeTrueLogZEditField_PE.ValueChangedFcn = createCallbackFcn(app, @ComputeTrueLogZEditField_PEValueChanged, true);
            app.ComputeTrueLogZEditField_PE.FontName = 'Arial';
            app.ComputeTrueLogZEditField_PE.Position = [141 54 100 22];

            % Create ComputeTrueLogZLabel_PE
            app.ComputeTrueLogZLabel_PE = uilabel(app.PEParams);
            app.ComputeTrueLogZLabel_PE.HorizontalAlignment = 'right';
            app.ComputeTrueLogZLabel_PE.Position = [18 53 120 22];
            app.ComputeTrueLogZLabel_PE.Text = 'Computer True Log Z';

            % Create NumberofLambdaLabel_2
            app.NumberofLambdaLabel_2 = uilabel(app.PEParams);
            app.NumberofLambdaLabel_2.HorizontalAlignment = 'right';
            app.NumberofLambdaLabel_2.FontName = 'Arial';
            app.NumberofLambdaLabel_2.Position = [349 134 108 22];
            app.NumberofLambdaLabel_2.Text = 'Number of Lambda';

            % Create NumberofpLambdaEditField_PE
            app.NumberofpLambdaEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.NumberofpLambdaEditField_PE.Limits = [1 Inf];
            app.NumberofpLambdaEditField_PE.RoundFractionalValues = 'on';
            app.NumberofpLambdaEditField_PE.ValueDisplayFormat = '%.0f';
            app.NumberofpLambdaEditField_PE.ValueChangedFcn = createCallbackFcn(app, @NumberofpLambdaEditField_PEValueChanged, true);
            app.NumberofpLambdaEditField_PE.FontName = 'Arial';
            app.NumberofpLambdaEditField_PE.Position = [461 134 100 22];
            app.NumberofpLambdaEditField_PE.Value = 2;

            % Create MinimumLambdaLabel_2
            app.MinimumLambdaLabel_2 = uilabel(app.PEParams);
            app.MinimumLambdaLabel_2.HorizontalAlignment = 'right';
            app.MinimumLambdaLabel_2.FontName = 'Arial';
            app.MinimumLambdaLabel_2.Position = [356 94 101 22];
            app.MinimumLambdaLabel_2.Text = 'Minimum Lambda';

            % Create MinimumpLambdaEditField_PE
            app.MinimumpLambdaEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.MinimumpLambdaEditField_PE.Limits = [1 Inf];
            app.MinimumpLambdaEditField_PE.ValueDisplayFormat = '%e';
            app.MinimumpLambdaEditField_PE.ValueChangedFcn = createCallbackFcn(app, @MinimumpLambdaEditField_PEValueChanged, true);
            app.MinimumpLambdaEditField_PE.FontName = 'Arial';
            app.MinimumpLambdaEditField_PE.Position = [461 94 100 22];
            app.MinimumpLambdaEditField_PE.Value = 1000;

            % Create PrintIntervalLabel
            app.PrintIntervalLabel = uilabel(app.PEParams);
            app.PrintIntervalLabel.HorizontalAlignment = 'right';
            app.PrintIntervalLabel.FontName = 'Arial';
            app.PrintIntervalLabel.Position = [712 54 73 22];
            app.PrintIntervalLabel.Text = 'Print Interval';

            % Create PrintIntervalEditField_PE
            app.PrintIntervalEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.PrintIntervalEditField_PE.Limits = [1 Inf];
            app.PrintIntervalEditField_PE.RoundFractionalValues = 'on';
            app.PrintIntervalEditField_PE.ValueDisplayFormat = '%.0f iterations';
            app.PrintIntervalEditField_PE.ValueChangedFcn = createCallbackFcn(app, @PrintIntervalEditField_PEValueChanged, true);
            app.PrintIntervalEditField_PE.FontName = 'Arial';
            app.PrintIntervalEditField_PE.Position = [789 54 100 22];
            app.PrintIntervalEditField_PE.Value = 1000;

            % Create MaximumLambdaLabel_2
            app.MaximumLambdaLabel_2 = uilabel(app.PEParams);
            app.MaximumLambdaLabel_2.HorizontalAlignment = 'right';
            app.MaximumLambdaLabel_2.FontName = 'Arial';
            app.MaximumLambdaLabel_2.Position = [353 54 104 22];
            app.MaximumLambdaLabel_2.Text = 'Maximum Lambda';

            % Create MaximumpLambdaEditField_PE
            app.MaximumpLambdaEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.MaximumpLambdaEditField_PE.Limits = [1 Inf];
            app.MaximumpLambdaEditField_PE.ValueDisplayFormat = '%e';
            app.MaximumpLambdaEditField_PE.ValueChangedFcn = createCallbackFcn(app, @MaximumpLambdaEditField_PEValueChanged, true);
            app.MaximumpLambdaEditField_PE.FontName = 'Arial';
            app.MaximumpLambdaEditField_PE.Position = [461 54 100 22];
            app.MaximumpLambdaEditField_PE.Value = 100000;

            % Create LambdaDistributionLabel_2
            app.LambdaDistributionLabel_2 = uilabel(app.PEParams);
            app.LambdaDistributionLabel_2.HorizontalAlignment = 'right';
            app.LambdaDistributionLabel_2.FontName = 'Arial';
            app.LambdaDistributionLabel_2.Position = [345 14 112 22];
            app.LambdaDistributionLabel_2.Text = 'Lambda Distribution';

            % Create pLambdaDistributionEditField_PE
            app.pLambdaDistributionEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.pLambdaDistributionEditField_PE.Limits = [0 1];
            app.pLambdaDistributionEditField_PE.RoundFractionalValues = 'on';
            app.pLambdaDistributionEditField_PE.ValueDisplayFormat = '%.0f';
            app.pLambdaDistributionEditField_PE.ValueChangedFcn = createCallbackFcn(app, @pLambdaDistributionEditField_PEValueChanged, true);
            app.pLambdaDistributionEditField_PE.FontName = 'Arial';
            app.pLambdaDistributionEditField_PE.Position = [461 14 100 22];
            app.pLambdaDistributionEditField_PE.Value = 1;

            % Create MaxIterationsLabel
            app.MaxIterationsLabel = uilabel(app.PEParams);
            app.MaxIterationsLabel.HorizontalAlignment = 'right';
            app.MaxIterationsLabel.FontName = 'Arial';
            app.MaxIterationsLabel.Position = [706 133 81 22];
            app.MaxIterationsLabel.Text = 'Max Iterations';

            % Create MaxIterEditField_PE
            app.MaxIterEditField_PE = uieditfield(app.PEParams, 'numeric');
            app.MaxIterEditField_PE.Limits = [1 Inf];
            app.MaxIterEditField_PE.RoundFractionalValues = 'on';
            app.MaxIterEditField_PE.ValueDisplayFormat = '%.0f';
            app.MaxIterEditField_PE.ValueChangedFcn = createCallbackFcn(app, @MaxIterEditField_PEValueChanged, true);
            app.MaxIterEditField_PE.FontName = 'Arial';
            app.MaxIterEditField_PE.Position = [789 134 100 22];
            app.MaxIterEditField_PE.Value = 75000;

            % Create ReweightDenominatorDropDown_2Label
            app.ReweightDenominatorDropDown_2Label = uilabel(app.PEParams);
            app.ReweightDenominatorDropDown_2Label.HorizontalAlignment = 'right';
            app.ReweightDenominatorDropDown_2Label.Position = [18 15 128 22];
            app.ReweightDenominatorDropDown_2Label.Text = 'Reweight Denominator';

            % Create ReweightDenominatorDropDown_PE
            app.ReweightDenominatorDropDown_PE = uidropdown(app.PEParams);
            app.ReweightDenominatorDropDown_PE.Items = {'mean_degree', 'median_degree', 'max_degree', 'rms_degree', ''};
            app.ReweightDenominatorDropDown_PE.Editable = 'on';
            app.ReweightDenominatorDropDown_PE.ValueChangedFcn = createCallbackFcn(app, @ReweightDenominatorDropDown_PEValueChanged, true);
            app.ReweightDenominatorDropDown_PE.BackgroundColor = [1 1 1];
            app.ReweightDenominatorDropDown_PE.Position = [161 15 80 22];
            app.ReweightDenominatorDropDown_PE.Value = 'mean_degree';

            % Create Learning_PE
            app.Learning_PE = uipanel(app.ParameterEstimationTab);
            app.Learning_PE.AutoResizeChildren = 'off';
            app.Learning_PE.Position = [19 255 640 220];

            % Create LearningLabelPanel_PE
            app.LearningLabelPanel_PE = uilabel(app.Learning_PE);
            app.LearningLabelPanel_PE.FontName = 'Arial';
            app.LearningLabelPanel_PE.FontSize = 16;
            app.LearningLabelPanel_PE.FontWeight = 'bold';
            app.LearningLabelPanel_PE.Position = [8 189 73 22];
            app.LearningLabelPanel_PE.Text = 'Learning';

            % Create PerformParameterEstimationButton
            app.PerformParameterEstimationButton = uibutton(app.Learning_PE, 'push');
            app.PerformParameterEstimationButton.ButtonPushedFcn = createCallbackFcn(app, @PerformParameterEstimationButtonPushed, true);
            app.PerformParameterEstimationButton.FontName = 'Arial';
            app.PerformParameterEstimationButton.FontSize = 14;
            app.PerformParameterEstimationButton.Position = [10 139 205 40];
            app.PerformParameterEstimationButton.Text = 'Perform Parameter Estimation';

            % Create FirstPassModelsLabel
            app.FirstPassModelsLabel = uilabel(app.Learning_PE);
            app.FirstPassModelsLabel.HorizontalAlignment = 'center';
            app.FirstPassModelsLabel.FontName = 'Arial';
            app.FirstPassModelsLabel.FontSize = 14;
            app.FirstPassModelsLabel.Position = [227 139 170 40];
            app.FirstPassModelsLabel.Text = 'First Pass Models';

            % Create FirstPassModelsEditField
            app.FirstPassModelsEditField = uieditfield(app.Learning_PE, 'numeric');
            app.FirstPassModelsEditField.Limits = [1 Inf];
            app.FirstPassModelsEditField.RoundFractionalValues = 'on';
            app.FirstPassModelsEditField.ValueDisplayFormat = '%.0f';
            app.FirstPassModelsEditField.Editable = 'off';
            app.FirstPassModelsEditField.HorizontalAlignment = 'center';
            app.FirstPassModelsEditField.FontName = 'Arial';
            app.FirstPassModelsEditField.FontSize = 14;
            app.FirstPassModelsEditField.Position = [417 139 40 40];
            app.FirstPassModelsEditField.Value = 16;

            % Create TotalLearnedModelsLabel
            app.TotalLearnedModelsLabel = uilabel(app.Learning_PE);
            app.TotalLearnedModelsLabel.HorizontalAlignment = 'center';
            app.TotalLearnedModelsLabel.FontName = 'Arial';
            app.TotalLearnedModelsLabel.FontSize = 14;
            app.TotalLearnedModelsLabel.Position = [217 79 190 40];
            app.TotalLearnedModelsLabel.Text = 'Total Learned Models';

            % Create TotalLearnedModelsEditField
            app.TotalLearnedModelsEditField = uieditfield(app.Learning_PE, 'numeric');
            app.TotalLearnedModelsEditField.Limits = [0 Inf];
            app.TotalLearnedModelsEditField.RoundFractionalValues = 'on';
            app.TotalLearnedModelsEditField.ValueDisplayFormat = '%.0f';
            app.TotalLearnedModelsEditField.Editable = 'off';
            app.TotalLearnedModelsEditField.HorizontalAlignment = 'center';
            app.TotalLearnedModelsEditField.FontName = 'Arial';
            app.TotalLearnedModelsEditField.FontSize = 14;
            app.TotalLearnedModelsEditField.Position = [418 79 40 40];

            % Create SelectedLambdasLabel_PE
            app.SelectedLambdasLabel_PE = uilabel(app.Learning_PE);
            app.SelectedLambdasLabel_PE.HorizontalAlignment = 'center';
            app.SelectedLambdasLabel_PE.FontName = 'Arial';
            app.SelectedLambdasLabel_PE.FontSize = 14;
            app.SelectedLambdasLabel_PE.Position = [477 139 140 40];
            app.SelectedLambdasLabel_PE.Text = 'Selected Lambdas';

            % Create ModelsUnlearnedEditField
            app.ModelsUnlearnedEditField = uieditfield(app.Learning_PE, 'numeric');
            app.ModelsUnlearnedEditField.Editable = 'off';
            app.ModelsUnlearnedEditField.HorizontalAlignment = 'center';
            app.ModelsUnlearnedEditField.FontName = 'Arial';
            app.ModelsUnlearnedEditField.FontSize = 14;
            app.ModelsUnlearnedEditField.Position = [417 19 40 40];

            % Create SelectedLambdasTextArea_PE
            app.SelectedLambdasTextArea_PE = uitextarea(app.Learning_PE);
            app.SelectedLambdasTextArea_PE.Position = [477 19 140 99];

            % Create ModelsUnlearnedLabel
            app.ModelsUnlearnedLabel = uilabel(app.Learning_PE);
            app.ModelsUnlearnedLabel.HorizontalAlignment = 'center';
            app.ModelsUnlearnedLabel.FontName = 'Arial';
            app.ModelsUnlearnedLabel.FontSize = 14;
            app.ModelsUnlearnedLabel.Position = [211 19 190 40];
            app.ModelsUnlearnedLabel.Text = 'Models Unlearned';

            % Create LearnAdditionalModelsButton
            app.LearnAdditionalModelsButton = uibutton(app.Learning_PE, 'push');
            app.LearnAdditionalModelsButton.ButtonPushedFcn = createCallbackFcn(app, @LearnAdditionalModelsButtonPushed, true);
            app.LearnAdditionalModelsButton.FontName = 'Arial';
            app.LearnAdditionalModelsButton.FontSize = 14;
            app.LearnAdditionalModelsButton.Position = [11 79 205 40];
            app.LearnAdditionalModelsButton.Text = 'Learn Additional Models';

            % Create ParameterSpacePanel_PE
            app.ParameterSpacePanel_PE = uipanel(app.ParameterEstimationTab);
            app.ParameterSpacePanel_PE.AutoResizeChildren = 'off';
            app.ParameterSpacePanel_PE.Position = [679 255 260 220];

            % Create Potentials_PE
            app.Potentials_PE = uipanel(app.ParameterEstimationTab);
            app.Potentials_PE.AutoResizeChildren = 'off';
            app.Potentials_PE.FontName = 'Arial';
            app.Potentials_PE.Position = [18 5 921 230];

            % Create BandwidthEditFieldLabel
            app.BandwidthEditFieldLabel = uilabel(app.Potentials_PE);
            app.BandwidthEditFieldLabel.HorizontalAlignment = 'right';
            app.BandwidthEditFieldLabel.Position = [9 7 62 22];
            app.BandwidthEditFieldLabel.Text = 'Bandwidth';

            % Create BandwidthEditField
            app.BandwidthEditField = uieditfield(app.Potentials_PE, 'numeric');
            app.BandwidthEditField.ValueChangedFcn = createCallbackFcn(app, @BandwidthEditFieldValueChanged, true);
            app.BandwidthEditField.HorizontalAlignment = 'center';
            app.BandwidthEditField.Position = [86 7 41 22];
            app.BandwidthEditField.Value = 0.05;

            % Create BandwidthEditField_2Label_2
            app.BandwidthEditField_2Label_2 = uilabel(app.Potentials_PE);
            app.BandwidthEditField_2Label_2.HorizontalAlignment = 'right';
            app.BandwidthEditField_2Label_2.Position = [793 10 62 22];
            app.BandwidthEditField_2Label_2.Text = 'Bandwidth';

            % Create BandwidthEditField_2
            app.BandwidthEditField_2 = uieditfield(app.Potentials_PE, 'numeric');
            app.BandwidthEditField_2.ValueChangedFcn = createCallbackFcn(app, @BandwidthEditField_2ValueChanged, true);
            app.BandwidthEditField_2.HorizontalAlignment = 'center';
            app.BandwidthEditField_2.Position = [870 10 41 22];
            app.BandwidthEditField_2.Value = 0.025;

            % Create EVModel
            app.EVModel = uitab(app.TabGroup);
            app.EVModel.Title = 'Evaluate Model';

            % Create BigDecodingPlot
            app.BigDecodingPlot = uipanel(app.EVModel);
            app.BigDecodingPlot.AutoResizeChildren = 'off';
            app.BigDecodingPlot.Position = [961 15 900 710];

            % Create EVParams
            app.EVParams = uipanel(app.EVModel);
            app.EVParams.AutoResizeChildren = 'off';
            app.EVParams.Position = [21 315 440 410];

            % Create ModelEvaluationLabel
            app.ModelEvaluationLabel = uilabel(app.EVParams);
            app.ModelEvaluationLabel.FontName = 'Arial';
            app.ModelEvaluationLabel.FontSize = 16;
            app.ModelEvaluationLabel.FontWeight = 'bold';
            app.ModelEvaluationLabel.Position = [8 378 137 22];
            app.ModelEvaluationLabel.Text = 'Model Evaluation';

            % Create TrainTestWeightLabel
            app.TrainTestWeightLabel = uilabel(app.EVParams);
            app.TrainTestWeightLabel.HorizontalAlignment = 'right';
            app.TrainTestWeightLabel.FontName = 'Arial';
            app.TrainTestWeightLabel.FontSize = 14;
            app.TrainTestWeightLabel.Position = [1 207 114 22];
            app.TrainTestWeightLabel.Text = 'Train:Test Weight';

            % Create TrTstWeighting
            app.TrTstWeighting = uieditfield(app.EVParams, 'numeric');
            app.TrTstWeighting.Limits = [0 1];
            app.TrTstWeighting.RoundFractionalValues = 'on';
            app.TrTstWeighting.ValueChangedFcn = createCallbackFcn(app, @TrTstWeightingValueChanged, true);
            app.TrTstWeighting.FontName = 'Arial';
            app.TrTstWeighting.FontSize = 14;
            app.TrTstWeighting.Position = [120 207 89 22];
            app.TrTstWeighting.Value = 1;

            % Create ReselectBestModelButton
            app.ReselectBestModelButton = uibutton(app.EVParams, 'push');
            app.ReselectBestModelButton.ButtonPushedFcn = createCallbackFcn(app, @ReselectBestModelButtonPushed, true);
            app.ReselectBestModelButton.FontName = 'Arial';
            app.ReselectBestModelButton.FontSize = 14;
            app.ReselectBestModelButton.Position = [11 329 205 40];
            app.ReselectBestModelButton.Text = 'Reselect Best Model';

            % Create EvaluateBestModelButton
            app.EvaluateBestModelButton = uibutton(app.EVParams, 'push');
            app.EvaluateBestModelButton.ButtonPushedFcn = createCallbackFcn(app, @EvaluateBestModelButtonPushed, true);
            app.EvaluateBestModelButton.FontName = 'Arial';
            app.EvaluateBestModelButton.FontSize = 14;
            app.EvaluateBestModelButton.Position = [11 279 205 40];
            app.EvaluateBestModelButton.Text = 'Evaluate Best Model';

            % Create AssessClusteringLabel
            app.AssessClusteringLabel = uilabel(app.EVParams);
            app.AssessClusteringLabel.HorizontalAlignment = 'right';
            app.AssessClusteringLabel.FontName = 'Arial';
            app.AssessClusteringLabel.FontSize = 14;
            app.AssessClusteringLabel.Position = [1 127 118 22];
            app.AssessClusteringLabel.Text = 'Assess Clustering';

            % Create AssessClustering
            app.AssessClustering = uieditfield(app.EVParams, 'numeric');
            app.AssessClustering.Limits = [0 1];
            app.AssessClustering.RoundFractionalValues = 'on';
            app.AssessClustering.ValueDisplayFormat = '%.0f';
            app.AssessClustering.ValueChangedFcn = createCallbackFcn(app, @AssessClusteringValueChanged, true);
            app.AssessClustering.FontName = 'Arial';
            app.AssessClustering.FontSize = 14;
            app.AssessClustering.Position = [120 127 89 22];

            % Create TestLikelihoodLabel
            app.TestLikelihoodLabel = uilabel(app.EVParams);
            app.TestLikelihoodLabel.HorizontalAlignment = 'right';
            app.TestLikelihoodLabel.FontName = 'Arial';
            app.TestLikelihoodLabel.FontSize = 14;
            app.TestLikelihoodLabel.Position = [238 213 98 22];
            app.TestLikelihoodLabel.Text = 'Test Likelihood';

            % Create TestEM
            app.TestEM = uieditfield(app.EVParams, 'numeric');
            app.TestEM.FontName = 'Arial';
            app.TestEM.FontSize = 14;
            app.TestEM.Position = [338 213 89 22];

            % Create BestModelIDLabel
            app.BestModelIDLabel = uilabel(app.EVParams);
            app.BestModelIDLabel.HorizontalAlignment = 'right';
            app.BestModelIDLabel.FontName = 'Arial';
            app.BestModelIDLabel.FontSize = 14;
            app.BestModelIDLabel.Position = [21 247 97 22];
            app.BestModelIDLabel.Text = 'Best Model ID ';

            % Create BestModelID
            app.BestModelID = uieditfield(app.EVParams, 'numeric');
            app.BestModelID.Limits = [0 Inf];
            app.BestModelID.RoundFractionalValues = 'on';
            app.BestModelID.ValueDisplayFormat = '%.0f';
            app.BestModelID.FontName = 'Arial';
            app.BestModelID.FontSize = 14;
            app.BestModelID.Position = [120 247 89 22];

            % Create sLambdaLabel_3
            app.sLambdaLabel_3 = uilabel(app.EVParams);
            app.sLambdaLabel_3.HorizontalAlignment = 'right';
            app.sLambdaLabel_3.FontName = 'Arial';
            app.sLambdaLabel_3.FontSize = 14;
            app.sLambdaLabel_3.Position = [231 333 63 22];
            app.sLambdaLabel_3.Text = 'sLambda';

            % Create sLambdaEM
            app.sLambdaEM = uieditfield(app.EVParams, 'numeric');
            app.sLambdaEM.LowerLimitInclusive = 'off';
            app.sLambdaEM.Limits = [0 1];
            app.sLambdaEM.ValueDisplayFormat = '%e';
            app.sLambdaEM.FontName = 'Arial';
            app.sLambdaEM.FontSize = 14;
            app.sLambdaEM.Position = [301 333 126 22];
            app.sLambdaEM.Value = 1;

            % Create pLambdaLabel_2
            app.pLambdaLabel_2 = uilabel(app.EVParams);
            app.pLambdaLabel_2.HorizontalAlignment = 'right';
            app.pLambdaLabel_2.FontName = 'Arial';
            app.pLambdaLabel_2.FontSize = 14;
            app.pLambdaLabel_2.Position = [231 293 64 22];
            app.pLambdaLabel_2.Text = 'pLambda';

            % Create pLambdaEM
            app.pLambdaEM = uieditfield(app.EVParams, 'numeric');
            app.pLambdaEM.UpperLimitInclusive = 'off';
            app.pLambdaEM.Limits = [1 Inf];
            app.pLambdaEM.RoundFractionalValues = 'on';
            app.pLambdaEM.ValueDisplayFormat = '%e';
            app.pLambdaEM.FontName = 'Arial';
            app.pLambdaEM.FontSize = 14;
            app.pLambdaEM.Position = [301 293 126 22];
            app.pLambdaEM.Value = 1;

            % Create TrainLikelihoodLabel
            app.TrainLikelihoodLabel = uilabel(app.EVParams);
            app.TrainLikelihoodLabel.HorizontalAlignment = 'right';
            app.TrainLikelihoodLabel.FontName = 'Arial';
            app.TrainLikelihoodLabel.FontSize = 14;
            app.TrainLikelihoodLabel.Position = [228 253 104 22];
            app.TrainLikelihoodLabel.Text = 'Train Likelihood';

            % Create TrainEM
            app.TrainEM = uieditfield(app.EVParams, 'numeric');
            app.TrainEM.FontName = 'Arial';
            app.TrainEM.FontSize = 14;
            app.TrainEM.Position = [338 253 89 22];

            % Create AssessDecodingLabel_2
            app.AssessDecodingLabel_2 = uilabel(app.EVParams);
            app.AssessDecodingLabel_2.HorizontalAlignment = 'right';
            app.AssessDecodingLabel_2.FontName = 'Arial';
            app.AssessDecodingLabel_2.FontSize = 14;
            app.AssessDecodingLabel_2.Position = [1 167 114 22];
            app.AssessDecodingLabel_2.Text = 'Assess Decoding';

            % Create AssessDecoding
            app.AssessDecoding = uieditfield(app.EVParams, 'numeric');
            app.AssessDecoding.Limits = [0 1];
            app.AssessDecoding.RoundFractionalValues = 'on';
            app.AssessDecoding.ValueDisplayFormat = '%.0f';
            app.AssessDecoding.ValueChangedFcn = createCallbackFcn(app, @AssessDecodingValueChanged, true);
            app.AssessDecoding.FontName = 'Arial';
            app.AssessDecoding.FontSize = 14;
            app.AssessDecoding.Position = [120 167 89 22];
            app.AssessDecoding.Value = 1;

            % Create GlobalLabel
            app.GlobalLabel = uilabel(app.EVParams);
            app.GlobalLabel.HorizontalAlignment = 'right';
            app.GlobalLabel.FontName = 'Arial';
            app.GlobalLabel.FontSize = 14;
            app.GlobalLabel.Position = [75 55 46 22];
            app.GlobalLabel.Text = 'Global';

            % Create GlobalEM
            app.GlobalEM = uieditfield(app.EVParams, 'numeric');
            app.GlobalEM.Limits = [0 1];
            app.GlobalEM.ValueDisplayFormat = '%.4f';
            app.GlobalEM.FontName = 'Arial';
            app.GlobalEM.FontSize = 14;
            app.GlobalEM.Position = [123 55 89 22];

            % Create LocalLabel
            app.LocalLabel = uilabel(app.EVParams);
            app.LocalLabel.HorizontalAlignment = 'right';
            app.LocalLabel.FontName = 'Arial';
            app.LocalLabel.FontSize = 14;
            app.LocalLabel.Enable = 'off';
            app.LocalLabel.Visible = 'off';
            app.LocalLabel.Position = [78 15 43 22];
            app.LocalLabel.Text = 'Local ';

            % Create LocalEM
            app.LocalEM = uieditfield(app.EVParams, 'numeric');
            app.LocalEM.Limits = [0 1];
            app.LocalEM.ValueDisplayFormat = '%.4f';
            app.LocalEM.FontName = 'Arial';
            app.LocalEM.FontSize = 14;
            app.LocalEM.Enable = 'off';
            app.LocalEM.Visible = 'off';
            app.LocalEM.Position = [123 15 89 22];

            % Create ClusteringCoefficientsLabel
            app.ClusteringCoefficientsLabel = uilabel(app.EVParams);
            app.ClusteringCoefficientsLabel.FontName = 'Arial';
            app.ClusteringCoefficientsLabel.FontSize = 14;
            app.ClusteringCoefficientsLabel.Position = [63 95 145 22];
            app.ClusteringCoefficientsLabel.Text = 'Clustering Coefficients';

            % Create MaxDegreeLabel
            app.MaxDegreeLabel = uilabel(app.EVParams);
            app.MaxDegreeLabel.HorizontalAlignment = 'right';
            app.MaxDegreeLabel.FontName = 'Arial';
            app.MaxDegreeLabel.FontSize = 14;
            app.MaxDegreeLabel.Position = [254 174 82 22];
            app.MaxDegreeLabel.Text = 'Max Degree';

            % Create MaxEM
            app.MaxEM = uieditfield(app.EVParams, 'numeric');
            app.MaxEM.Limits = [0 Inf];
            app.MaxEM.RoundFractionalValues = 'on';
            app.MaxEM.ValueDisplayFormat = '%.0f';
            app.MaxEM.FontName = 'Arial';
            app.MaxEM.FontSize = 14;
            app.MaxEM.Position = [338 174 89 22];

            % Create MeanDegreeLabel
            app.MeanDegreeLabel = uilabel(app.EVParams);
            app.MeanDegreeLabel.HorizontalAlignment = 'right';
            app.MeanDegreeLabel.FontName = 'Arial';
            app.MeanDegreeLabel.FontSize = 14;
            app.MeanDegreeLabel.Position = [246 132 90 22];
            app.MeanDegreeLabel.Text = 'Mean Degree';

            % Create MeanEM
            app.MeanEM = uieditfield(app.EVParams, 'numeric');
            app.MeanEM.Limits = [0 Inf];
            app.MeanEM.RoundFractionalValues = 'on';
            app.MeanEM.ValueDisplayFormat = '%.0f';
            app.MeanEM.FontName = 'Arial';
            app.MeanEM.FontSize = 14;
            app.MeanEM.Position = [338 132 89 22];

            % Create MedianDegreeLabel
            app.MedianDegreeLabel = uilabel(app.EVParams);
            app.MedianDegreeLabel.HorizontalAlignment = 'right';
            app.MedianDegreeLabel.FontName = 'Arial';
            app.MedianDegreeLabel.FontSize = 14;
            app.MedianDegreeLabel.Position = [234 94 101 22];
            app.MedianDegreeLabel.Text = 'Median Degree';

            % Create MedianEM
            app.MedianEM = uieditfield(app.EVParams, 'numeric');
            app.MedianEM.Limits = [0 Inf];
            app.MedianEM.RoundFractionalValues = 'on';
            app.MedianEM.ValueDisplayFormat = '%.0f';
            app.MedianEM.FontName = 'Arial';
            app.MedianEM.FontSize = 14;
            app.MedianEM.Position = [337 94 89 22];

            % Create RMSDegreeLabel
            app.RMSDegreeLabel = uilabel(app.EVParams);
            app.RMSDegreeLabel.HorizontalAlignment = 'right';
            app.RMSDegreeLabel.FontName = 'Arial';
            app.RMSDegreeLabel.FontSize = 14;
            app.RMSDegreeLabel.Position = [249 54 86 22];
            app.RMSDegreeLabel.Text = 'RMS Degree';

            % Create RMSEM
            app.RMSEM = uieditfield(app.EVParams, 'numeric');
            app.RMSEM.Limits = [0 Inf];
            app.RMSEM.ValueDisplayFormat = '%.0f';
            app.RMSEM.FontName = 'Arial';
            app.RMSEM.FontSize = 14;
            app.RMSEM.Position = [337 54 89 22];

            % Create EdgesLabel
            app.EdgesLabel = uilabel(app.EVParams);
            app.EdgesLabel.HorizontalAlignment = 'right';
            app.EdgesLabel.FontName = 'Arial';
            app.EdgesLabel.FontSize = 14;
            app.EdgesLabel.Position = [291 15 45 22];
            app.EdgesLabel.Text = 'Edges';

            % Create EdgesEM
            app.EdgesEM = uieditfield(app.EVParams, 'numeric');
            app.EdgesEM.Limits = [0 Inf];
            app.EdgesEM.RoundFractionalValues = 'on';
            app.EdgesEM.ValueDisplayFormat = '%.0f';
            app.EdgesEM.FontName = 'Arial';
            app.EdgesEM.FontSize = 14;
            app.EdgesEM.Position = [338 15 89 22];

            % Create PredictionPerformancePanel_Decoding
            app.PredictionPerformancePanel_Decoding = uipanel(app.EVModel);
            app.PredictionPerformancePanel_Decoding.FontSize = 16;
            app.PredictionPerformancePanel_Decoding.Position = [471 445 454 280];

            % Create TruePositiveEditField_2Label
            app.TruePositiveEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.TruePositiveEditField_2Label.HorizontalAlignment = 'right';
            app.TruePositiveEditField_2Label.FontName = 'Arial';
            app.TruePositiveEditField_2Label.Position = [22 199 75 22];
            app.TruePositiveEditField_2Label.Text = 'True Positive';

            % Create TruePositiveEditField_Decoding
            app.TruePositiveEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.TruePositiveEditField_Decoding.Editable = 'off';
            app.TruePositiveEditField_Decoding.FontName = 'Arial';
            app.TruePositiveEditField_Decoding.Position = [112 199 100 22];

            % Create FalsePositiveEditField_2Label
            app.FalsePositiveEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.FalsePositiveEditField_2Label.HorizontalAlignment = 'right';
            app.FalsePositiveEditField_2Label.FontName = 'Arial';
            app.FalsePositiveEditField_2Label.Position = [17 165 80 22];
            app.FalsePositiveEditField_2Label.Text = 'False Positive';

            % Create FalsePositiveEditField_Decoding
            app.FalsePositiveEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.FalsePositiveEditField_Decoding.Editable = 'off';
            app.FalsePositiveEditField_Decoding.Position = [112 165 100 22];

            % Create TrueNegativeEditField_2Label
            app.TrueNegativeEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.TrueNegativeEditField_2Label.HorizontalAlignment = 'right';
            app.TrueNegativeEditField_2Label.FontName = 'Arial';
            app.TrueNegativeEditField_2Label.Position = [16 127 80 22];
            app.TrueNegativeEditField_2Label.Text = 'True Negative';

            % Create TrueNegativeEditField_Decoding
            app.TrueNegativeEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.TrueNegativeEditField_Decoding.Editable = 'off';
            app.TrueNegativeEditField_Decoding.Position = [111 127 100 22];

            % Create FalseNegativeEditField_2Label
            app.FalseNegativeEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.FalseNegativeEditField_2Label.HorizontalAlignment = 'right';
            app.FalseNegativeEditField_2Label.FontName = 'Arial';
            app.FalseNegativeEditField_2Label.Position = [10 92 86 22];
            app.FalseNegativeEditField_2Label.Text = 'False Negative';

            % Create FalseNegativeEditField_Decoding
            app.FalseNegativeEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.FalseNegativeEditField_Decoding.Editable = 'off';
            app.FalseNegativeEditField_Decoding.Position = [111 92 100 22];

            % Create ThresholdLabel
            app.ThresholdLabel = uilabel(app.PredictionPerformancePanel_Decoding);
            app.ThresholdLabel.HorizontalAlignment = 'right';
            app.ThresholdLabel.FontName = 'Arial';
            app.ThresholdLabel.Position = [262 199 59 22];
            app.ThresholdLabel.Text = 'Threshold';

            % Create Threshold_Edit_Field_Decoding
            app.Threshold_Edit_Field_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.Threshold_Edit_Field_Decoding.Editable = 'off';
            app.Threshold_Edit_Field_Decoding.Position = [336 199 100 22];

            % Create SpecificityEditField_2Label
            app.SpecificityEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.SpecificityEditField_2Label.HorizontalAlignment = 'right';
            app.SpecificityEditField_2Label.FontName = 'Arial';
            app.SpecificityEditField_2Label.Position = [261 165 60 22];
            app.SpecificityEditField_2Label.Text = 'Specificity';

            % Create SpecificityEditField_Decoding
            app.SpecificityEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.SpecificityEditField_Decoding.Editable = 'off';
            app.SpecificityEditField_Decoding.Position = [336 165 100 22];

            % Create SensitivityEditField_2Label
            app.SensitivityEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.SensitivityEditField_2Label.HorizontalAlignment = 'right';
            app.SensitivityEditField_2Label.FontName = 'Arial';
            app.SensitivityEditField_2Label.Position = [260 127 60 22];
            app.SensitivityEditField_2Label.Text = 'Sensitivity';

            % Create SensitivityEditField_Decoding
            app.SensitivityEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.SensitivityEditField_Decoding.Editable = 'off';
            app.SensitivityEditField_Decoding.Position = [335 127 100 22];

            % Create AccuracyEditField_2Label
            app.AccuracyEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.AccuracyEditField_2Label.HorizontalAlignment = 'right';
            app.AccuracyEditField_2Label.FontName = 'Arial';
            app.AccuracyEditField_2Label.Position = [265 92 55 22];
            app.AccuracyEditField_2Label.Text = 'Accuracy';

            % Create AccuracyEditField_Decoding
            app.AccuracyEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.AccuracyEditField_Decoding.Editable = 'off';
            app.AccuracyEditField_Decoding.Position = [335 92 100 22];

            % Create PrecLabel_Decoding
            app.PrecLabel_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.PrecLabel_Decoding.HorizontalAlignment = 'right';
            app.PrecLabel_Decoding.FontName = 'Arial';
            app.PrecLabel_Decoding.Position = [265 55 55 22];
            app.PrecLabel_Decoding.Text = 'Precision';

            % Create PrecEditField_Decoding
            app.PrecEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.PrecEditField_Decoding.Editable = 'off';
            app.PrecEditField_Decoding.Position = [335 55 100 22];

            % Create AUC_ROC_LABEL_Decoding
            app.AUC_ROC_LABEL_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.AUC_ROC_LABEL_Decoding.HorizontalAlignment = 'right';
            app.AUC_ROC_LABEL_Decoding.FontName = 'Arial';
            app.AUC_ROC_LABEL_Decoding.Position = [27 54 69 22];
            app.AUC_ROC_LABEL_Decoding.Text = 'AUC (ROC)';

            % Create AUC_ROC_EditField_Decoding
            app.AUC_ROC_EditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.AUC_ROC_EditField_Decoding.Editable = 'off';
            app.AUC_ROC_EditField_Decoding.Position = [111 54 100 22];

            % Create AUCPR_Label_Decoding
            app.AUCPR_Label_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.AUCPR_Label_Decoding.HorizontalAlignment = 'right';
            app.AUCPR_Label_Decoding.FontName = 'Arial';
            app.AUCPR_Label_Decoding.Position = [37 17 59 22];
            app.AUCPR_Label_Decoding.Text = 'AUC (PR)';

            % Create AUCPR_EditLabel_Decoding
            app.AUCPR_EditLabel_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.AUCPR_EditLabel_Decoding.Editable = 'off';
            app.AUCPR_EditLabel_Decoding.Position = [111 17 100 22];

            % Create BalAccLabel_Decoding
            app.BalAccLabel_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.BalAccLabel_Decoding.HorizontalAlignment = 'right';
            app.BalAccLabel_Decoding.FontName = 'Arial';
            app.BalAccLabel_Decoding.Position = [212 16 108 22];
            app.BalAccLabel_Decoding.Text = 'Balanced Accuracy';

            % Create BalAcc_EditField_Decoding
            app.BalAcc_EditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.BalAcc_EditField_Decoding.Editable = 'off';
            app.BalAcc_EditField_Decoding.Position = [335 16 100 22];

            % Create DecodingPerformanceLabel
            app.DecodingPerformanceLabel = uilabel(app.PredictionPerformancePanel_Decoding);
            app.DecodingPerformanceLabel.FontName = 'Arial';
            app.DecodingPerformanceLabel.FontSize = 16;
            app.DecodingPerformanceLabel.FontWeight = 'bold';
            app.DecodingPerformanceLabel.Position = [11 247 181 22];
            app.DecodingPerformanceLabel.Text = 'Decoding Performance';

            % Create UDFLabel_3
            app.UDFLabel_3 = uilabel(app.PredictionPerformancePanel_Decoding);
            app.UDFLabel_3.HorizontalAlignment = 'right';
            app.UDFLabel_3.FontName = 'Arial';
            app.UDFLabel_3.FontSize = 16;
            app.UDFLabel_3.FontWeight = 'bold';
            app.UDFLabel_3.Position = [302 247 38 22];
            app.UDFLabel_3.Text = 'UDF';

            % Create StimulusEM
            app.StimulusEM = uieditfield(app.PredictionPerformancePanel_Decoding, 'numeric');
            app.StimulusEM.Limits = [1 Inf];
            app.StimulusEM.RoundFractionalValues = 'on';
            app.StimulusEM.ValueDisplayFormat = '%.0f';
            app.StimulusEM.ValueChangedFcn = createCallbackFcn(app, @StimulusEMValueChanged, true);
            app.StimulusEM.FontName = 'Arial';
            app.StimulusEM.FontSize = 16;
            app.StimulusEM.FontWeight = 'bold';
            app.StimulusEM.Position = [342 247 89 22];
            app.StimulusEM.Value = 1;

            % Create DecodingButtonGroup
            app.DecodingButtonGroup = uibuttongroup(app.EVModel);
            app.DecodingButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @DecodingButtonGroupSelectionChanged, true);
            app.DecodingButtonGroup.Position = [471 415 454 30];

            % Create ROC_Decoding
            app.ROC_Decoding = uitogglebutton(app.DecodingButtonGroup);
            app.ROC_Decoding.Text = 'ROC';
            app.ROC_Decoding.FontName = 'Arial';
            app.ROC_Decoding.FontSize = 14;
            app.ROC_Decoding.Position = [249 2 100 24];
            app.ROC_Decoding.Value = true;

            % Create PR_Decoding
            app.PR_Decoding = uitogglebutton(app.DecodingButtonGroup);
            app.PR_Decoding.Text = 'PR';
            app.PR_Decoding.FontName = 'Arial';
            app.PR_Decoding.FontSize = 14;
            app.PR_Decoding.Position = [349 2 100 24];

            % Create Plot_Decoding_Label
            app.Plot_Decoding_Label = uilabel(app.DecodingButtonGroup);
            app.Plot_Decoding_Label.HorizontalAlignment = 'center';
            app.Plot_Decoding_Label.FontName = 'Arial';
            app.Plot_Decoding_Label.FontSize = 14;
            app.Plot_Decoding_Label.Position = [4 3 154 22];
            app.Plot_Decoding_Label.Text = 'Plot Option';

            % Create ViewDecodingPerfPanel
            app.ViewDecodingPerfPanel = uipanel(app.EVModel);
            app.ViewDecodingPerfPanel.Position = [22 15 439 290];

            % Create ViewPerfButtonGroup
            app.ViewPerfButtonGroup = uibuttongroup(app.ViewDecodingPerfPanel);
            app.ViewPerfButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ViewPerfButtonGroupSelectionChanged, true);
            app.ViewPerfButtonGroup.Position = [0 257 439 33];

            % Create ViewTrainPerf
            app.ViewTrainPerf = uitogglebutton(app.ViewPerfButtonGroup);
            app.ViewTrainPerf.Text = 'TRAIN';
            app.ViewTrainPerf.FontName = 'Arial';
            app.ViewTrainPerf.FontSize = 14;
            app.ViewTrainPerf.Position = [233 4 100 24];

            % Create ViewTestPerf
            app.ViewTestPerf = uitogglebutton(app.ViewPerfButtonGroup);
            app.ViewTestPerf.Text = 'TEST';
            app.ViewTestPerf.FontName = 'Arial';
            app.ViewTestPerf.FontSize = 14;
            app.ViewTestPerf.Position = [334 4 100 24];

            % Create ViewFullPerf
            app.ViewFullPerf = uitogglebutton(app.ViewPerfButtonGroup);
            app.ViewFullPerf.Text = 'FULL';
            app.ViewFullPerf.FontName = 'Arial';
            app.ViewFullPerf.FontSize = 14;
            app.ViewFullPerf.Position = [132 4 100 24];
            app.ViewFullPerf.Value = true;

            % Create ViewPerfLabel
            app.ViewPerfLabel = uilabel(app.ViewPerfButtonGroup);
            app.ViewPerfLabel.HorizontalAlignment = 'center';
            app.ViewPerfLabel.FontName = 'Arial';
            app.ViewPerfLabel.FontSize = 14;
            app.ViewPerfLabel.Position = [3 5 126 22];
            app.ViewPerfLabel.Text = 'Dataset Segment';

            % Create IDEns
            app.IDEns = uitab(app.TabGroup);
            app.IDEns.Title = 'Identify Ensembles';

            % Create IDParams
            app.IDParams = uipanel(app.IDEns);
            app.IDParams.AutoResizeChildren = 'off';
            app.IDParams.Position = [21 509 920 216];

            % Create IdentificationofNeuronalEnsemblesParametersLabel
            app.IdentificationofNeuronalEnsemblesParametersLabel = uilabel(app.IDParams);
            app.IdentificationofNeuronalEnsemblesParametersLabel.FontName = 'Arial';
            app.IdentificationofNeuronalEnsemblesParametersLabel.FontSize = 16;
            app.IdentificationofNeuronalEnsemblesParametersLabel.FontWeight = 'bold';
            app.IdentificationofNeuronalEnsemblesParametersLabel.Position = [11 183 385 22];
            app.IdentificationofNeuronalEnsemblesParametersLabel.Text = 'Identification of Neuronal Ensembles Parameters';

            % Create TuningCriterionDropDown_2Label
            app.TuningCriterionDropDown_2Label = uilabel(app.IDParams);
            app.TuningCriterionDropDown_2Label.HorizontalAlignment = 'right';
            app.TuningCriterionDropDown_2Label.FontName = 'Arial';
            app.TuningCriterionDropDown_2Label.Position = [91 148 90 22];
            app.TuningCriterionDropDown_2Label.Text = 'Tuning Criterion';

            % Create TuningCriterionDropDown_ID
            app.TuningCriterionDropDown_ID = uidropdown(app.IDParams);
            app.TuningCriterionDropDown_ID.Items = {'AUC', 'PR'};
            app.TuningCriterionDropDown_ID.Editable = 'on';
            app.TuningCriterionDropDown_ID.ValueChangedFcn = createCallbackFcn(app, @TuningCriterionDropDown_IDValueChanged, true);
            app.TuningCriterionDropDown_ID.FontName = 'Arial';
            app.TuningCriterionDropDown_ID.BackgroundColor = [1 1 1];
            app.TuningCriterionDropDown_ID.Position = [192 148 100 20];
            app.TuningCriterionDropDown_ID.Value = 'AUC';

            % Create EnsembleSizeDropDown_2Label
            app.EnsembleSizeDropDown_2Label = uilabel(app.IDParams);
            app.EnsembleSizeDropDown_2Label.HorizontalAlignment = 'right';
            app.EnsembleSizeDropDown_2Label.FontName = 'Arial';
            app.EnsembleSizeDropDown_2Label.Position = [101 106 86 22];
            app.EnsembleSizeDropDown_2Label.Text = 'Ensemble Size';

            % Create EnsembleSizeDropDown_ID
            app.EnsembleSizeDropDown_ID = uidropdown(app.IDParams);
            app.EnsembleSizeDropDown_ID.Items = {'coact', 'max_degree', 'coactUDF'};
            app.EnsembleSizeDropDown_ID.Editable = 'on';
            app.EnsembleSizeDropDown_ID.ValueChangedFcn = createCallbackFcn(app, @EnsembleSizeDropDown_IDValueChanged, true);
            app.EnsembleSizeDropDown_ID.FontName = 'Arial';
            app.EnsembleSizeDropDown_ID.BackgroundColor = [1 1 1];
            app.EnsembleSizeDropDown_ID.Position = [192 106 100 22];
            app.EnsembleSizeDropDown_ID.Value = 'coact';

            % Create IncludeUDFinEnsemblesEditField_2Label
            app.IncludeUDFinEnsemblesEditField_2Label = uilabel(app.IDParams);
            app.IncludeUDFinEnsemblesEditField_2Label.HorizontalAlignment = 'right';
            app.IncludeUDFinEnsemblesEditField_2Label.FontName = 'Arial';
            app.IncludeUDFinEnsemblesEditField_2Label.Position = [41 63 151 22];
            app.IncludeUDFinEnsemblesEditField_2Label.Text = 'Include UDF in Ensembles ';

            % Create IncludeUDFinEnsemblesEditField_ID
            app.IncludeUDFinEnsemblesEditField_ID = uieditfield(app.IDParams, 'numeric');
            app.IncludeUDFinEnsemblesEditField_ID.Limits = [0 1];
            app.IncludeUDFinEnsemblesEditField_ID.RoundFractionalValues = 'on';
            app.IncludeUDFinEnsemblesEditField_ID.ValueDisplayFormat = '%.0f';
            app.IncludeUDFinEnsemblesEditField_ID.ValueChangedFcn = createCallbackFcn(app, @IncludeUDFinEnsemblesEditField_IDValueChanged, true);
            app.IncludeUDFinEnsemblesEditField_ID.FontName = 'Arial';
            app.IncludeUDFinEnsemblesEditField_ID.Position = [192 64 100 22];

            % Create NumberofRandomControlsLabel
            app.NumberofRandomControlsLabel = uilabel(app.IDParams);
            app.NumberofRandomControlsLabel.HorizontalAlignment = 'right';
            app.NumberofRandomControlsLabel.FontName = 'Arial';
            app.NumberofRandomControlsLabel.Position = [28 22 158 22];
            app.NumberofRandomControlsLabel.Text = 'Number of Random Controls';

            % Create NumberofRandomControlsEditField_ID
            app.NumberofRandomControlsEditField_ID = uieditfield(app.IDParams, 'numeric');
            app.NumberofRandomControlsEditField_ID.Limits = [0 Inf];
            app.NumberofRandomControlsEditField_ID.RoundFractionalValues = 'on';
            app.NumberofRandomControlsEditField_ID.ValueDisplayFormat = '%.0f';
            app.NumberofRandomControlsEditField_ID.ValueChangedFcn = createCallbackFcn(app, @NumberofRandomControlsEditField_IDValueChanged, true);
            app.NumberofRandomControlsEditField_ID.FontName = 'Arial';
            app.NumberofRandomControlsEditField_ID.Position = [192 22 100 22];
            app.NumberofRandomControlsEditField_ID.Value = 100;

            % Create EvaluateNeuronalContributionsButton
            app.EvaluateNeuronalContributionsButton = uibutton(app.IDParams, 'push');
            app.EvaluateNeuronalContributionsButton.ButtonPushedFcn = createCallbackFcn(app, @EvaluateNeuronalContributionsButtonPushed, true);
            app.EvaluateNeuronalContributionsButton.FontName = 'Arial';
            app.EvaluateNeuronalContributionsButton.Position = [311 135 190 40];
            app.EvaluateNeuronalContributionsButton.Text = 'Evaluate Neuronal Contributions';

            % Create EvaluateNodePerformanceButton
            app.EvaluateNodePerformanceButton = uibutton(app.IDParams, 'push');
            app.EvaluateNodePerformanceButton.ButtonPushedFcn = createCallbackFcn(app, @EvaluateNodePerformanceButtonPushed, true);
            app.EvaluateNodePerformanceButton.FontName = 'Arial';
            app.EvaluateNodePerformanceButton.Position = [311 75 190 40];
            app.EvaluateNodePerformanceButton.Text = 'Evaluate Node Performance';

            % Create ComparetoRandomEnsemblesButton
            app.ComparetoRandomEnsemblesButton = uibutton(app.IDParams, 'push');
            app.ComparetoRandomEnsemblesButton.ButtonPushedFcn = createCallbackFcn(app, @ComparetoRandomEnsemblesButtonPushed, true);
            app.ComparetoRandomEnsemblesButton.FontName = 'Arial';
            app.ComparetoRandomEnsemblesButton.Position = [311 15 190 40];
            app.ComparetoRandomEnsemblesButton.Text = 'Compare to Random Ensembles';

            % Create IdentifyNeuronalEnsemblesRunAllButton
            app.IdentifyNeuronalEnsemblesRunAllButton = uibutton(app.IDParams, 'push');
            app.IdentifyNeuronalEnsemblesRunAllButton.ButtonPushedFcn = createCallbackFcn(app, @IdentifyNeuronalEnsemblesRunAllButtonPushed, true);
            app.IdentifyNeuronalEnsemblesRunAllButton.FontName = 'Arial';
            app.IdentifyNeuronalEnsemblesRunAllButton.Position = [521 15 220 40];
            app.IdentifyNeuronalEnsemblesRunAllButton.Text = 'Identify Neuronal Ensembles (Run All)';

            % Create ManuallyThresholdEnsemblesButton
            app.ManuallyThresholdEnsemblesButton = uibutton(app.IDParams, 'push');
            app.ManuallyThresholdEnsemblesButton.ButtonPushedFcn = createCallbackFcn(app, @ManuallyThresholdEnsemblesButtonPushed, true);
            app.ManuallyThresholdEnsemblesButton.FontName = 'Arial';
            app.ManuallyThresholdEnsemblesButton.Position = [521 75 220 40];
            app.ManuallyThresholdEnsemblesButton.Text = 'Manually Threshold Ensembles';

            % Create RecomparetoRandomEnsemblesButton
            app.RecomparetoRandomEnsemblesButton = uibutton(app.IDParams, 'push');
            app.RecomparetoRandomEnsemblesButton.ButtonPushedFcn = createCallbackFcn(app, @RecomparetoRandomEnsemblesButtonPushed, true);
            app.RecomparetoRandomEnsemblesButton.FontName = 'Arial';
            app.RecomparetoRandomEnsemblesButton.Position = [521 135 220 40];
            app.RecomparetoRandomEnsemblesButton.Text = 'Recompare to Random Ensembles';

            % Create DeviationsEditField
            app.DeviationsEditField = uieditfield(app.IDParams, 'numeric');
            app.DeviationsEditField.Limits = [1 Inf];
            app.DeviationsEditField.RoundFractionalValues = 'on';
            app.DeviationsEditField.ValueDisplayFormat = '%.0f';
            app.DeviationsEditField.HorizontalAlignment = 'center';
            app.DeviationsEditField.FontName = 'Arial';
            app.DeviationsEditField.FontSize = 14;
            app.DeviationsEditField.Position = [851 72 44 22];
            app.DeviationsEditField.Value = 3;

            % Create UDFEditFieldLabel
            app.UDFEditFieldLabel = uilabel(app.IDParams);
            app.UDFEditFieldLabel.HorizontalAlignment = 'right';
            app.UDFEditFieldLabel.FontName = 'Arial';
            app.UDFEditFieldLabel.FontSize = 16;
            app.UDFEditFieldLabel.FontWeight = 'bold';
            app.UDFEditFieldLabel.Position = [806 25 38 22];
            app.UDFEditFieldLabel.Text = 'UDF';

            % Create StimulusEditField
            app.StimulusEditField = uieditfield(app.IDParams, 'numeric');
            app.StimulusEditField.Limits = [0 Inf];
            app.StimulusEditField.RoundFractionalValues = 'on';
            app.StimulusEditField.ValueDisplayFormat = '%.0f';
            app.StimulusEditField.ValueChangedFcn = createCallbackFcn(app, @StimulusEditFieldValueChanged, true);
            app.StimulusEditField.HorizontalAlignment = 'center';
            app.StimulusEditField.FontName = 'Arial';
            app.StimulusEditField.FontSize = 16;
            app.StimulusEditField.Position = [851 15 44 40];
            app.StimulusEditField.Value = 1;

            % Create ThresholdEditFieldLabel
            app.ThresholdEditFieldLabel = uilabel(app.IDParams);
            app.ThresholdEditFieldLabel.HorizontalAlignment = 'right';
            app.ThresholdEditFieldLabel.FontName = 'Arial';
            app.ThresholdEditFieldLabel.FontSize = 14;
            app.ThresholdEditFieldLabel.Position = [776 110 68 22];
            app.ThresholdEditFieldLabel.Text = 'Threshold';

            % Create ThresholdEditField
            app.ThresholdEditField = uieditfield(app.IDParams, 'numeric');
            app.ThresholdEditField.HorizontalAlignment = 'center';
            app.ThresholdEditField.FontName = 'Arial';
            app.ThresholdEditField.FontSize = 14;
            app.ThresholdEditField.Position = [851 109 44 22];

            % Create DeviationsLabel
            app.DeviationsLabel = uilabel(app.IDParams);
            app.DeviationsLabel.HorizontalAlignment = 'center';
            app.DeviationsLabel.FontName = 'Arial';
            app.DeviationsLabel.FontSize = 14;
            app.DeviationsLabel.Position = [775 72 71 22];
            app.DeviationsLabel.Text = 'Deviations';

            % Create IncTestSetLabel
            app.IncTestSetLabel = uilabel(app.IDParams);
            app.IncTestSetLabel.HorizontalAlignment = 'right';
            app.IncTestSetLabel.FontName = 'Arial';
            app.IncTestSetLabel.FontSize = 14;
            app.IncTestSetLabel.Position = [760 146 83 22];
            app.IncTestSetLabel.Text = 'Inc. Test Set';

            % Create RestrictToTrainingEditField
            app.RestrictToTrainingEditField = uieditfield(app.IDParams, 'numeric');
            app.RestrictToTrainingEditField.Limits = [0 1];
            app.RestrictToTrainingEditField.RoundFractionalValues = 'on';
            app.RestrictToTrainingEditField.ValueDisplayFormat = '%.0f';
            app.RestrictToTrainingEditField.HorizontalAlignment = 'center';
            app.RestrictToTrainingEditField.FontName = 'Arial';
            app.RestrictToTrainingEditField.FontSize = 14;
            app.RestrictToTrainingEditField.Position = [851 146 44 22];

            % Create EnsIdStats_IDENS
            app.EnsIdStats_IDENS = uipanel(app.IDEns);
            app.EnsIdStats_IDENS.Position = [21 15 450 480];

            % Create EnsembleNeuronsTextAreaLabel
            app.EnsembleNeuronsTextAreaLabel = uilabel(app.EnsIdStats_IDENS);
            app.EnsembleNeuronsTextAreaLabel.HorizontalAlignment = 'center';
            app.EnsembleNeuronsTextAreaLabel.FontName = 'Arial';
            app.EnsembleNeuronsTextAreaLabel.FontSize = 16;
            app.EnsembleNeuronsTextAreaLabel.Position = [21 437 386 22];
            app.EnsembleNeuronsTextAreaLabel.Text = 'Ensemble Neurons';

            % Create EnsembleNeuronsTextArea
            app.EnsembleNeuronsTextArea = uitextarea(app.EnsIdStats_IDENS);
            app.EnsembleNeuronsTextArea.HorizontalAlignment = 'center';
            app.EnsembleNeuronsTextArea.FontName = 'Arial';
            app.EnsembleNeuronsTextArea.FontSize = 16;
            app.EnsembleNeuronsTextArea.Position = [20 374 389 60];

            % Create UniqueNeuronsTextArea
            app.UniqueNeuronsTextArea = uitextarea(app.EnsIdStats_IDENS);
            app.UniqueNeuronsTextArea.FontName = 'Arial';
            app.UniqueNeuronsTextArea.FontSize = 16;
            app.UniqueNeuronsTextArea.Position = [21 257 386 60];

            % Create UniqueNeuronsTextAreaLabel
            app.UniqueNeuronsTextAreaLabel = uilabel(app.EnsIdStats_IDENS);
            app.UniqueNeuronsTextAreaLabel.HorizontalAlignment = 'center';
            app.UniqueNeuronsTextAreaLabel.FontName = 'Arial';
            app.UniqueNeuronsTextAreaLabel.FontSize = 16;
            app.UniqueNeuronsTextAreaLabel.Position = [25 323 386 22];
            app.UniqueNeuronsTextAreaLabel.Text = 'Unique Neurons';

            % Create PromNeuronsTextArea
            app.PromNeuronsTextArea = uitextarea(app.EnsIdStats_IDENS);
            app.PromNeuronsTextArea.FontName = 'Arial';
            app.PromNeuronsTextArea.FontSize = 16;
            app.PromNeuronsTextArea.Position = [21 141 389 60];

            % Create PromNeuronsLabel
            app.PromNeuronsLabel = uilabel(app.EnsIdStats_IDENS);
            app.PromNeuronsLabel.HorizontalAlignment = 'center';
            app.PromNeuronsLabel.FontName = 'Arial';
            app.PromNeuronsLabel.FontSize = 16;
            app.PromNeuronsLabel.Position = [21 202 388 22];
            app.PromNeuronsLabel.Text = 'Promiscuous Neurons';

            % Create PercentUniqueLabel
            app.PercentUniqueLabel = uilabel(app.EnsIdStats_IDENS);
            app.PercentUniqueLabel.HorizontalAlignment = 'center';
            app.PercentUniqueLabel.FontName = 'Arial';
            app.PercentUniqueLabel.FontSize = 16;
            app.PercentUniqueLabel.Position = [21 84 200 22];
            app.PercentUniqueLabel.Text = 'Percent Unique';

            % Create PercentUniqueVal
            app.PercentUniqueVal = uilabel(app.EnsIdStats_IDENS);
            app.PercentUniqueVal.HorizontalAlignment = 'center';
            app.PercentUniqueVal.FontName = 'Arial';
            app.PercentUniqueVal.FontSize = 16;
            app.PercentUniqueVal.Position = [21 25 200 60];
            app.PercentUniqueVal.Text = '0%';

            % Create CodingDensityLabel
            app.CodingDensityLabel = uilabel(app.EnsIdStats_IDENS);
            app.CodingDensityLabel.HorizontalAlignment = 'center';
            app.CodingDensityLabel.FontName = 'Arial';
            app.CodingDensityLabel.FontSize = 16;
            app.CodingDensityLabel.Position = [211 84 200 22];
            app.CodingDensityLabel.Text = 'Coding Density';

            % Create CodingDensityVal
            app.CodingDensityVal = uilabel(app.EnsIdStats_IDENS);
            app.CodingDensityVal.HorizontalAlignment = 'center';
            app.CodingDensityVal.FontName = 'Arial';
            app.CodingDensityVal.FontSize = 16;
            app.CodingDensityVal.Position = [211 25 200 60];
            app.CodingDensityVal.Text = '0%';

            % Create EnsID_IDENS
            app.EnsID_IDENS = uipanel(app.IDEns);
            app.EnsID_IDENS.AutoResizeChildren = 'off';
            app.EnsID_IDENS.Position = [961 15 900 710];

            % Create NodePerformance_IDENS
            app.NodePerformance_IDENS = uipanel(app.IDEns);
            app.NodePerformance_IDENS.Position = [491 15 450 480];

            % Create BandwidthEditField_2Label
            app.BandwidthEditField_2Label = uilabel(app.NodePerformance_IDENS);
            app.BandwidthEditField_2Label.HorizontalAlignment = 'right';
            app.BandwidthEditField_2Label.Position = [10 8 62 22];
            app.BandwidthEditField_2Label.Text = 'Bandwidth';

            % Create BandwidthEditField_ID
            app.BandwidthEditField_ID = uieditfield(app.NodePerformance_IDENS, 'numeric');
            app.BandwidthEditField_ID.ValueChangedFcn = createCallbackFcn(app, @BandwidthEditField_IDValueChanged, true);
            app.BandwidthEditField_ID.HorizontalAlignment = 'center';
            app.BandwidthEditField_ID.Position = [87 8 41 22];
            app.BandwidthEditField_ID.Value = 0.05;

            % Create EVEns
            app.EVEns = uitab(app.TabGroup);
            app.EVEns.Title = 'Evaluate Ensembles';

            % Create EnsembleEvalParams
            app.EnsembleEvalParams = uipanel(app.EVEns);
            app.EnsembleEvalParams.AutoResizeChildren = 'off';
            app.EnsembleEvalParams.Position = [21 345 478 380];

            % Create NeuronalEnsembleEvaluationLabel_EV
            app.NeuronalEnsembleEvaluationLabel_EV = uilabel(app.EnsembleEvalParams);
            app.NeuronalEnsembleEvaluationLabel_EV.FontName = 'Arial';
            app.NeuronalEnsembleEvaluationLabel_EV.FontSize = 16;
            app.NeuronalEnsembleEvaluationLabel_EV.FontWeight = 'bold';
            app.NeuronalEnsembleEvaluationLabel_EV.Position = [11 347 242 22];
            app.NeuronalEnsembleEvaluationLabel_EV.Text = 'Neuronal Ensemble Evaluation';

            % Create EvaluateButton_EV
            app.EvaluateButton_EV = uibutton(app.EnsembleEvalParams, 'push');
            app.EvaluateButton_EV.ButtonPushedFcn = createCallbackFcn(app, @EvaluateButton_EVPushed, true);
            app.EvaluateButton_EV.FontName = 'Arial';
            app.EvaluateButton_EV.Position = [11 308 120 30];
            app.EvaluateButton_EV.Text = 'Evaluate ';

            % Create ReservedField_EV_4
            app.ReservedField_EV_4 = uilabel(app.EnsembleEvalParams);
            app.ReservedField_EV_4.HorizontalAlignment = 'right';
            app.ReservedField_EV_4.FontName = 'Arial';
            app.ReservedField_EV_4.Enable = 'off';
            app.ReservedField_EV_4.Visible = 'off';
            app.ReservedField_EV_4.Position = [287 87 27 22];
            app.ReservedField_EV_4.Text = 'Res';

            % Create ReservedEditField_EV_4
            app.ReservedEditField_EV_4 = uieditfield(app.EnsembleEvalParams, 'numeric');
            app.ReservedEditField_EV_4.Limits = [0 1];
            app.ReservedEditField_EV_4.ValueDisplayFormat = '%.0f';
            app.ReservedEditField_EV_4.FontName = 'Arial';
            app.ReservedEditField_EV_4.Enable = 'off';
            app.ReservedEditField_EV_4.Visible = 'off';
            app.ReservedEditField_EV_4.Position = [321 87 100 22];

            % Create PredictionPerformancePanel_Decoding_2
            app.PredictionPerformancePanel_Decoding_2 = uipanel(app.EnsembleEvalParams);
            app.PredictionPerformancePanel_Decoding_2.FontSize = 16;
            app.PredictionPerformancePanel_Decoding_2.Position = [11 15 454 280];

            % Create TruePositiveEditField_2Label_2
            app.TruePositiveEditField_2Label_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.TruePositiveEditField_2Label_2.HorizontalAlignment = 'right';
            app.TruePositiveEditField_2Label_2.FontName = 'Arial';
            app.TruePositiveEditField_2Label_2.Position = [22 199 75 22];
            app.TruePositiveEditField_2Label_2.Text = 'True Positive';

            % Create TruePositiveEditField_Eval
            app.TruePositiveEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.TruePositiveEditField_Eval.Editable = 'off';
            app.TruePositiveEditField_Eval.FontName = 'Arial';
            app.TruePositiveEditField_Eval.Position = [112 199 100 22];

            % Create FalsePositiveEditField_2Label_2
            app.FalsePositiveEditField_2Label_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.FalsePositiveEditField_2Label_2.HorizontalAlignment = 'right';
            app.FalsePositiveEditField_2Label_2.FontName = 'Arial';
            app.FalsePositiveEditField_2Label_2.Position = [17 165 80 22];
            app.FalsePositiveEditField_2Label_2.Text = 'False Positive';

            % Create FalsePositiveEditField_Eval
            app.FalsePositiveEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.FalsePositiveEditField_Eval.Editable = 'off';
            app.FalsePositiveEditField_Eval.Position = [112 165 100 22];

            % Create TrueNegativeEditField_2Label_2
            app.TrueNegativeEditField_2Label_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.TrueNegativeEditField_2Label_2.HorizontalAlignment = 'right';
            app.TrueNegativeEditField_2Label_2.FontName = 'Arial';
            app.TrueNegativeEditField_2Label_2.Position = [16 127 80 22];
            app.TrueNegativeEditField_2Label_2.Text = 'True Negative';

            % Create TrueNegativeEditField_Eval
            app.TrueNegativeEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.TrueNegativeEditField_Eval.Editable = 'off';
            app.TrueNegativeEditField_Eval.Position = [111 127 100 22];

            % Create FalseNegativeEditField_2Label_2
            app.FalseNegativeEditField_2Label_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.FalseNegativeEditField_2Label_2.HorizontalAlignment = 'right';
            app.FalseNegativeEditField_2Label_2.FontName = 'Arial';
            app.FalseNegativeEditField_2Label_2.Position = [10 92 86 22];
            app.FalseNegativeEditField_2Label_2.Text = 'False Negative';

            % Create FalseNegativeEditField_Eval
            app.FalseNegativeEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.FalseNegativeEditField_Eval.Editable = 'off';
            app.FalseNegativeEditField_Eval.Position = [111 92 100 22];

            % Create ThresholdLabel_2
            app.ThresholdLabel_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.ThresholdLabel_2.HorizontalAlignment = 'right';
            app.ThresholdLabel_2.FontName = 'Arial';
            app.ThresholdLabel_2.Position = [262 199 59 22];
            app.ThresholdLabel_2.Text = 'Threshold';

            % Create Threshold_Edit_Field_Eval
            app.Threshold_Edit_Field_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.Threshold_Edit_Field_Eval.Editable = 'off';
            app.Threshold_Edit_Field_Eval.Position = [336 199 100 22];

            % Create SpecificityEditField_2Label_2
            app.SpecificityEditField_2Label_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.SpecificityEditField_2Label_2.HorizontalAlignment = 'right';
            app.SpecificityEditField_2Label_2.FontName = 'Arial';
            app.SpecificityEditField_2Label_2.Position = [261 165 60 22];
            app.SpecificityEditField_2Label_2.Text = 'Specificity';

            % Create SpecificityEditField_Eval
            app.SpecificityEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.SpecificityEditField_Eval.Editable = 'off';
            app.SpecificityEditField_Eval.Position = [336 165 100 22];

            % Create SensitivityEditField_2Label_2
            app.SensitivityEditField_2Label_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.SensitivityEditField_2Label_2.HorizontalAlignment = 'right';
            app.SensitivityEditField_2Label_2.FontName = 'Arial';
            app.SensitivityEditField_2Label_2.Position = [260 127 60 22];
            app.SensitivityEditField_2Label_2.Text = 'Sensitivity';

            % Create SensitivityEditField_Eval
            app.SensitivityEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.SensitivityEditField_Eval.Editable = 'off';
            app.SensitivityEditField_Eval.Position = [335 127 100 22];

            % Create AccuracyEditField_2Label_2
            app.AccuracyEditField_2Label_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.AccuracyEditField_2Label_2.HorizontalAlignment = 'right';
            app.AccuracyEditField_2Label_2.FontName = 'Arial';
            app.AccuracyEditField_2Label_2.Position = [265 92 55 22];
            app.AccuracyEditField_2Label_2.Text = 'Accuracy';

            % Create AccuracyEditField_Eval
            app.AccuracyEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.AccuracyEditField_Eval.Editable = 'off';
            app.AccuracyEditField_Eval.Position = [335 92 100 22];

            % Create PrecLabel_Eval
            app.PrecLabel_Eval = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.PrecLabel_Eval.HorizontalAlignment = 'right';
            app.PrecLabel_Eval.FontName = 'Arial';
            app.PrecLabel_Eval.Position = [265 55 55 22];
            app.PrecLabel_Eval.Text = 'Precision';

            % Create PrecEditField_Eval
            app.PrecEditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.PrecEditField_Eval.Editable = 'off';
            app.PrecEditField_Eval.Position = [335 55 100 22];

            % Create AUC_ROC_LABEL_Eval
            app.AUC_ROC_LABEL_Eval = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.AUC_ROC_LABEL_Eval.HorizontalAlignment = 'right';
            app.AUC_ROC_LABEL_Eval.FontName = 'Arial';
            app.AUC_ROC_LABEL_Eval.Position = [27 54 69 22];
            app.AUC_ROC_LABEL_Eval.Text = 'AUC (ROC)';

            % Create AUC_ROC_EditField_Eval
            app.AUC_ROC_EditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.AUC_ROC_EditField_Eval.Editable = 'off';
            app.AUC_ROC_EditField_Eval.Position = [111 54 100 22];

            % Create AUCPR_Label_Eval
            app.AUCPR_Label_Eval = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.AUCPR_Label_Eval.HorizontalAlignment = 'right';
            app.AUCPR_Label_Eval.FontName = 'Arial';
            app.AUCPR_Label_Eval.Position = [37 17 59 22];
            app.AUCPR_Label_Eval.Text = 'AUC (PR)';

            % Create AUCPR_EditLabel_Eval
            app.AUCPR_EditLabel_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.AUCPR_EditLabel_Eval.Editable = 'off';
            app.AUCPR_EditLabel_Eval.Position = [111 17 100 22];

            % Create MissLabel_Eval
            app.MissLabel_Eval = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.MissLabel_Eval.HorizontalAlignment = 'right';
            app.MissLabel_Eval.FontName = 'Arial';
            app.MissLabel_Eval.Position = [212 16 108 22];
            app.MissLabel_Eval.Text = 'Balanced Accuracy';

            % Create Miss_EditField_Eval
            app.Miss_EditField_Eval = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'text');
            app.Miss_EditField_Eval.Editable = 'off';
            app.Miss_EditField_Eval.Position = [335 16 100 22];

            % Create EvalPerformanceLabel
            app.EvalPerformanceLabel = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.EvalPerformanceLabel.FontName = 'Arial';
            app.EvalPerformanceLabel.FontSize = 16;
            app.EvalPerformanceLabel.FontWeight = 'bold';
            app.EvalPerformanceLabel.Position = [11 247 186 22];
            app.EvalPerformanceLabel.Text = 'Prediction Performance';

            % Create UDFLabel_2
            app.UDFLabel_2 = uilabel(app.PredictionPerformancePanel_Decoding_2);
            app.UDFLabel_2.HorizontalAlignment = 'right';
            app.UDFLabel_2.FontName = 'Arial';
            app.UDFLabel_2.FontSize = 16;
            app.UDFLabel_2.FontWeight = 'bold';
            app.UDFLabel_2.Position = [302 247 38 22];
            app.UDFLabel_2.Text = 'UDF';

            % Create StimulusEV
            app.StimulusEV = uieditfield(app.PredictionPerformancePanel_Decoding_2, 'numeric');
            app.StimulusEV.Limits = [1 Inf];
            app.StimulusEV.RoundFractionalValues = 'on';
            app.StimulusEV.ValueDisplayFormat = '%.0f';
            app.StimulusEV.ValueChangedFcn = createCallbackFcn(app, @StimulusEVValueChanged, true);
            app.StimulusEV.FontName = 'Arial';
            app.StimulusEV.FontSize = 16;
            app.StimulusEV.FontWeight = 'bold';
            app.StimulusEV.Position = [342 247 89 22];
            app.StimulusEV.Value = 1;

            % Create ViewEnsPerfButtonGroup
            app.ViewEnsPerfButtonGroup = uibuttongroup(app.EnsembleEvalParams);
            app.ViewEnsPerfButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @ViewEnsPerfButtonGroupSelectionChanged, true);
            app.ViewEnsPerfButtonGroup.Position = [140 307 326 32];

            % Create TrainEnsPerf
            app.TrainEnsPerf = uitogglebutton(app.ViewEnsPerfButtonGroup);
            app.TrainEnsPerf.Text = 'TRAIN';
            app.TrainEnsPerf.FontName = 'Arial';
            app.TrainEnsPerf.FontSize = 14;
            app.TrainEnsPerf.Position = [193 4 64 24];

            % Create TestEnsPerf
            app.TestEnsPerf = uitogglebutton(app.ViewEnsPerfButtonGroup);
            app.TestEnsPerf.Text = 'TEST';
            app.TestEnsPerf.FontName = 'Arial';
            app.TestEnsPerf.FontSize = 14;
            app.TestEnsPerf.Position = [259 4 64 24];

            % Create ViewEnsPerfLabel
            app.ViewEnsPerfLabel = uilabel(app.ViewEnsPerfButtonGroup);
            app.ViewEnsPerfLabel.HorizontalAlignment = 'center';
            app.ViewEnsPerfLabel.FontName = 'Arial';
            app.ViewEnsPerfLabel.FontSize = 14;
            app.ViewEnsPerfLabel.Position = [7 5 115 22];
            app.ViewEnsPerfLabel.Text = 'Dataset Segment';

            % Create FullEnsPerf
            app.FullEnsPerf = uitogglebutton(app.ViewEnsPerfButtonGroup);
            app.FullEnsPerf.Text = 'FULL';
            app.FullEnsPerf.FontName = 'Arial';
            app.FullEnsPerf.FontSize = 14;
            app.FullEnsPerf.Position = [127 4 64 24];
            app.FullEnsPerf.Value = true;

            % Create EnsembleUDFAuc
            app.EnsembleUDFAuc = uipanel(app.EVEns);
            app.EnsembleUDFAuc.Position = [936 387 453 340];

            % Create GraphPropertiesPanel
            app.GraphPropertiesPanel = uipanel(app.EVEns);
            app.GraphPropertiesPanel.Position = [21 23 478 306];

            % Create EnsembleUDFPR
            app.EnsembleUDFPR = uipanel(app.EVEns);
            app.EnsembleUDFPR.Position = [936 24 453 340];

            % Create EnsembleAllAuc
            app.EnsembleAllAuc = uipanel(app.EVEns);
            app.EnsembleAllAuc.Position = [1410 387 453 340];

            % Create EnsembleAllPR
            app.EnsembleAllPR = uipanel(app.EVEns);
            app.EnsembleAllPR.Position = [1410 24 453 340];

            % Create EnsembleCoordinates
            app.EnsembleCoordinates = uipanel(app.EVEns);
            app.EnsembleCoordinates.Position = [520 387 391 339];

            % Create EnsembleGraphStructure
            app.EnsembleGraphStructure = uipanel(app.EVEns);
            app.EnsembleGraphStructure.Position = [521 23 391 339];

            % Create IDPCN
            app.IDPCN = uitab(app.TabGroup);
            app.IDPCN.Title = 'Identify Pattern Completion';

            % Create PCNScatter
            app.PCNScatter = uipanel(app.IDPCN);
            app.PCNScatter.AutoResizeChildren = 'off';
            app.PCNScatter.Position = [1153 17 710 710];

            % Create PCNParams
            app.PCNParams = uipanel(app.IDPCN);
            app.PCNParams.AutoResizeChildren = 'off';
            app.PCNParams.Position = [23 17 385 708];

            % Create PatternCompletionNeuronsLabel
            app.PatternCompletionNeuronsLabel = uilabel(app.PCNParams);
            app.PatternCompletionNeuronsLabel.FontName = 'Arial';
            app.PatternCompletionNeuronsLabel.FontSize = 16;
            app.PatternCompletionNeuronsLabel.FontWeight = 'bold';
            app.PatternCompletionNeuronsLabel.Position = [11 675 224 22];
            app.PatternCompletionNeuronsLabel.Text = 'Pattern Completion Neurons';

            % Create IdentifyPatternCompletionNeuronsButton
            app.IdentifyPatternCompletionNeuronsButton = uibutton(app.PCNParams, 'push');
            app.IdentifyPatternCompletionNeuronsButton.ButtonPushedFcn = createCallbackFcn(app, @IdentifyPatternCompletionNeuronsButtonPushed, true);
            app.IdentifyPatternCompletionNeuronsButton.FontName = 'Arial';
            app.IdentifyPatternCompletionNeuronsButton.FontSize = 14;
            app.IdentifyPatternCompletionNeuronsButton.Position = [11 623 243 40];
            app.IdentifyPatternCompletionNeuronsButton.Text = 'Identify Pattern Completion Neurons';

            % Create UDFLabel_4
            app.UDFLabel_4 = uilabel(app.PCNParams);
            app.UDFLabel_4.HorizontalAlignment = 'right';
            app.UDFLabel_4.FontName = 'Arial';
            app.UDFLabel_4.FontSize = 14;
            app.UDFLabel_4.FontWeight = 'bold';
            app.UDFLabel_4.Position = [21 507 65 40];
            app.UDFLabel_4.Text = 'UDF';

            % Create Stimulus_PCN
            app.Stimulus_PCN = uieditfield(app.PCNParams, 'numeric');
            app.Stimulus_PCN.Limits = [1 Inf];
            app.Stimulus_PCN.RoundFractionalValues = 'on';
            app.Stimulus_PCN.ValueDisplayFormat = '%.0f';
            app.Stimulus_PCN.ValueChangedFcn = createCallbackFcn(app, @Stimulus_PCNValueChanged, true);
            app.Stimulus_PCN.FontName = 'Arial';
            app.Stimulus_PCN.FontSize = 14;
            app.Stimulus_PCN.FontWeight = 'bold';
            app.Stimulus_PCN.Position = [91 507 160 40];
            app.Stimulus_PCN.Value = 1;

            % Create NodeThresholdLabel
            app.NodeThresholdLabel = uilabel(app.PCNParams);
            app.NodeThresholdLabel.HorizontalAlignment = 'right';
            app.NodeThresholdLabel.FontName = 'Arial';
            app.NodeThresholdLabel.FontSize = 14;
            app.NodeThresholdLabel.Position = [24 574 105 22];
            app.NodeThresholdLabel.Text = 'Node Threshold';

            % Create NodeThresholdDropDown
            app.NodeThresholdDropDown = uidropdown(app.PCNParams);
            app.NodeThresholdDropDown.Items = {'Entire', 'Ensemble', 'Shuffling'};
            app.NodeThresholdDropDown.Editable = 'on';
            app.NodeThresholdDropDown.FontName = 'Arial';
            app.NodeThresholdDropDown.FontSize = 14;
            app.NodeThresholdDropDown.BackgroundColor = [1 1 1];
            app.NodeThresholdDropDown.Position = [133 566 120 40];
            app.NodeThresholdDropDown.Value = 'Ensemble';

            % Create OverlayDropDownLabel
            app.OverlayDropDownLabel = uilabel(app.PCNParams);
            app.OverlayDropDownLabel.HorizontalAlignment = 'right';
            app.OverlayDropDownLabel.FontName = 'Arial';
            app.OverlayDropDownLabel.FontSize = 14;
            app.OverlayDropDownLabel.Position = [17 459 54 22];
            app.OverlayDropDownLabel.Text = 'Overlay';

            % Create OverlayDropDown
            app.OverlayDropDown = uidropdown(app.PCNParams);
            app.OverlayDropDown.Items = {'Entire', 'Ensemble', 'Shuffling'};
            app.OverlayDropDown.Editable = 'on';
            app.OverlayDropDown.FontName = 'Arial';
            app.OverlayDropDown.FontSize = 14;
            app.OverlayDropDown.BackgroundColor = [1 1 1];
            app.OverlayDropDown.Position = [75 451 176 40];
            app.OverlayDropDown.Value = 'Ensemble';

            % Create PCNNeuronsTextAreaLabel_PCN
            app.PCNNeuronsTextAreaLabel_PCN = uilabel(app.PCNParams);
            app.PCNNeuronsTextAreaLabel_PCN.HorizontalAlignment = 'center';
            app.PCNNeuronsTextAreaLabel_PCN.FontName = 'Arial';
            app.PCNNeuronsTextAreaLabel_PCN.FontSize = 14;
            app.PCNNeuronsTextAreaLabel_PCN.Position = [6 372 190 40];
            app.PCNNeuronsTextAreaLabel_PCN.Text = 'Pattern Completion Neurons';

            % Create PCNNeuronsTextArea_PCN
            app.PCNNeuronsTextArea_PCN = uitextarea(app.PCNParams);
            app.PCNNeuronsTextArea_PCN.HorizontalAlignment = 'center';
            app.PCNNeuronsTextArea_PCN.FontName = 'Arial';
            app.PCNNeuronsTextArea_PCN.FontSize = 16;
            app.PCNNeuronsTextArea_PCN.Position = [196 372 160 40];

            % Create UniqueNeuronsTextArea_PCN
            app.UniqueNeuronsTextArea_PCN = uitextarea(app.PCNParams);
            app.UniqueNeuronsTextArea_PCN.HorizontalAlignment = 'center';
            app.UniqueNeuronsTextArea_PCN.FontName = 'Arial';
            app.UniqueNeuronsTextArea_PCN.FontSize = 16;
            app.UniqueNeuronsTextArea_PCN.Position = [195 314 160 40];

            % Create UniqueNeuronsTextAreaLabel_PCN
            app.UniqueNeuronsTextAreaLabel_PCN = uilabel(app.PCNParams);
            app.UniqueNeuronsTextAreaLabel_PCN.HorizontalAlignment = 'center';
            app.UniqueNeuronsTextAreaLabel_PCN.FontName = 'Arial';
            app.UniqueNeuronsTextAreaLabel_PCN.FontSize = 14;
            app.UniqueNeuronsTextAreaLabel_PCN.Position = [75 314 120 40];
            app.UniqueNeuronsTextAreaLabel_PCN.Text = 'Unique Neurons';

            % Create PercentUniqueVal_PCN
            app.PercentUniqueVal_PCN = uilabel(app.PCNParams);
            app.PercentUniqueVal_PCN.HorizontalAlignment = 'center';
            app.PercentUniqueVal_PCN.FontName = 'Arial';
            app.PercentUniqueVal_PCN.FontSize = 14;
            app.PercentUniqueVal_PCN.Position = [178 169 210 40];
            app.PercentUniqueVal_PCN.Text = '0%';

            % Create PercentUniqueLabel_PCN
            app.PercentUniqueLabel_PCN = uilabel(app.PCNParams);
            app.PercentUniqueLabel_PCN.HorizontalAlignment = 'center';
            app.PercentUniqueLabel_PCN.FontName = 'Arial';
            app.PercentUniqueLabel_PCN.FontSize = 14;
            app.PercentUniqueLabel_PCN.Position = [16 177 210 22];
            app.PercentUniqueLabel_PCN.Text = 'Percent Unique';

            % Create PromNeuronsTextArea_PCN
            app.PromNeuronsTextArea_PCN = uitextarea(app.PCNParams);
            app.PromNeuronsTextArea_PCN.HorizontalAlignment = 'center';
            app.PromNeuronsTextArea_PCN.FontName = 'Arial';
            app.PromNeuronsTextArea_PCN.FontSize = 16;
            app.PromNeuronsTextArea_PCN.Position = [196 258 160 40];

            % Create PromNeuronsLabel_PCN
            app.PromNeuronsLabel_PCN = uilabel(app.PCNParams);
            app.PromNeuronsLabel_PCN.HorizontalAlignment = 'center';
            app.PromNeuronsLabel_PCN.FontName = 'Arial';
            app.PromNeuronsLabel_PCN.FontSize = 14;
            app.PromNeuronsLabel_PCN.Position = [46 258 150 40];
            app.PromNeuronsLabel_PCN.Text = 'Promiscuous Neurons';

            % Create PCNDensity_PCN
            app.PCNDensity_PCN = uilabel(app.PCNParams);
            app.PCNDensity_PCN.HorizontalAlignment = 'center';
            app.PCNDensity_PCN.FontName = 'Arial';
            app.PCNDensity_PCN.FontSize = 14;
            app.PCNDensity_PCN.Position = [175 207 210 40];
            app.PCNDensity_PCN.Text = '0%';

            % Create PCDensityLabel_PCN
            app.PCDensityLabel_PCN = uilabel(app.PCNParams);
            app.PCDensityLabel_PCN.HorizontalAlignment = 'center';
            app.PCDensityLabel_PCN.FontName = 'Arial';
            app.PCDensityLabel_PCN.FontSize = 14;
            app.PCDensityLabel_PCN.Position = [28 216 210 22];
            app.PCDensityLabel_PCN.Text = 'Pattern Completion Density';

            % Create PCNCoordinates
            app.PCNCoordinates = uipanel(app.IDPCN);
            app.PCNCoordinates.Position = [425 17 710 710];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = PatMap

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end