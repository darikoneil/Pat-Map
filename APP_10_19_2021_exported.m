classdef APP_10_19_2021_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        IOPanel                         matlab.ui.container.Panel
        ResultsFilePath                 matlab.ui.control.EditField
        ImageFilePath                   matlab.ui.control.EditField
        LogTextArea                     matlab.ui.control.EditField
        LoggingConsoleLabel             matlab.ui.control.Label
        BrowseResults                   matlab.ui.control.Button
        BrowseImage                     matlab.ui.control.Button
        LoadResults                     matlab.ui.control.Button
        LoadImage                       matlab.ui.control.Button
        PatCompLabel                    matlab.ui.control.Label
        v0691Label                      matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        TabGroup                        matlab.ui.container.TabGroup
        OptimizationTab                 matlab.ui.container.Tab
        OptimizationSubTabs             matlab.ui.container.TabGroup
        HyperparameterOptimizationTab   matlab.ui.container.Tab
        StructuralLearningPanel         matlab.ui.container.Panel
        sLambdaPlotBG                   matlab.ui.container.ButtonGroup
        ParameterSpaceButton            matlab.ui.control.ToggleButton
        MaxDegreesButton                matlab.ui.control.ToggleButton
        MedianDegreesButton             matlab.ui.control.ToggleButton
        MeanDegreesButton               matlab.ui.control.ToggleButton
        RMSDegreesButton                matlab.ui.control.ToggleButton
        ComplexityButton                matlab.ui.control.ToggleButton
        RangeEditFieldLabel             matlab.ui.control.Label
        sLambdaRangeField               matlab.ui.control.EditField
        MinEditFieldLabel               matlab.ui.control.Label
        sLambdaMinField                 matlab.ui.control.EditField
        MaxEditFieldLabel               matlab.ui.control.Label
        sLambdaMaxField                 matlab.ui.control.EditField
        DensityEditFieldLabel           matlab.ui.control.Label
        sLambdaDensityField             matlab.ui.control.EditField
        UDFsMergedCheckBox              matlab.ui.control.CheckBox
        UDFUDFCheckBox                  matlab.ui.control.CheckBox
        sLambdaLogSpaceCheckBox         matlab.ui.control.CheckBox
        FedEditFieldLabel               matlab.ui.control.Label
        FedEditField                    matlab.ui.control.EditField
        NonNegativeCheckBox             matlab.ui.control.CheckBox
        GoodBracketCheckBox             matlab.ui.control.CheckBox
        ParameterEstimationPanel        matlab.ui.container.Panel
        pLambdaPlotBG                   matlab.ui.container.ButtonGroup
        pLambdaParameterSpace           matlab.ui.control.ToggleButton
        pLambdaWeightDistribution       matlab.ui.control.ToggleButton
        RangeEditField_2Label           matlab.ui.control.Label
        pLambdaRangeField               matlab.ui.control.EditField
        MinEditField_2Label             matlab.ui.control.Label
        pLambdaMinField                 matlab.ui.control.EditField
        MaxEditField_2Label             matlab.ui.control.Label
        pLambdaMaxField                 matlab.ui.control.EditField
        pLambdaLogSpace                 matlab.ui.control.CheckBox
        TrainingLikelihoodPanel         matlab.ui.container.Panel
        TrainingLikelihoodPlotBG        matlab.ui.container.ButtonGroup
        sLambdavsTrainingButton         matlab.ui.control.ToggleButton
        pLambdavsTrainingButton         matlab.ui.control.ToggleButton
        sLambdavspLambdavsTrainingButton  matlab.ui.control.ToggleButton
        MinEditField_3Label             matlab.ui.control.Label
        MinTraining                     matlab.ui.control.EditField
        MaxEditField_3Label             matlab.ui.control.Label
        MaxTraining                     matlab.ui.control.EditField
        MeanEditFieldLabel              matlab.ui.control.Label
        MeanTraining                    matlab.ui.control.EditField
        ExportTableButton               matlab.ui.control.Button
        ExportFigureButton              matlab.ui.control.Button
        CrossValidationTab              matlab.ui.container.Tab
        StructuralLearningPanel_2       matlab.ui.container.Panel
        VisualizeButtonGroup_4          matlab.ui.container.ButtonGroup
        ParameterSpaceButton_3          matlab.ui.control.ToggleButton
        MeanDegreesButton_4             matlab.ui.control.ToggleButton
        MaxDegreesButton_2              matlab.ui.control.ToggleButton
        MeanDegreesButton_5             matlab.ui.control.ToggleButton
        RMSDegreesButton_2              matlab.ui.control.ToggleButton
        ComplexityButton_2              matlab.ui.control.ToggleButton
        RangeEditField_3Label           matlab.ui.control.Label
        RangeEditField_3                matlab.ui.control.EditField
        MinEditField_4Label             matlab.ui.control.Label
        MinEditField_4                  matlab.ui.control.EditField
        MaxEditField_4Label             matlab.ui.control.Label
        MaxEditField_4                  matlab.ui.control.EditField
        DensityEditField_2Label         matlab.ui.control.Label
        DensityEditField_2              matlab.ui.control.EditField
        UDFsMergedCheckBox_2            matlab.ui.control.CheckBox
        UDFUDFCheckBox_2                matlab.ui.control.CheckBox
        LogSpaceCheckBox_3              matlab.ui.control.CheckBox
        FedEditField_2Label             matlab.ui.control.Label
        FedEditField_2                  matlab.ui.control.EditField
        NonNegativeCheckBox_2           matlab.ui.control.CheckBox
        GoodBracketCheckBox_2           matlab.ui.control.CheckBox
        ParameterEstimationPanel_2      matlab.ui.container.Panel
        VisualizeButtonGroup_5          matlab.ui.container.ButtonGroup
        ParameterSpaceButton_4          matlab.ui.control.ToggleButton
        WeightDistributionButton_2      matlab.ui.control.ToggleButton
        RangeEditField_3000Label        matlab.ui.control.Label
        RangeEditField_3000             matlab.ui.control.EditField
        MinEditField_4000Label          matlab.ui.control.Label
        MinEditField_4000               matlab.ui.control.EditField
        MaxEditField_4000Label          matlab.ui.control.Label
        MaxEditField_4000               matlab.ui.control.EditField
        LogSpaceCheckBox_4              matlab.ui.control.CheckBox
        RangeEditField_332Label         matlab.ui.control.Label
        RangeEditField_332              matlab.ui.control.EditField
        MinEditField_469Label           matlab.ui.control.Label
        MinEditField_469                matlab.ui.control.EditField
        MaxEditField_469Label           matlab.ui.control.Label
        MaxEditField_469                matlab.ui.control.EditField
        RangeEditField_369Label         matlab.ui.control.Label
        RangeEditField_369              matlab.ui.control.EditField
        MinEditField_432Label           matlab.ui.control.Label
        MinEditField_432                matlab.ui.control.EditField
        MaxEditField_432Label           matlab.ui.control.Label
        MaxEditField_432                matlab.ui.control.EditField
        RangeEditField_3Label6969       matlab.ui.control.Label
        RangeEditField_36969            matlab.ui.control.EditField
        MinEditField_4Label3699         matlab.ui.control.Label
        MinEditField_43699              matlab.ui.control.EditField
        MaxEditField_4Label3699         matlab.ui.control.Label
        MaxEditField_43699              matlab.ui.control.EditField
        RangeEditField_3Label3699       matlab.ui.control.Label
        RangeEditField_3699             matlab.ui.control.EditField
        MinEditField_4Label6969         matlab.ui.control.Label
        MinEditField_46969              matlab.ui.control.EditField
        MaxEditField_4Label6969         matlab.ui.control.Label
        MaxEditField_46969              matlab.ui.control.EditField
        RangeEditField_3Labelnerd       matlab.ui.control.Label
        RangeEditField_3nerd            matlab.ui.control.EditField
        MinEditField_4Labelxes          matlab.ui.control.Label
        MinEditField_4xes               matlab.ui.control.EditField
        MaxEditField_4Labelxes          matlab.ui.control.Label
        MaxEditField_4xes               matlab.ui.control.EditField
        RangeEditField_3Labelsex        matlab.ui.control.Label
        RangeEditField_3sex             matlab.ui.control.EditField
        MinEditField_4Labelsex          matlab.ui.control.Label
        MinEditField_4sex               matlab.ui.control.EditField
        MaxEditField_4Labelsex          matlab.ui.control.Label
        MaxEditField_4sex               matlab.ui.control.EditField
        RangeEditField_3Labeltit        matlab.ui.control.Label
        RangeEditField_3tit             matlab.ui.control.EditField
        MinEditField_4Labeleggs         matlab.ui.control.Label
        MinEditField_4eggs              matlab.ui.control.EditField
        MaxEditField_4Labeleggs         matlab.ui.control.Label
        MaxEditField_4eggs              matlab.ui.control.EditField
        RangeEditField_3Labeleggs       matlab.ui.control.Label
        RangeEditField_3eggs            matlab.ui.control.EditField
        MinEditField_4Labelbird         matlab.ui.control.Label
        MinEditField_4bird              matlab.ui.control.EditField
        MaxEditField_4Labelbird         matlab.ui.control.Label
        MaxEditField_4bird              matlab.ui.control.EditField
        TestingLikelihoodPanel          matlab.ui.container.Panel
        VisualizeButtonGroup_6          matlab.ui.container.ButtonGroup
        sLambdavsTestingButton          matlab.ui.control.ToggleButton
        pLambdavsTestingButton          matlab.ui.control.ToggleButton
        sLambdavspLambdavsTestingButton  matlab.ui.control.ToggleButton
        MinEditField_400Label           matlab.ui.control.Label
        MinEditField_400                matlab.ui.control.EditField
        MaxEditField_400Label           matlab.ui.control.Label
        MaxEditField_400                matlab.ui.control.EditField
        MeanEditField_2Label            matlab.ui.control.Label
        MeanEditField_2000              matlab.ui.control.EditField
        MinEditField_4Label5            matlab.ui.control.Label
        MinEditField_45                 matlab.ui.control.EditField
        MaxEditField_4Label5            matlab.ui.control.Label
        MaxEditField_45                 matlab.ui.control.EditField
        MinEditField_4gLabel            matlab.ui.control.Label
        MinEditField_4g                 matlab.ui.control.EditField
        MaxEditField_4gLabel            matlab.ui.control.Label
        MaxEditField_4g                 matlab.ui.control.EditField
        MinEditField_4Labelaaa          matlab.ui.control.Label
        MinEditField_4aaa               matlab.ui.control.EditField
        MaxEditField_4Labelaaa          matlab.ui.control.Label
        MaxEditField_4aaa               matlab.ui.control.EditField
        MinEditField_4Labelzzz          matlab.ui.control.Label
        MinEditField_4zzz               matlab.ui.control.EditField
        MaxEditField_4Labelzzz          matlab.ui.control.Label
        MaxEditField_4zzz               matlab.ui.control.EditField
        MinEditField_4Labeltoo          matlab.ui.control.Label
        MinEditField_4too               matlab.ui.control.EditField
        MaxEditField_4Labeltoo          matlab.ui.control.Label
        MaxEditField_4too               matlab.ui.control.EditField
        MinEditField_4Labelnut          matlab.ui.control.Label
        MinEditField_4nut               matlab.ui.control.EditField
        MaxEditField_4Labelnut          matlab.ui.control.Label
        MaxEditField_4nut               matlab.ui.control.EditField
        MinEditField_4Labelgreen        matlab.ui.control.Label
        MinEditField_4green             matlab.ui.control.EditField
        MaxEditField_4Labelnlue         matlab.ui.control.Label
        MaxEditField_4blue              matlab.ui.control.EditField
        MinEditField_4Labelred          matlab.ui.control.Label
        MinEditField_4red               matlab.ui.control.EditField
        MaxEditField_4Labelred          matlab.ui.control.Label
        MaxEditField_4red               matlab.ui.control.EditField
        ExportTableButton_2             matlab.ui.control.Button
        ExportFigureButton_2            matlab.ui.control.Button
        ModelSelectionTab               matlab.ui.container.Tab
        TotalLikelihoodPanel            matlab.ui.container.Panel
        VisualizeButtonGroup_9          matlab.ui.container.ButtonGroup
        sLambdavsTrainingButton_2       matlab.ui.control.ToggleButton
        pLambdavsTrainingButton_4       matlab.ui.control.ToggleButton
        sLambdavspLambdavsTrainingButton_2  matlab.ui.control.ToggleButton
        sLambdavspLambdavsWeightedButton  matlab.ui.control.ToggleButton
        HyperparametersvsLikelihood4DButton  matlab.ui.control.ToggleButton
        sLambdavspLambdavsTestingButton_2  matlab.ui.control.ToggleButton
        sLambdavsTestingButton_2        matlab.ui.control.ToggleButton
        pLambdavsTestingButton_3        matlab.ui.control.ToggleButton
        MinEditField_5Label             matlab.ui.control.Label
        MinEditField_5                  matlab.ui.control.EditField
        MaxEditField_5Label             matlab.ui.control.Label
        MaxEditField_5                  matlab.ui.control.EditField
        MeanEditField_3Label            matlab.ui.control.Label
        MeanEditField_3                 matlab.ui.control.EditField
        WeightingSliderLabel            matlab.ui.control.Label
        WeightingSlider                 matlab.ui.control.Slider
        ExportTableButton_3             matlab.ui.control.Button
        ExportFigureButton_3            matlab.ui.control.Button
        kFoldsValidationPanel           matlab.ui.container.Panel
        MaxEditField_5Label_2           matlab.ui.control.Label
        MaxEditField_6                  matlab.ui.control.EditField
        MeanEditField_3Label_2          matlab.ui.control.Label
        MeanEditField_4                 matlab.ui.control.EditField
        MinEditField_6Label             matlab.ui.control.Label
        MinEditField_6                  matlab.ui.control.EditField
        FoldSizeSliderLabel             matlab.ui.control.Label
        FoldSizeSlider                  matlab.ui.control.Slider
        VisualizeButtonGroup_10         matlab.ui.container.ButtonGroup
        sLambdavsLikelihoodButton       matlab.ui.control.ToggleButton
        pLambdavsLikelihoodButton       matlab.ui.control.ToggleButton
        sLambdavspLambdavsLikelihoodButton  matlab.ui.control.ToggleButton
        BestModelLikelihoodDistributionButton  matlab.ui.control.ToggleButton
        SpecificModelLikelihoodDistributionButton  matlab.ui.control.ToggleButton
        ExportSelectionButton           matlab.ui.control.Button
        Panel                           matlab.ui.container.Panel
        BestModelIDEditFieldLabel       matlab.ui.control.Label
        BestModelIDEditField            matlab.ui.control.NumericEditField
        SelectSpecificModelEditFieldLabel  matlab.ui.control.Label
        SelectSpecificModelEditField    matlab.ui.control.NumericEditField
        OptimizationAxes                matlab.ui.control.UIAxes
        ResultsTab                      matlab.ui.container.Tab
        TabGroup3                       matlab.ui.container.TabGroup
        GlobalTab                       matlab.ui.container.Tab
        VisualizeButtonGroup_13         matlab.ui.container.ButtonGroup
        IdentityOverlayButton_3         matlab.ui.control.ToggleButton
        StructureButton                 matlab.ui.control.ToggleButton
        FunctionalConnectivityButton    matlab.ui.control.ToggleButton
        OvercompletionButton            matlab.ui.control.ToggleButton
        FrameFrameLikelihoodButton      matlab.ui.control.ToggleButton
        ExportTableButton_6             matlab.ui.control.Button
        ExportFigureButton_6            matlab.ui.control.Button
        StimuliTab                      matlab.ui.container.Tab
        TabGroup4                       matlab.ui.container.TabGroup
        EnsembleTab                     matlab.ui.container.Tab
        PredictionPerformancePanel      matlab.ui.container.Panel
        TruePositiveEditFieldLabel      matlab.ui.control.Label
        TruePositiveEditField           matlab.ui.control.EditField
        FalsePositiveEditFieldLabel     matlab.ui.control.Label
        FalsePositiveEditField          matlab.ui.control.EditField
        TrueNegativeEditFieldLabel      matlab.ui.control.Label
        TrueNegativeEditField           matlab.ui.control.EditField
        FalseNegativeEditFieldLabel     matlab.ui.control.Label
        FalseNegativeEditField          matlab.ui.control.EditField
        AUCROCEditFieldLabel            matlab.ui.control.Label
        AUCROCEditField                 matlab.ui.control.EditField
        SpecificityEditFieldLabel       matlab.ui.control.Label
        SpecificityEditField            matlab.ui.control.EditField
        SensitivityEditFieldLabel       matlab.ui.control.Label
        SensitivityEditField            matlab.ui.control.EditField
        AccuracyEditFieldLabel          matlab.ui.control.Label
        AccuracyEditField               matlab.ui.control.EditField
        EditField_11Label_2             matlab.ui.control.Label
        EditField_12                    matlab.ui.control.EditField
        FalseNegativeEditFieldLabel_2   matlab.ui.control.Label
        FalseNegativeEditField_2        matlab.ui.control.EditField
        FalseNegativeEditFieldLabel_3   matlab.ui.control.Label
        FalseNegativeEditField_3        matlab.ui.control.EditField
        FalseNegativeEditFieldLabel_4   matlab.ui.control.Label
        FalseNegativeEditField_4        matlab.ui.control.EditField
        CalculateButton                 matlab.ui.control.Button
        AlphaEditFieldLabel             matlab.ui.control.Label
        AlphaEditField                  matlab.ui.control.EditField
        ConfInterCheckBox               matlab.ui.control.CheckBox
        VisualizeButtonGroup_11         matlab.ui.container.ButtonGroup
        IdentityOverlayButton           matlab.ui.control.ToggleButton
        RecieverOperatingCharacteristicButton  matlab.ui.control.ToggleButton
        ROCAllStimuliButton             matlab.ui.control.ToggleButton
        ROCAllEnsemblesButton           matlab.ui.control.ToggleButton
        ROCOptimalSizeButton            matlab.ui.control.ToggleButton
        RasterContinousButton           matlab.ui.control.ToggleButton
        RasterBinaryButton              matlab.ui.control.ToggleButton
        ExportTableButton_4             matlab.ui.control.Button
        ExportFigureButton_4            matlab.ui.control.Button
        LabelEditFieldLabel             matlab.ui.control.Label
        LabelEditField                  matlab.ui.control.EditField
        IndexTextAreaLabel              matlab.ui.control.Label
        IndexTextArea                   matlab.ui.control.TextArea
        UniqueTextAreaLabel             matlab.ui.control.Label
        UniqueTextArea                  matlab.ui.control.TextArea
        PatternCompletionTab            matlab.ui.container.Tab
        NeuronStatisticsPanel           matlab.ui.container.Panel
        AUCROCEditField_2Label          matlab.ui.control.Label
        AUCROCEditField_2               matlab.ui.control.EditField
        SpecificityEditField_2Label     matlab.ui.control.Label
        SpecificityEditField_2          matlab.ui.control.EditField
        SensitivityEditField_2Label     matlab.ui.control.Label
        SensitivityEditField_2          matlab.ui.control.EditField
        AccuracyEditField_2Label        matlab.ui.control.Label
        AccuracyEditField_2             matlab.ui.control.EditField
        CalculateButton_2               matlab.ui.control.Button
        AUCROCEditField_2Label_2        matlab.ui.control.Label
        AUCROCEditField_3               matlab.ui.control.EditField
        AUCROCEditField_2Label_3        matlab.ui.control.Label
        AUCROCEditField_4               matlab.ui.control.EditField
        AUCROCEditField_2Label_4        matlab.ui.control.Label
        AUCROCEditField_5               matlab.ui.control.EditField
        AUCROCEditField_2Label_5        matlab.ui.control.Label
        AUCROCEditField_6               matlab.ui.control.EditField
        AccuracyEditField_2Label_2      matlab.ui.control.Label
        AccuracyEditField_3             matlab.ui.control.EditField
        VisualizeButtonGroup_12         matlab.ui.container.ButtonGroup
        IdentityOverlayButton_2         matlab.ui.control.ToggleButton
        ROCButton                       matlab.ui.control.ToggleButton
        ConnectivityButton              matlab.ui.control.ToggleButton
        ConnectivityInOnlyButton        matlab.ui.control.ToggleButton
        ExportTableButton_5             matlab.ui.control.Button
        ExportFigureButton_5            matlab.ui.control.Button
        LabelEditFieldLabel_2           matlab.ui.control.Label
        LabelEditField_2                matlab.ui.control.EditField
        IndexTextAreaLabel_2            matlab.ui.control.Label
        IndexTextArea_2                 matlab.ui.control.TextArea
        UniqueTextAreaLabel_2           matlab.ui.control.Label
        UniqueTextArea_2                matlab.ui.control.TextArea
        CriteriaListBoxLabel            matlab.ui.control.Label
        CriteriaListBox                 matlab.ui.control.ListBox
        SelectSpecificModelEditFieldLabel_2  matlab.ui.control.Label
        SelectSpecificModelEditField_2  matlab.ui.control.NumericEditField
        UIAxes_2                        matlab.ui.control.UIAxes
        ParametersTab                   matlab.ui.container.Tab
        ModelingPanel                   matlab.ui.container.Panel
        StructuralLearningSLambdaLabel  matlab.ui.control.Label
        ParameterEstimationPLambdaLabel  matlab.ui.control.Label
        TotalNumberofModelsEditFieldLabel  matlab.ui.control.Label
        TotalNumberofModelsEditField    matlab.ui.control.NumericEditField
        GlobalModelingParametersLabel   matlab.ui.control.Label
        PartitionFunctionLabel          matlab.ui.control.Label
        reweightdenominatorDropDown     matlab.ui.control.DropDown
        BlockCoordinateFrankeWolfeLabel  matlab.ui.control.Label
        ReweightingLabel                matlab.ui.control.Label
        PS_Label                        matlab.ui.control.Label
        Poolsize_num                    matlab.ui.control.NumericEditField
        MergeUDFNeuronalNodesCheckBox   matlab.ui.control.CheckBox
        RangeEditFieldLabel_2           matlab.ui.control.Label
        S_range                         matlab.ui.control.NumericEditField
        MinEditFieldLabel_2             matlab.ui.control.Label
        S_min                           matlab.ui.control.NumericEditField
        MaxEditFieldLabel_2             matlab.ui.control.Label
        S_max                           matlab.ui.control.NumericEditField
        MinEditField_2Label_2           matlab.ui.control.Label
        P_min                           matlab.ui.control.NumericEditField
        MaxEditField_2Label_2           matlab.ui.control.Label
        P_max                           matlab.ui.control.NumericEditField
        ParameterSamplingDropDownLabel  matlab.ui.control.Label
        ParameterSamplingDropDown       matlab.ui.control.DropDown
        RangeEditField_2Label_2         matlab.ui.control.Label
        P_range                         matlab.ui.control.NumericEditField
        MaxIterationsEditFieldLabel     matlab.ui.control.Label
        MaxIterationsEditField          matlab.ui.control.NumericEditField
        EpsilonEditFieldLabel           matlab.ui.control.Label
        EpsilonEditField                matlab.ui.control.NumericEditField
        PrintIntervalEditFieldLabel     matlab.ui.control.Label
        PrintIntervalEditField          matlab.ui.control.NumericEditField
        PrintTestEditFieldLabel         matlab.ui.control.Label
        PrintTestEditField              matlab.ui.control.NumericEditField
        PrintDualityGapEditFieldLabel   matlab.ui.control.Label
        PrintDualityGapEditField        matlab.ui.control.NumericEditField
        NumberofStructuresEditFieldLabel  matlab.ui.control.Label
        NumberofStructuresEditField     matlab.ui.control.NumericEditField
        ReweightDenominatorDropDownLabel  matlab.ui.control.Label
        ReweightDenominatorDropDown     matlab.ui.control.DropDown
        SplitEditFieldLabel             matlab.ui.control.Label
        SplitEditField                  matlab.ui.control.NumericEditField
        EdgeConstraintsDropDownLabel    matlab.ui.control.Label
        EdgeConstraintsDropDown         matlab.ui.control.DropDown
        OvercompletionDebugDropDownLabel  matlab.ui.control.Label
        OvercompletionDebugDropDown     matlab.ui.control.DropDown
        MaxTimeEditFieldLabel           matlab.ui.control.Label
        MaxTimeEditField                matlab.ui.control.NumericEditField
        ParallelizationDropDownLabel    matlab.ui.control.Label
        ParallelizationDropDown         matlab.ui.control.DropDown
        DensityConstraintEditFieldLabel  matlab.ui.control.Label
        DensityConstraintEditField      matlab.ui.control.NumericEditField
        CountLabel                      matlab.ui.control.Label
        P_Count                         matlab.ui.control.NumericEditField
        ImagingPanel                    matlab.ui.container.Panel
    end

    
    properties (Access = private)
       
    end
    
    properties (Access = public)
          log;
          log_line=1;
          ops = struct();
          results = struct();
          params = struct();
          stat;
          model_collection = struct();
          icell;
          best_model;
          best_model_index;
          file_loc;
          file_loc_IM;
          ImData=struct();
          ttrain;
          ttest;
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
             pwd2 = fileparts(which('APP_10_19_2021.mlapp'));
                 %pwd2 = pwd;
            
            if exist([pwd2 '\hideFun'], 'dir')
                addpath([pwd2 '\hideFun']);
            else
                error('RAFA: You need to move to PatComp directory and reopen GUI!!!');
            end    
                
            f_DA_startup(app);
        end

        % Button pushed function: BrowseResults
        function BrowseResultsButtonPushed(app, event)
            f_DA_browse_results(app);
        end

        % Button pushed function: BrowseImage
        function BrowseImageButtonPushed(app, event)
            f_DA_browse_IM(app);
        end

        % Button pushed function: LoadImage
        function LoadImageButtonPushed(app, event)
            f_DA_load_IM(app);
        end

        % Button pushed function: LoadResults
        function LoadResultsButtonPushed(app, event)
            f_DA_load_results(app);
        end

        % Selection changed function: sLambdaPlotBG
        function sLambdaPlotBGSelectionChanged(app, event)
            selectedButton = app.sLambdaPlotBG.SelectedObject;
            f_DA_structural_learning_plot(selectedButton,app);
        end

        % Selection changed function: pLambdaPlotBG
        function pLambdaPlotBGSelectionChanged(app, event)
            selectedButton = app.pLambdaPlotBG.SelectedObject;
            f_DA_parameter_estimation_plot(selectedButton,app);
        end

        % Selection changed function: TrainingLikelihoodPlotBG
        function TrainingLikelihoodPlotBGSelectionChanged(app, event)
            selectedButton = app.TrainingLikelihoodPlotBG.SelectedObject;
                f_DA_train_likelihood_plot(selectedButton,app);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1820 1000];
            app.UIFigure.Name = 'MATLAB App';

            % Create IOPanel
            app.IOPanel = uipanel(app.UIFigure);
            app.IOPanel.Position = [1 801 1820 200];

            % Create ResultsFilePath
            app.ResultsFilePath = uieditfield(app.IOPanel, 'text');
            app.ResultsFilePath.Position = [441 157 1140 22];
            app.ResultsFilePath.Value = 'Load Results File (.mat)';

            % Create ImageFilePath
            app.ImageFilePath = uieditfield(app.IOPanel, 'text');
            app.ImageFilePath.Position = [441 117 1140 22];
            app.ImageFilePath.Value = 'Load Imaging File (.mat)';

            % Create LogTextArea
            app.LogTextArea = uieditfield(app.IOPanel, 'text');
            app.LogTextArea.Position = [241 17 1340 62];

            % Create LoggingConsoleLabel
            app.LoggingConsoleLabel = uilabel(app.IOPanel);
            app.LoggingConsoleLabel.HorizontalAlignment = 'center';
            app.LoggingConsoleLabel.FontSize = 16;
            app.LoggingConsoleLabel.FontWeight = 'bold';
            app.LoggingConsoleLabel.Position = [241 78 1340 41];
            app.LoggingConsoleLabel.Text = 'Logging Console';

            % Create BrowseResults
            app.BrowseResults = uibutton(app.IOPanel, 'push');
            app.BrowseResults.ButtonPushedFcn = createCallbackFcn(app, @BrowseResultsButtonPushed, true);
            app.BrowseResults.Position = [241 157 81 22];
            app.BrowseResults.Text = 'Browse';

            % Create BrowseImage
            app.BrowseImage = uibutton(app.IOPanel, 'push');
            app.BrowseImage.ButtonPushedFcn = createCallbackFcn(app, @BrowseImageButtonPushed, true);
            app.BrowseImage.Position = [241 117 81 22];
            app.BrowseImage.Text = 'Browse';

            % Create LoadResults
            app.LoadResults = uibutton(app.IOPanel, 'push');
            app.LoadResults.ButtonPushedFcn = createCallbackFcn(app, @LoadResultsButtonPushed, true);
            app.LoadResults.Position = [341 157 81 22];
            app.LoadResults.Text = 'Load';

            % Create LoadImage
            app.LoadImage = uibutton(app.IOPanel, 'push');
            app.LoadImage.ButtonPushedFcn = createCallbackFcn(app, @LoadImageButtonPushed, true);
            app.LoadImage.Position = [341 117 81 22];
            app.LoadImage.Text = 'Load';

            % Create PatCompLabel
            app.PatCompLabel = uilabel(app.IOPanel);
            app.PatCompLabel.HorizontalAlignment = 'center';
            app.PatCompLabel.FontSize = 36;
            app.PatCompLabel.FontWeight = 'bold';
            app.PatCompLabel.Position = [41 94 164 45];
            app.PatCompLabel.Text = 'PatComp';

            % Create v0691Label
            app.v0691Label = uilabel(app.IOPanel);
            app.v0691Label.FontSize = 24;
            app.v0691Label.FontWeight = 'bold';
            app.v0691Label.Position = [81 69 86 30];
            app.v0691Label.Text = 'v0.69.1';

            % Create Image
            app.Image = uiimage(app.IOPanel);
            app.Image.Position = [1621 18 161 161];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [21 21 1780 760];

            % Create OptimizationTab
            app.OptimizationTab = uitab(app.TabGroup);
            app.OptimizationTab.Title = ' Optimization';

            % Create OptimizationSubTabs
            app.OptimizationSubTabs = uitabgroup(app.OptimizationTab);
            app.OptimizationSubTabs.Position = [40 35 481 665];

            % Create HyperparameterOptimizationTab
            app.HyperparameterOptimizationTab = uitab(app.OptimizationSubTabs);
            app.HyperparameterOptimizationTab.Title = 'Hyperparameter Optimization';

            % Create StructuralLearningPanel
            app.StructuralLearningPanel = uipanel(app.HyperparameterOptimizationTab);
            app.StructuralLearningPanel.Title = 'Structural Learning';
            app.StructuralLearningPanel.Position = [21 440 441 190];

            % Create sLambdaPlotBG
            app.sLambdaPlotBG = uibuttongroup(app.StructuralLearningPanel);
            app.sLambdaPlotBG.SelectionChangedFcn = createCallbackFcn(app, @sLambdaPlotBGSelectionChanged, true);
            app.sLambdaPlotBG.TitlePosition = 'centertop';
            app.sLambdaPlotBG.Title = 'Visualize';
            app.sLambdaPlotBG.Position = [291 10 131 145];

            % Create ParameterSpaceButton
            app.ParameterSpaceButton = uitogglebutton(app.sLambdaPlotBG);
            app.ParameterSpaceButton.Tag = 'PS1';
            app.ParameterSpaceButton.Text = 'Parameter Space';
            app.ParameterSpaceButton.Position = [11 102 109 22];
            app.ParameterSpaceButton.Value = true;

            % Create MaxDegreesButton
            app.MaxDegreesButton = uitogglebutton(app.sLambdaPlotBG);
            app.MaxDegreesButton.Text = 'Max Degrees';
            app.MaxDegreesButton.Position = [16 82 100 22];

            % Create MedianDegreesButton
            app.MedianDegreesButton = uitogglebutton(app.sLambdaPlotBG);
            app.MedianDegreesButton.Text = 'Median Degrees';
            app.MedianDegreesButton.Position = [14 62 104 22];

            % Create MeanDegreesButton
            app.MeanDegreesButton = uitogglebutton(app.sLambdaPlotBG);
            app.MeanDegreesButton.Text = 'Mean Degrees';
            app.MeanDegreesButton.Position = [11 42 109 22];

            % Create RMSDegreesButton
            app.RMSDegreesButton = uitogglebutton(app.sLambdaPlotBG);
            app.RMSDegreesButton.Text = 'RMS Degrees';
            app.RMSDegreesButton.Position = [11 22 109 22];

            % Create ComplexityButton
            app.ComplexityButton = uitogglebutton(app.sLambdaPlotBG);
            app.ComplexityButton.Text = 'Complexity';
            app.ComplexityButton.Position = [11 2 109 22];

            % Create RangeEditFieldLabel
            app.RangeEditFieldLabel = uilabel(app.StructuralLearningPanel);
            app.RangeEditFieldLabel.Position = [10 133 41 22];
            app.RangeEditFieldLabel.Text = 'Range';

            % Create sLambdaRangeField
            app.sLambdaRangeField = uieditfield(app.StructuralLearningPanel, 'text');
            app.sLambdaRangeField.Position = [69 133 100 22];

            % Create MinEditFieldLabel
            app.MinEditFieldLabel = uilabel(app.StructuralLearningPanel);
            app.MinEditFieldLabel.Position = [10 103 25 22];
            app.MinEditFieldLabel.Text = 'Min';

            % Create sLambdaMinField
            app.sLambdaMinField = uieditfield(app.StructuralLearningPanel, 'text');
            app.sLambdaMinField.Position = [69 103 100 22];

            % Create MaxEditFieldLabel
            app.MaxEditFieldLabel = uilabel(app.StructuralLearningPanel);
            app.MaxEditFieldLabel.Position = [10 73 28 22];
            app.MaxEditFieldLabel.Text = 'Max';

            % Create sLambdaMaxField
            app.sLambdaMaxField = uieditfield(app.StructuralLearningPanel, 'text');
            app.sLambdaMaxField.Position = [69 73 100 22];

            % Create DensityEditFieldLabel
            app.DensityEditFieldLabel = uilabel(app.StructuralLearningPanel);
            app.DensityEditFieldLabel.Position = [10 43 46 22];
            app.DensityEditFieldLabel.Text = 'Density';

            % Create sLambdaDensityField
            app.sLambdaDensityField = uieditfield(app.StructuralLearningPanel, 'text');
            app.sLambdaDensityField.Position = [69 43 100 22];

            % Create UDFsMergedCheckBox
            app.UDFsMergedCheckBox = uicheckbox(app.StructuralLearningPanel);
            app.UDFsMergedCheckBox.Text = 'UDFs Merged';
            app.UDFsMergedCheckBox.Position = [180 133 97 22];

            % Create UDFUDFCheckBox
            app.UDFUDFCheckBox = uicheckbox(app.StructuralLearningPanel);
            app.UDFUDFCheckBox.Text = 'UDF-UDF';
            app.UDFUDFCheckBox.Position = [180 103 75 22];

            % Create sLambdaLogSpaceCheckBox
            app.sLambdaLogSpaceCheckBox = uicheckbox(app.StructuralLearningPanel);
            app.sLambdaLogSpaceCheckBox.Text = 'Log Space';
            app.sLambdaLogSpaceCheckBox.Position = [180 73 79 22];

            % Create FedEditFieldLabel
            app.FedEditFieldLabel = uilabel(app.StructuralLearningPanel);
            app.FedEditFieldLabel.Position = [10 13 26 22];
            app.FedEditFieldLabel.Text = 'Fed';

            % Create FedEditField
            app.FedEditField = uieditfield(app.StructuralLearningPanel, 'text');
            app.FedEditField.Position = [69 13 100 22];

            % Create NonNegativeCheckBox
            app.NonNegativeCheckBox = uicheckbox(app.StructuralLearningPanel);
            app.NonNegativeCheckBox.Text = 'Non-Negative';
            app.NonNegativeCheckBox.Position = [180 42 95 22];

            % Create GoodBracketCheckBox
            app.GoodBracketCheckBox = uicheckbox(app.StructuralLearningPanel);
            app.GoodBracketCheckBox.Text = 'Good Bracket';
            app.GoodBracketCheckBox.Position = [180 12 95 22];

            % Create ParameterEstimationPanel
            app.ParameterEstimationPanel = uipanel(app.HyperparameterOptimizationTab);
            app.ParameterEstimationPanel.Title = 'Parameter Estimation';
            app.ParameterEstimationPanel.Position = [18 275 441 140];

            % Create pLambdaPlotBG
            app.pLambdaPlotBG = uibuttongroup(app.ParameterEstimationPanel);
            app.pLambdaPlotBG.SelectionChangedFcn = createCallbackFcn(app, @pLambdaPlotBGSelectionChanged, true);
            app.pLambdaPlotBG.TitlePosition = 'centertop';
            app.pLambdaPlotBG.Title = 'Visualize';
            app.pLambdaPlotBG.Position = [291 40 132 65];

            % Create pLambdaParameterSpace
            app.pLambdaParameterSpace = uitogglebutton(app.pLambdaPlotBG);
            app.pLambdaParameterSpace.Text = 'Parameter Space';
            app.pLambdaParameterSpace.Position = [11 23 109 22];
            app.pLambdaParameterSpace.Value = true;

            % Create pLambdaWeightDistribution
            app.pLambdaWeightDistribution = uitogglebutton(app.pLambdaPlotBG);
            app.pLambdaWeightDistribution.Text = 'Weight Distribution';
            app.pLambdaWeightDistribution.Position = [11 3 116 22];

            % Create RangeEditField_2Label
            app.RangeEditField_2Label = uilabel(app.ParameterEstimationPanel);
            app.RangeEditField_2Label.Position = [10 83 41 22];
            app.RangeEditField_2Label.Text = 'Range';

            % Create pLambdaRangeField
            app.pLambdaRangeField = uieditfield(app.ParameterEstimationPanel, 'text');
            app.pLambdaRangeField.Position = [69 83 100 22];

            % Create MinEditField_2Label
            app.MinEditField_2Label = uilabel(app.ParameterEstimationPanel);
            app.MinEditField_2Label.Position = [10 53 25 22];
            app.MinEditField_2Label.Text = 'Min';

            % Create pLambdaMinField
            app.pLambdaMinField = uieditfield(app.ParameterEstimationPanel, 'text');
            app.pLambdaMinField.Position = [69 53 100 22];

            % Create MaxEditField_2Label
            app.MaxEditField_2Label = uilabel(app.ParameterEstimationPanel);
            app.MaxEditField_2Label.Position = [10 23 28 22];
            app.MaxEditField_2Label.Text = 'Max';

            % Create pLambdaMaxField
            app.pLambdaMaxField = uieditfield(app.ParameterEstimationPanel, 'text');
            app.pLambdaMaxField.Position = [69 23 100 22];

            % Create pLambdaLogSpace
            app.pLambdaLogSpace = uicheckbox(app.ParameterEstimationPanel);
            app.pLambdaLogSpace.Text = 'Log Space';
            app.pLambdaLogSpace.Position = [315 10 79 22];

            % Create TrainingLikelihoodPanel
            app.TrainingLikelihoodPanel = uipanel(app.HyperparameterOptimizationTab);
            app.TrainingLikelihoodPanel.Title = 'Training Likelihood';
            app.TrainingLikelihoodPanel.Position = [18 95 441 153];

            % Create TrainingLikelihoodPlotBG
            app.TrainingLikelihoodPlotBG = uibuttongroup(app.TrainingLikelihoodPanel);
            app.TrainingLikelihoodPlotBG.SelectionChangedFcn = createCallbackFcn(app, @TrainingLikelihoodPlotBGSelectionChanged, true);
            app.TrainingLikelihoodPlotBG.TitlePosition = 'centertop';
            app.TrainingLikelihoodPlotBG.Title = 'Visualize';
            app.TrainingLikelihoodPlotBG.Position = [192 12 232 106];

            % Create sLambdavsTrainingButton
            app.sLambdavsTrainingButton = uitogglebutton(app.TrainingLikelihoodPlotBG);
            app.sLambdavsTrainingButton.Text = 'sLambda vs. Training';
            app.sLambdavsTrainingButton.Position = [14 53 203 22];
            app.sLambdavsTrainingButton.Value = true;

            % Create pLambdavsTrainingButton
            app.pLambdavsTrainingButton = uitogglebutton(app.TrainingLikelihoodPlotBG);
            app.pLambdavsTrainingButton.Text = 'pLambda vs. Training';
            app.pLambdavsTrainingButton.Position = [14 32 203 22];

            % Create sLambdavspLambdavsTrainingButton
            app.sLambdavspLambdavsTrainingButton = uitogglebutton(app.TrainingLikelihoodPlotBG);
            app.sLambdavspLambdavsTrainingButton.Text = 'sLambda vs. pLambda vs. Training';
            app.sLambdavspLambdavsTrainingButton.Position = [14 11 203 22];

            % Create MinEditField_3Label
            app.MinEditField_3Label = uilabel(app.TrainingLikelihoodPanel);
            app.MinEditField_3Label.Position = [10 93 25 22];
            app.MinEditField_3Label.Text = 'Min';

            % Create MinTraining
            app.MinTraining = uieditfield(app.TrainingLikelihoodPanel, 'text');
            app.MinTraining.Position = [69 93 100 22];

            % Create MaxEditField_3Label
            app.MaxEditField_3Label = uilabel(app.TrainingLikelihoodPanel);
            app.MaxEditField_3Label.Position = [10 63 28 22];
            app.MaxEditField_3Label.Text = 'Max';

            % Create MaxTraining
            app.MaxTraining = uieditfield(app.TrainingLikelihoodPanel, 'text');
            app.MaxTraining.Position = [69 63 100 22];

            % Create MeanEditFieldLabel
            app.MeanEditFieldLabel = uilabel(app.TrainingLikelihoodPanel);
            app.MeanEditFieldLabel.Position = [10 33 36 22];
            app.MeanEditFieldLabel.Text = 'Mean';

            % Create MeanTraining
            app.MeanTraining = uieditfield(app.TrainingLikelihoodPanel, 'text');
            app.MeanTraining.Position = [69 33 100 22];

            % Create ExportTableButton
            app.ExportTableButton = uibutton(app.HyperparameterOptimizationTab, 'push');
            app.ExportTableButton.Position = [90 42 100 22];
            app.ExportTableButton.Text = 'Export Table';

            % Create ExportFigureButton
            app.ExportFigureButton = uibutton(app.HyperparameterOptimizationTab, 'push');
            app.ExportFigureButton.Position = [276 42 100 22];
            app.ExportFigureButton.Text = 'Export Figure';

            % Create CrossValidationTab
            app.CrossValidationTab = uitab(app.OptimizationSubTabs);
            app.CrossValidationTab.Title = 'Cross-Validation';

            % Create StructuralLearningPanel_2
            app.StructuralLearningPanel_2 = uipanel(app.CrossValidationTab);
            app.StructuralLearningPanel_2.Title = 'Structural Learning';
            app.StructuralLearningPanel_2.Position = [21 429 441 190];

            % Create VisualizeButtonGroup_4
            app.VisualizeButtonGroup_4 = uibuttongroup(app.StructuralLearningPanel_2);
            app.VisualizeButtonGroup_4.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_4.Title = 'Visualize';
            app.VisualizeButtonGroup_4.Position = [291 10 131 145];

            % Create ParameterSpaceButton_3
            app.ParameterSpaceButton_3 = uitogglebutton(app.VisualizeButtonGroup_4);
            app.ParameterSpaceButton_3.Text = 'Parameter Space';
            app.ParameterSpaceButton_3.Position = [11 102 109 22];
            app.ParameterSpaceButton_3.Value = true;

            % Create MeanDegreesButton_4
            app.MeanDegreesButton_4 = uitogglebutton(app.VisualizeButtonGroup_4);
            app.MeanDegreesButton_4.Text = 'Mean Degrees';
            app.MeanDegreesButton_4.Position = [11 82 109 22];

            % Create MaxDegreesButton_2
            app.MaxDegreesButton_2 = uitogglebutton(app.VisualizeButtonGroup_4);
            app.MaxDegreesButton_2.Text = 'Max Degrees';
            app.MaxDegreesButton_2.Position = [11 62 109 22];

            % Create MeanDegreesButton_5
            app.MeanDegreesButton_5 = uitogglebutton(app.VisualizeButtonGroup_4);
            app.MeanDegreesButton_5.Text = 'Mean Degrees';
            app.MeanDegreesButton_5.Position = [11 42 109 22];

            % Create RMSDegreesButton_2
            app.RMSDegreesButton_2 = uitogglebutton(app.VisualizeButtonGroup_4);
            app.RMSDegreesButton_2.Text = 'RMS Degrees';
            app.RMSDegreesButton_2.Position = [11 22 109 22];

            % Create ComplexityButton_2
            app.ComplexityButton_2 = uitogglebutton(app.VisualizeButtonGroup_4);
            app.ComplexityButton_2.Text = 'Complexity';
            app.ComplexityButton_2.Position = [11 2 109 22];

            % Create RangeEditField_3Label
            app.RangeEditField_3Label = uilabel(app.StructuralLearningPanel_2);
            app.RangeEditField_3Label.Position = [10 133 41 22];
            app.RangeEditField_3Label.Text = 'Range';

            % Create RangeEditField_3
            app.RangeEditField_3 = uieditfield(app.StructuralLearningPanel_2, 'text');
            app.RangeEditField_3.Position = [69 133 100 22];

            % Create MinEditField_4Label
            app.MinEditField_4Label = uilabel(app.StructuralLearningPanel_2);
            app.MinEditField_4Label.Position = [10 103 25 22];
            app.MinEditField_4Label.Text = 'Min';

            % Create MinEditField_4
            app.MinEditField_4 = uieditfield(app.StructuralLearningPanel_2, 'text');
            app.MinEditField_4.Position = [69 103 100 22];

            % Create MaxEditField_4Label
            app.MaxEditField_4Label = uilabel(app.StructuralLearningPanel_2);
            app.MaxEditField_4Label.Position = [10 73 28 22];
            app.MaxEditField_4Label.Text = 'Max';

            % Create MaxEditField_4
            app.MaxEditField_4 = uieditfield(app.StructuralLearningPanel_2, 'text');
            app.MaxEditField_4.Position = [69 73 100 22];

            % Create DensityEditField_2Label
            app.DensityEditField_2Label = uilabel(app.StructuralLearningPanel_2);
            app.DensityEditField_2Label.Position = [10 43 46 22];
            app.DensityEditField_2Label.Text = 'Density';

            % Create DensityEditField_2
            app.DensityEditField_2 = uieditfield(app.StructuralLearningPanel_2, 'text');
            app.DensityEditField_2.Position = [69 43 100 22];

            % Create UDFsMergedCheckBox_2
            app.UDFsMergedCheckBox_2 = uicheckbox(app.StructuralLearningPanel_2);
            app.UDFsMergedCheckBox_2.Text = 'UDFs Merged';
            app.UDFsMergedCheckBox_2.Position = [180 133 97 22];

            % Create UDFUDFCheckBox_2
            app.UDFUDFCheckBox_2 = uicheckbox(app.StructuralLearningPanel_2);
            app.UDFUDFCheckBox_2.Text = 'UDF-UDF';
            app.UDFUDFCheckBox_2.Position = [180 103 75 22];

            % Create LogSpaceCheckBox_3
            app.LogSpaceCheckBox_3 = uicheckbox(app.StructuralLearningPanel_2);
            app.LogSpaceCheckBox_3.Text = 'Log Space';
            app.LogSpaceCheckBox_3.Position = [180 73 79 22];

            % Create FedEditField_2Label
            app.FedEditField_2Label = uilabel(app.StructuralLearningPanel_2);
            app.FedEditField_2Label.Position = [10 13 26 22];
            app.FedEditField_2Label.Text = 'Fed';

            % Create FedEditField_2
            app.FedEditField_2 = uieditfield(app.StructuralLearningPanel_2, 'text');
            app.FedEditField_2.Position = [69 13 100 22];

            % Create NonNegativeCheckBox_2
            app.NonNegativeCheckBox_2 = uicheckbox(app.StructuralLearningPanel_2);
            app.NonNegativeCheckBox_2.Text = 'Non-Negative';
            app.NonNegativeCheckBox_2.Position = [180 42 95 22];

            % Create GoodBracketCheckBox_2
            app.GoodBracketCheckBox_2 = uicheckbox(app.StructuralLearningPanel_2);
            app.GoodBracketCheckBox_2.Text = 'Good Bracket';
            app.GoodBracketCheckBox_2.Position = [180 12 95 22];

            % Create ParameterEstimationPanel_2
            app.ParameterEstimationPanel_2 = uipanel(app.CrossValidationTab);
            app.ParameterEstimationPanel_2.Title = 'Parameter Estimation';
            app.ParameterEstimationPanel_2.Position = [18 264 441 140];

            % Create VisualizeButtonGroup_5
            app.VisualizeButtonGroup_5 = uibuttongroup(app.ParameterEstimationPanel_2);
            app.VisualizeButtonGroup_5.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_5.Title = 'Visualize';
            app.VisualizeButtonGroup_5.Position = [291 40 132 65];

            % Create ParameterSpaceButton_4
            app.ParameterSpaceButton_4 = uitogglebutton(app.VisualizeButtonGroup_5);
            app.ParameterSpaceButton_4.Text = 'Parameter Space';
            app.ParameterSpaceButton_4.Position = [11 23 109 22];
            app.ParameterSpaceButton_4.Value = true;

            % Create WeightDistributionButton_2
            app.WeightDistributionButton_2 = uitogglebutton(app.VisualizeButtonGroup_5);
            app.WeightDistributionButton_2.Text = 'Weight Distribution';
            app.WeightDistributionButton_2.Position = [11 3 116 22];

            % Create RangeEditField_3000Label
            app.RangeEditField_3000Label = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_3000Label.Position = [10 83 41 22];
            app.RangeEditField_3000Label.Text = 'Range';

            % Create RangeEditField_3000
            app.RangeEditField_3000 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_3000.Position = [69 83 100 22];

            % Create MinEditField_4000Label
            app.MinEditField_4000Label = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_4000Label.Position = [10 53 25 22];
            app.MinEditField_4000Label.Text = 'Min';

            % Create MinEditField_4000
            app.MinEditField_4000 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_4000.Position = [69 53 100 22];

            % Create MaxEditField_4000Label
            app.MaxEditField_4000Label = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_4000Label.Position = [10 23 28 22];
            app.MaxEditField_4000Label.Text = 'Max';

            % Create MaxEditField_4000
            app.MaxEditField_4000 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_4000.Position = [69 23 100 22];

            % Create LogSpaceCheckBox_4
            app.LogSpaceCheckBox_4 = uicheckbox(app.ParameterEstimationPanel_2);
            app.LogSpaceCheckBox_4.Text = 'Log Space';
            app.LogSpaceCheckBox_4.Position = [315 10 79 22];

            % Create RangeEditField_332Label
            app.RangeEditField_332Label = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_332Label.Position = [10 83 41 22];
            app.RangeEditField_332Label.Text = 'Range';

            % Create RangeEditField_332
            app.RangeEditField_332 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_332.Position = [69 83 100 22];

            % Create MinEditField_469Label
            app.MinEditField_469Label = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_469Label.Position = [10 53 25 22];
            app.MinEditField_469Label.Text = 'Min';

            % Create MinEditField_469
            app.MinEditField_469 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_469.Position = [69 53 100 22];

            % Create MaxEditField_469Label
            app.MaxEditField_469Label = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_469Label.Position = [10 23 28 22];
            app.MaxEditField_469Label.Text = 'Max';

            % Create MaxEditField_469
            app.MaxEditField_469 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_469.Position = [69 23 100 22];

            % Create RangeEditField_369Label
            app.RangeEditField_369Label = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_369Label.Position = [10 83 41 22];
            app.RangeEditField_369Label.Text = 'Range';

            % Create RangeEditField_369
            app.RangeEditField_369 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_369.Position = [69 83 100 22];

            % Create MinEditField_432Label
            app.MinEditField_432Label = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_432Label.Position = [10 53 25 22];
            app.MinEditField_432Label.Text = 'Min';

            % Create MinEditField_432
            app.MinEditField_432 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_432.Position = [69 53 100 22];

            % Create MaxEditField_432Label
            app.MaxEditField_432Label = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_432Label.Position = [10 23 28 22];
            app.MaxEditField_432Label.Text = 'Max';

            % Create MaxEditField_432
            app.MaxEditField_432 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_432.Position = [69 23 100 22];

            % Create RangeEditField_3Label6969
            app.RangeEditField_3Label6969 = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_3Label6969.Position = [10 83 41 22];
            app.RangeEditField_3Label6969.Text = 'Range';

            % Create RangeEditField_36969
            app.RangeEditField_36969 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_36969.Position = [69 83 100 22];

            % Create MinEditField_4Label3699
            app.MinEditField_4Label3699 = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_4Label3699.Position = [10 53 25 22];
            app.MinEditField_4Label3699.Text = 'Min';

            % Create MinEditField_43699
            app.MinEditField_43699 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_43699.Position = [69 53 100 22];

            % Create MaxEditField_4Label3699
            app.MaxEditField_4Label3699 = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_4Label3699.Position = [10 23 28 22];
            app.MaxEditField_4Label3699.Text = 'Max';

            % Create MaxEditField_43699
            app.MaxEditField_43699 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_43699.Position = [69 23 100 22];

            % Create RangeEditField_3Label3699
            app.RangeEditField_3Label3699 = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_3Label3699.Position = [10 83 41 22];
            app.RangeEditField_3Label3699.Text = 'Range';

            % Create RangeEditField_3699
            app.RangeEditField_3699 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_3699.Position = [69 83 100 22];

            % Create MinEditField_4Label6969
            app.MinEditField_4Label6969 = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_4Label6969.Position = [10 53 25 22];
            app.MinEditField_4Label6969.Text = 'Min';

            % Create MinEditField_46969
            app.MinEditField_46969 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_46969.Position = [69 53 100 22];

            % Create MaxEditField_4Label6969
            app.MaxEditField_4Label6969 = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_4Label6969.Position = [10 23 28 22];
            app.MaxEditField_4Label6969.Text = 'Max';

            % Create MaxEditField_46969
            app.MaxEditField_46969 = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_46969.Position = [69 23 100 22];

            % Create RangeEditField_3Labelnerd
            app.RangeEditField_3Labelnerd = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_3Labelnerd.Position = [10 83 41 22];
            app.RangeEditField_3Labelnerd.Text = 'Range';

            % Create RangeEditField_3nerd
            app.RangeEditField_3nerd = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_3nerd.Position = [69 83 100 22];

            % Create MinEditField_4Labelxes
            app.MinEditField_4Labelxes = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_4Labelxes.Position = [10 53 25 22];
            app.MinEditField_4Labelxes.Text = 'Min';

            % Create MinEditField_4xes
            app.MinEditField_4xes = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_4xes.Position = [69 53 100 22];

            % Create MaxEditField_4Labelxes
            app.MaxEditField_4Labelxes = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_4Labelxes.Position = [10 23 28 22];
            app.MaxEditField_4Labelxes.Text = 'Max';

            % Create MaxEditField_4xes
            app.MaxEditField_4xes = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_4xes.Position = [69 23 100 22];

            % Create RangeEditField_3Labelsex
            app.RangeEditField_3Labelsex = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_3Labelsex.Position = [10 83 41 22];
            app.RangeEditField_3Labelsex.Text = 'Range';

            % Create RangeEditField_3sex
            app.RangeEditField_3sex = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_3sex.Position = [69 83 100 22];

            % Create MinEditField_4Labelsex
            app.MinEditField_4Labelsex = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_4Labelsex.Position = [10 53 25 22];
            app.MinEditField_4Labelsex.Text = 'Min';

            % Create MinEditField_4sex
            app.MinEditField_4sex = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_4sex.Position = [69 53 100 22];

            % Create MaxEditField_4Labelsex
            app.MaxEditField_4Labelsex = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_4Labelsex.Position = [10 23 28 22];
            app.MaxEditField_4Labelsex.Text = 'Max';

            % Create MaxEditField_4sex
            app.MaxEditField_4sex = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_4sex.Position = [69 23 100 22];

            % Create RangeEditField_3Labeltit
            app.RangeEditField_3Labeltit = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_3Labeltit.Position = [10 83 41 22];
            app.RangeEditField_3Labeltit.Text = 'Range';

            % Create RangeEditField_3tit
            app.RangeEditField_3tit = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_3tit.Position = [69 83 100 22];

            % Create MinEditField_4Labeleggs
            app.MinEditField_4Labeleggs = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_4Labeleggs.Position = [10 53 25 22];
            app.MinEditField_4Labeleggs.Text = 'Min';

            % Create MinEditField_4eggs
            app.MinEditField_4eggs = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_4eggs.Position = [69 53 100 22];

            % Create MaxEditField_4Labeleggs
            app.MaxEditField_4Labeleggs = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_4Labeleggs.Position = [10 23 28 22];
            app.MaxEditField_4Labeleggs.Text = 'Max';

            % Create MaxEditField_4eggs
            app.MaxEditField_4eggs = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_4eggs.Position = [69 23 100 22];

            % Create RangeEditField_3Labeleggs
            app.RangeEditField_3Labeleggs = uilabel(app.ParameterEstimationPanel_2);
            app.RangeEditField_3Labeleggs.Position = [10 83 41 22];
            app.RangeEditField_3Labeleggs.Text = 'Range';

            % Create RangeEditField_3eggs
            app.RangeEditField_3eggs = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.RangeEditField_3eggs.Position = [69 83 100 22];

            % Create MinEditField_4Labelbird
            app.MinEditField_4Labelbird = uilabel(app.ParameterEstimationPanel_2);
            app.MinEditField_4Labelbird.Position = [10 53 25 22];
            app.MinEditField_4Labelbird.Text = 'Min';

            % Create MinEditField_4bird
            app.MinEditField_4bird = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MinEditField_4bird.Position = [69 53 100 22];

            % Create MaxEditField_4Labelbird
            app.MaxEditField_4Labelbird = uilabel(app.ParameterEstimationPanel_2);
            app.MaxEditField_4Labelbird.Position = [10 23 28 22];
            app.MaxEditField_4Labelbird.Text = 'Max';

            % Create MaxEditField_4bird
            app.MaxEditField_4bird = uieditfield(app.ParameterEstimationPanel_2, 'text');
            app.MaxEditField_4bird.Position = [69 23 100 22];

            % Create TestingLikelihoodPanel
            app.TestingLikelihoodPanel = uipanel(app.CrossValidationTab);
            app.TestingLikelihoodPanel.Title = 'Testing Likelihood';
            app.TestingLikelihoodPanel.Position = [18 84 441 153];

            % Create VisualizeButtonGroup_6
            app.VisualizeButtonGroup_6 = uibuttongroup(app.TestingLikelihoodPanel);
            app.VisualizeButtonGroup_6.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_6.Title = 'Visualize';
            app.VisualizeButtonGroup_6.Position = [192 12 232 106];

            % Create sLambdavsTestingButton
            app.sLambdavsTestingButton = uitogglebutton(app.VisualizeButtonGroup_6);
            app.sLambdavsTestingButton.Text = 'sLambda vs. Testing';
            app.sLambdavsTestingButton.Position = [14 53 203 22];
            app.sLambdavsTestingButton.Value = true;

            % Create pLambdavsTestingButton
            app.pLambdavsTestingButton = uitogglebutton(app.VisualizeButtonGroup_6);
            app.pLambdavsTestingButton.Text = 'pLambda vs. Testing';
            app.pLambdavsTestingButton.Position = [14 32 203 22];

            % Create sLambdavspLambdavsTestingButton
            app.sLambdavspLambdavsTestingButton = uitogglebutton(app.VisualizeButtonGroup_6);
            app.sLambdavspLambdavsTestingButton.Text = 'sLambda vs. pLambda vs. Testing';
            app.sLambdavspLambdavsTestingButton.Position = [17 11 198 22];

            % Create MinEditField_400Label
            app.MinEditField_400Label = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_400Label.Position = [10 93 25 22];
            app.MinEditField_400Label.Text = 'Min';

            % Create MinEditField_400
            app.MinEditField_400 = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_400.Position = [69 93 100 22];

            % Create MaxEditField_400Label
            app.MaxEditField_400Label = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_400Label.Position = [10 63 28 22];
            app.MaxEditField_400Label.Text = 'Max';

            % Create MaxEditField_400
            app.MaxEditField_400 = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_400.Position = [69 63 100 22];

            % Create MeanEditField_2Label
            app.MeanEditField_2Label = uilabel(app.TestingLikelihoodPanel);
            app.MeanEditField_2Label.Position = [10 33 36 22];
            app.MeanEditField_2Label.Text = 'Mean';

            % Create MeanEditField_2000
            app.MeanEditField_2000 = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MeanEditField_2000.Position = [69 33 100 22];

            % Create MinEditField_4Label5
            app.MinEditField_4Label5 = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4Label5.Position = [10 93 25 22];
            app.MinEditField_4Label5.Text = 'Min';

            % Create MinEditField_45
            app.MinEditField_45 = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_45.Position = [69 93 100 22];

            % Create MaxEditField_4Label5
            app.MaxEditField_4Label5 = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4Label5.Position = [10 63 28 22];
            app.MaxEditField_4Label5.Text = 'Max';

            % Create MaxEditField_45
            app.MaxEditField_45 = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_45.Position = [69 63 100 22];

            % Create MinEditField_4gLabel
            app.MinEditField_4gLabel = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4gLabel.Position = [10 93 25 22];
            app.MinEditField_4gLabel.Text = 'Min';

            % Create MinEditField_4g
            app.MinEditField_4g = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_4g.Position = [69 93 100 22];

            % Create MaxEditField_4gLabel
            app.MaxEditField_4gLabel = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4gLabel.Position = [10 63 28 22];
            app.MaxEditField_4gLabel.Text = 'Max';

            % Create MaxEditField_4g
            app.MaxEditField_4g = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_4g.Position = [69 63 100 22];

            % Create MinEditField_4Labelaaa
            app.MinEditField_4Labelaaa = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4Labelaaa.Position = [10 93 25 22];
            app.MinEditField_4Labelaaa.Text = 'Min';

            % Create MinEditField_4aaa
            app.MinEditField_4aaa = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_4aaa.Position = [69 93 100 22];

            % Create MaxEditField_4Labelaaa
            app.MaxEditField_4Labelaaa = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4Labelaaa.Position = [10 63 28 22];
            app.MaxEditField_4Labelaaa.Text = 'Max';

            % Create MaxEditField_4aaa
            app.MaxEditField_4aaa = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_4aaa.Position = [69 63 100 22];

            % Create MinEditField_4Labelzzz
            app.MinEditField_4Labelzzz = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4Labelzzz.Position = [10 93 25 22];
            app.MinEditField_4Labelzzz.Text = 'Min';

            % Create MinEditField_4zzz
            app.MinEditField_4zzz = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_4zzz.Position = [69 93 100 22];

            % Create MaxEditField_4Labelzzz
            app.MaxEditField_4Labelzzz = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4Labelzzz.Position = [10 63 28 22];
            app.MaxEditField_4Labelzzz.Text = 'Max';

            % Create MaxEditField_4zzz
            app.MaxEditField_4zzz = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_4zzz.Position = [69 63 100 22];

            % Create MinEditField_4Labeltoo
            app.MinEditField_4Labeltoo = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4Labeltoo.Position = [10 93 25 22];
            app.MinEditField_4Labeltoo.Text = 'Min';

            % Create MinEditField_4too
            app.MinEditField_4too = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_4too.Position = [69 93 100 22];

            % Create MaxEditField_4Labeltoo
            app.MaxEditField_4Labeltoo = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4Labeltoo.Position = [10 63 28 22];
            app.MaxEditField_4Labeltoo.Text = 'Max';

            % Create MaxEditField_4too
            app.MaxEditField_4too = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_4too.Position = [69 63 100 22];

            % Create MinEditField_4Labelnut
            app.MinEditField_4Labelnut = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4Labelnut.Position = [10 93 25 22];
            app.MinEditField_4Labelnut.Text = 'Min';

            % Create MinEditField_4nut
            app.MinEditField_4nut = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_4nut.Position = [69 93 100 22];

            % Create MaxEditField_4Labelnut
            app.MaxEditField_4Labelnut = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4Labelnut.Position = [10 63 28 22];
            app.MaxEditField_4Labelnut.Text = 'Max';

            % Create MaxEditField_4nut
            app.MaxEditField_4nut = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_4nut.Position = [69 63 100 22];

            % Create MinEditField_4Labelgreen
            app.MinEditField_4Labelgreen = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4Labelgreen.Position = [10 93 25 22];
            app.MinEditField_4Labelgreen.Text = 'Min';

            % Create MinEditField_4green
            app.MinEditField_4green = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_4green.Position = [69 93 100 22];

            % Create MaxEditField_4Labelnlue
            app.MaxEditField_4Labelnlue = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4Labelnlue.Position = [10 63 28 22];
            app.MaxEditField_4Labelnlue.Text = 'Max';

            % Create MaxEditField_4blue
            app.MaxEditField_4blue = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_4blue.Position = [69 63 100 22];

            % Create MinEditField_4Labelred
            app.MinEditField_4Labelred = uilabel(app.TestingLikelihoodPanel);
            app.MinEditField_4Labelred.Position = [10 93 25 22];
            app.MinEditField_4Labelred.Text = 'Min';

            % Create MinEditField_4red
            app.MinEditField_4red = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MinEditField_4red.Position = [69 93 100 22];

            % Create MaxEditField_4Labelred
            app.MaxEditField_4Labelred = uilabel(app.TestingLikelihoodPanel);
            app.MaxEditField_4Labelred.Position = [10 63 28 22];
            app.MaxEditField_4Labelred.Text = 'Max';

            % Create MaxEditField_4red
            app.MaxEditField_4red = uieditfield(app.TestingLikelihoodPanel, 'text');
            app.MaxEditField_4red.Position = [69 63 100 22];

            % Create ExportTableButton_2
            app.ExportTableButton_2 = uibutton(app.CrossValidationTab, 'push');
            app.ExportTableButton_2.Position = [90 31 100 22];
            app.ExportTableButton_2.Text = 'Export Table';

            % Create ExportFigureButton_2
            app.ExportFigureButton_2 = uibutton(app.CrossValidationTab, 'push');
            app.ExportFigureButton_2.Position = [276 31 100 22];
            app.ExportFigureButton_2.Text = 'Export Figure';

            % Create ModelSelectionTab
            app.ModelSelectionTab = uitab(app.OptimizationSubTabs);
            app.ModelSelectionTab.Title = 'Model Selection';

            % Create TotalLikelihoodPanel
            app.TotalLikelihoodPanel = uipanel(app.ModelSelectionTab);
            app.TotalLikelihoodPanel.Title = 'Total Likelihood';
            app.TotalLikelihoodPanel.Position = [15 160 441 263];

            % Create VisualizeButtonGroup_9
            app.VisualizeButtonGroup_9 = uibuttongroup(app.TotalLikelihoodPanel);
            app.VisualizeButtonGroup_9.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_9.Title = 'Visualize';
            app.VisualizeButtonGroup_9.Position = [191 22 232 207];

            % Create sLambdavsTrainingButton_2
            app.sLambdavsTrainingButton_2 = uitogglebutton(app.VisualizeButtonGroup_9);
            app.sLambdavsTrainingButton_2.Text = 'sLambda vs. Training';
            app.sLambdavsTrainingButton_2.Position = [14 154 203 22];
            app.sLambdavsTrainingButton_2.Value = true;

            % Create pLambdavsTrainingButton_4
            app.pLambdavsTrainingButton_4 = uitogglebutton(app.VisualizeButtonGroup_9);
            app.pLambdavsTrainingButton_4.Text = 'pLambda vs. Training';
            app.pLambdavsTrainingButton_4.Position = [14 133 203 22];

            % Create sLambdavspLambdavsTrainingButton_2
            app.sLambdavspLambdavsTrainingButton_2 = uitogglebutton(app.VisualizeButtonGroup_9);
            app.sLambdavspLambdavsTrainingButton_2.Text = 'sLambda vs. pLambda vs. Training';
            app.sLambdavspLambdavsTrainingButton_2.Position = [14 112 203 22];

            % Create sLambdavspLambdavsWeightedButton
            app.sLambdavspLambdavsWeightedButton = uitogglebutton(app.VisualizeButtonGroup_9);
            app.sLambdavspLambdavsWeightedButton.Text = 'sLambda vs. pLambda vs. Weighted';
            app.sLambdavspLambdavsWeightedButton.Position = [10 28 210 22];

            % Create HyperparametersvsLikelihood4DButton
            app.HyperparametersvsLikelihood4DButton = uitogglebutton(app.VisualizeButtonGroup_9);
            app.HyperparametersvsLikelihood4DButton.Text = 'Hyperparameters vs. Likelihood (4D)';
            app.HyperparametersvsLikelihood4DButton.Position = [11 7 212 22];

            % Create sLambdavspLambdavsTestingButton_2
            app.sLambdavspLambdavsTestingButton_2 = uitogglebutton(app.VisualizeButtonGroup_9);
            app.sLambdavspLambdavsTestingButton_2.Text = 'sLambda vs. pLambda vs. Testing';
            app.sLambdavspLambdavsTestingButton_2.Position = [18 49 198 22];

            % Create sLambdavsTestingButton_2
            app.sLambdavsTestingButton_2 = uitogglebutton(app.VisualizeButtonGroup_9);
            app.sLambdavsTestingButton_2.Text = 'sLambda vs. Testing';
            app.sLambdavsTestingButton_2.Position = [14 91 203 22];

            % Create pLambdavsTestingButton_3
            app.pLambdavsTestingButton_3 = uitogglebutton(app.VisualizeButtonGroup_9);
            app.pLambdavsTestingButton_3.Text = 'pLambda vs. Testing';
            app.pLambdavsTestingButton_3.Position = [15 70 203 22];

            % Create MinEditField_5Label
            app.MinEditField_5Label = uilabel(app.TotalLikelihoodPanel);
            app.MinEditField_5Label.Position = [10 203 25 22];
            app.MinEditField_5Label.Text = 'Min';

            % Create MinEditField_5
            app.MinEditField_5 = uieditfield(app.TotalLikelihoodPanel, 'text');
            app.MinEditField_5.Position = [69 203 100 22];

            % Create MaxEditField_5Label
            app.MaxEditField_5Label = uilabel(app.TotalLikelihoodPanel);
            app.MaxEditField_5Label.Position = [10 173 28 22];
            app.MaxEditField_5Label.Text = 'Max';

            % Create MaxEditField_5
            app.MaxEditField_5 = uieditfield(app.TotalLikelihoodPanel, 'text');
            app.MaxEditField_5.Position = [69 173 100 22];

            % Create MeanEditField_3Label
            app.MeanEditField_3Label = uilabel(app.TotalLikelihoodPanel);
            app.MeanEditField_3Label.Position = [10 143 36 22];
            app.MeanEditField_3Label.Text = 'Mean';

            % Create MeanEditField_3
            app.MeanEditField_3 = uieditfield(app.TotalLikelihoodPanel, 'text');
            app.MeanEditField_3.Position = [69 143 100 22];

            % Create WeightingSliderLabel
            app.WeightingSliderLabel = uilabel(app.TotalLikelihoodPanel);
            app.WeightingSliderLabel.HorizontalAlignment = 'right';
            app.WeightingSliderLabel.Position = [10 76 59 22];
            app.WeightingSliderLabel.Text = 'Weighting';

            % Create WeightingSlider
            app.WeightingSlider = uislider(app.TotalLikelihoodPanel);
            app.WeightingSlider.Position = [90 85 75 3];

            % Create ExportTableButton_3
            app.ExportTableButton_3 = uibutton(app.ModelSelectionTab, 'push');
            app.ExportTableButton_3.Position = [18 21 100 22];
            app.ExportTableButton_3.Text = 'Export Table';

            % Create ExportFigureButton_3
            app.ExportFigureButton_3 = uibutton(app.ModelSelectionTab, 'push');
            app.ExportFigureButton_3.Position = [191 21 100 22];
            app.ExportFigureButton_3.Text = 'Export Figure';

            % Create kFoldsValidationPanel
            app.kFoldsValidationPanel = uipanel(app.ModelSelectionTab);
            app.kFoldsValidationPanel.Title = 'k-Folds Validation                   ';
            app.kFoldsValidationPanel.Position = [15 439 441 186];

            % Create MaxEditField_5Label_2
            app.MaxEditField_5Label_2 = uilabel(app.kFoldsValidationPanel);
            app.MaxEditField_5Label_2.Position = [13 47 28 22];
            app.MaxEditField_5Label_2.Text = 'Max';

            % Create MaxEditField_6
            app.MaxEditField_6 = uieditfield(app.kFoldsValidationPanel, 'text');
            app.MaxEditField_6.Position = [72 47 100 22];

            % Create MeanEditField_3Label_2
            app.MeanEditField_3Label_2 = uilabel(app.kFoldsValidationPanel);
            app.MeanEditField_3Label_2.Position = [13 17 36 22];
            app.MeanEditField_3Label_2.Text = 'Mean';

            % Create MeanEditField_4
            app.MeanEditField_4 = uieditfield(app.kFoldsValidationPanel, 'text');
            app.MeanEditField_4.Position = [72 17 100 22];

            % Create MinEditField_6Label
            app.MinEditField_6Label = uilabel(app.kFoldsValidationPanel);
            app.MinEditField_6Label.Position = [13 77 25 22];
            app.MinEditField_6Label.Text = 'Min';

            % Create MinEditField_6
            app.MinEditField_6 = uieditfield(app.kFoldsValidationPanel, 'text');
            app.MinEditField_6.Position = [72 77 100 22];

            % Create FoldSizeSliderLabel
            app.FoldSizeSliderLabel = uilabel(app.kFoldsValidationPanel);
            app.FoldSizeSliderLabel.HorizontalAlignment = 'right';
            app.FoldSizeSliderLabel.Position = [16 132 56 22];
            app.FoldSizeSliderLabel.Text = 'Fold Size';

            % Create FoldSizeSlider
            app.FoldSizeSlider = uislider(app.kFoldsValidationPanel);
            app.FoldSizeSlider.Position = [93 141 66 3];

            % Create VisualizeButtonGroup_10
            app.VisualizeButtonGroup_10 = uibuttongroup(app.kFoldsValidationPanel);
            app.VisualizeButtonGroup_10.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_10.Title = 'Visualize';
            app.VisualizeButtonGroup_10.Position = [193 10 232 146];

            % Create sLambdavsLikelihoodButton
            app.sLambdavsLikelihoodButton = uitogglebutton(app.VisualizeButtonGroup_10);
            app.sLambdavsLikelihoodButton.Text = 'sLambda vs. Likelihood';
            app.sLambdavsLikelihoodButton.Position = [14 93 203 22];
            app.sLambdavsLikelihoodButton.Value = true;

            % Create pLambdavsLikelihoodButton
            app.pLambdavsLikelihoodButton = uitogglebutton(app.VisualizeButtonGroup_10);
            app.pLambdavsLikelihoodButton.Text = 'pLambda vs. Likelihood';
            app.pLambdavsLikelihoodButton.Position = [14 72 203 22];

            % Create sLambdavspLambdavsLikelihoodButton
            app.sLambdavspLambdavsLikelihoodButton = uitogglebutton(app.VisualizeButtonGroup_10);
            app.sLambdavspLambdavsLikelihoodButton.Text = 'sLambda vs. pLambda vs. Likelihood';
            app.sLambdavspLambdavsLikelihoodButton.Position = [9 51 214 22];

            % Create BestModelLikelihoodDistributionButton
            app.BestModelLikelihoodDistributionButton = uitogglebutton(app.VisualizeButtonGroup_10);
            app.BestModelLikelihoodDistributionButton.Text = 'Best Model Likelihood Distribution';
            app.BestModelLikelihoodDistributionButton.Position = [18 30 197 22];

            % Create SpecificModelLikelihoodDistributionButton
            app.SpecificModelLikelihoodDistributionButton = uitogglebutton(app.VisualizeButtonGroup_10);
            app.SpecificModelLikelihoodDistributionButton.Text = 'Specific Model Likelihood Distribution';
            app.SpecificModelLikelihoodDistributionButton.Position = [10 7 215 22];

            % Create ExportSelectionButton
            app.ExportSelectionButton = uibutton(app.ModelSelectionTab, 'push');
            app.ExportSelectionButton.Position = [356 21 103 22];
            app.ExportSelectionButton.Text = 'Export Selection';

            % Create Panel
            app.Panel = uipanel(app.ModelSelectionTab);
            app.Panel.Position = [15 63 441 77];

            % Create BestModelIDEditFieldLabel
            app.BestModelIDEditFieldLabel = uilabel(app.Panel);
            app.BestModelIDEditFieldLabel.HorizontalAlignment = 'center';
            app.BestModelIDEditFieldLabel.FontSize = 16;
            app.BestModelIDEditFieldLabel.Position = [8 45 192 22];
            app.BestModelIDEditFieldLabel.Text = 'Best Model ID';

            % Create BestModelIDEditField
            app.BestModelIDEditField = uieditfield(app.Panel, 'numeric');
            app.BestModelIDEditField.HorizontalAlignment = 'center';
            app.BestModelIDEditField.FontSize = 16;
            app.BestModelIDEditField.Position = [226 45 193 22];

            % Create SelectSpecificModelEditFieldLabel
            app.SelectSpecificModelEditFieldLabel = uilabel(app.Panel);
            app.SelectSpecificModelEditFieldLabel.HorizontalAlignment = 'center';
            app.SelectSpecificModelEditFieldLabel.FontSize = 16;
            app.SelectSpecificModelEditFieldLabel.Position = [9 15 192 22];
            app.SelectSpecificModelEditFieldLabel.Text = 'Select Specific Model';

            % Create SelectSpecificModelEditField
            app.SelectSpecificModelEditField = uieditfield(app.Panel, 'numeric');
            app.SelectSpecificModelEditField.HorizontalAlignment = 'center';
            app.SelectSpecificModelEditField.FontSize = 16;
            app.SelectSpecificModelEditField.Position = [226 15 194 22];

            % Create OptimizationAxes
            app.OptimizationAxes = uiaxes(app.OptimizationTab);
            title(app.OptimizationAxes, 'Optimization Plot')
            xlabel(app.OptimizationAxes, 'H')
            ylabel(app.OptimizationAxes, 'Y')
            zlabel(app.OptimizationAxes, {'ZHZ'; ''})
            app.OptimizationAxes.Position = [561 35 1180 665];

            % Create ResultsTab
            app.ResultsTab = uitab(app.TabGroup);
            app.ResultsTab.Title = 'Results';

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.ResultsTab);
            app.TabGroup3.Position = [37 31 495 664];

            % Create GlobalTab
            app.GlobalTab = uitab(app.TabGroup3);
            app.GlobalTab.Title = 'Global';

            % Create VisualizeButtonGroup_13
            app.VisualizeButtonGroup_13 = uibuttongroup(app.GlobalTab);
            app.VisualizeButtonGroup_13.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_13.Title = 'Visualize';
            app.VisualizeButtonGroup_13.Position = [231 420 232 189];

            % Create IdentityOverlayButton_3
            app.IdentityOverlayButton_3 = uitogglebutton(app.VisualizeButtonGroup_13);
            app.IdentityOverlayButton_3.Text = 'Identity Overlay';
            app.IdentityOverlayButton_3.Position = [9 136 212 22];
            app.IdentityOverlayButton_3.Value = true;

            % Create StructureButton
            app.StructureButton = uitogglebutton(app.VisualizeButtonGroup_13);
            app.StructureButton.Text = 'Structure';
            app.StructureButton.Position = [11 117 212 22];

            % Create FunctionalConnectivityButton
            app.FunctionalConnectivityButton = uitogglebutton(app.VisualizeButtonGroup_13);
            app.FunctionalConnectivityButton.Text = 'Functional Connectivity';
            app.FunctionalConnectivityButton.Position = [11 97 212 22];

            % Create OvercompletionButton
            app.OvercompletionButton = uitogglebutton(app.VisualizeButtonGroup_13);
            app.OvercompletionButton.Text = 'Overcompletion';
            app.OvercompletionButton.Position = [11 77 212 22];

            % Create FrameFrameLikelihoodButton
            app.FrameFrameLikelihoodButton = uitogglebutton(app.VisualizeButtonGroup_13);
            app.FrameFrameLikelihoodButton.Text = 'Frame/Frame Likelihood';
            app.FrameFrameLikelihoodButton.Position = [11 57 212 22];

            % Create ExportTableButton_6
            app.ExportTableButton_6 = uibutton(app.GlobalTab, 'push');
            app.ExportTableButton_6.Position = [86 14 100 22];
            app.ExportTableButton_6.Text = 'Export Table';

            % Create ExportFigureButton_6
            app.ExportFigureButton_6 = uibutton(app.GlobalTab, 'push');
            app.ExportFigureButton_6.Position = [323 14 100 22];
            app.ExportFigureButton_6.Text = 'Export Figure';

            % Create StimuliTab
            app.StimuliTab = uitab(app.TabGroup3);
            app.StimuliTab.Title = 'Stimuli';

            % Create TabGroup4
            app.TabGroup4 = uitabgroup(app.StimuliTab);
            app.TabGroup4.Position = [0 0 495 579];

            % Create EnsembleTab
            app.EnsembleTab = uitab(app.TabGroup4);
            app.EnsembleTab.Title = 'Ensemble';

            % Create PredictionPerformancePanel
            app.PredictionPerformancePanel = uipanel(app.EnsembleTab);
            app.PredictionPerformancePanel.Title = 'Prediction Performance';
            app.PredictionPerformancePanel.FontSize = 16;
            app.PredictionPerformancePanel.Position = [18 46 454 290];

            % Create TruePositiveEditFieldLabel
            app.TruePositiveEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.TruePositiveEditFieldLabel.HorizontalAlignment = 'right';
            app.TruePositiveEditFieldLabel.Position = [22 226 75 22];
            app.TruePositiveEditFieldLabel.Text = 'True Positive';

            % Create TruePositiveEditField
            app.TruePositiveEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.TruePositiveEditField.Position = [112 226 100 22];

            % Create FalsePositiveEditFieldLabel
            app.FalsePositiveEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.FalsePositiveEditFieldLabel.HorizontalAlignment = 'right';
            app.FalsePositiveEditFieldLabel.Position = [17 192 80 22];
            app.FalsePositiveEditFieldLabel.Text = 'False Positive';

            % Create FalsePositiveEditField
            app.FalsePositiveEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.FalsePositiveEditField.Position = [112 192 100 22];

            % Create TrueNegativeEditFieldLabel
            app.TrueNegativeEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.TrueNegativeEditFieldLabel.HorizontalAlignment = 'right';
            app.TrueNegativeEditFieldLabel.Position = [16 154 80 22];
            app.TrueNegativeEditFieldLabel.Text = 'True Negative';

            % Create TrueNegativeEditField
            app.TrueNegativeEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.TrueNegativeEditField.Position = [111 154 100 22];

            % Create FalseNegativeEditFieldLabel
            app.FalseNegativeEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.FalseNegativeEditFieldLabel.HorizontalAlignment = 'right';
            app.FalseNegativeEditFieldLabel.Position = [10 119 86 22];
            app.FalseNegativeEditFieldLabel.Text = 'False Negative';

            % Create FalseNegativeEditField
            app.FalseNegativeEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.FalseNegativeEditField.Position = [111 119 100 22];

            % Create AUCROCEditFieldLabel
            app.AUCROCEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.AUCROCEditFieldLabel.HorizontalAlignment = 'right';
            app.AUCROCEditFieldLabel.Position = [252 226 69 22];
            app.AUCROCEditFieldLabel.Text = 'AUC (ROC)';

            % Create AUCROCEditField
            app.AUCROCEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.AUCROCEditField.Position = [336 226 100 22];

            % Create SpecificityEditFieldLabel
            app.SpecificityEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.SpecificityEditFieldLabel.HorizontalAlignment = 'right';
            app.SpecificityEditFieldLabel.Position = [261 192 60 22];
            app.SpecificityEditFieldLabel.Text = 'Specificity';

            % Create SpecificityEditField
            app.SpecificityEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.SpecificityEditField.Position = [336 192 100 22];

            % Create SensitivityEditFieldLabel
            app.SensitivityEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.SensitivityEditFieldLabel.HorizontalAlignment = 'right';
            app.SensitivityEditFieldLabel.Position = [260 154 60 22];
            app.SensitivityEditFieldLabel.Text = 'Sensitivity';

            % Create SensitivityEditField
            app.SensitivityEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.SensitivityEditField.Position = [335 154 100 22];

            % Create AccuracyEditFieldLabel
            app.AccuracyEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.AccuracyEditFieldLabel.HorizontalAlignment = 'right';
            app.AccuracyEditFieldLabel.Position = [265 119 55 22];
            app.AccuracyEditFieldLabel.Text = 'Accuracy';

            % Create AccuracyEditField
            app.AccuracyEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.AccuracyEditField.Position = [335 119 100 22];

            % Create EditField_11Label_2
            app.EditField_11Label_2 = uilabel(app.PredictionPerformancePanel);
            app.EditField_11Label_2.HorizontalAlignment = 'right';
            app.EditField_11Label_2.Position = [265 82 55 22];
            app.EditField_11Label_2.Text = 'Precision';

            % Create EditField_12
            app.EditField_12 = uieditfield(app.PredictionPerformancePanel, 'text');
            app.EditField_12.Position = [335 82 100 22];

            % Create FalseNegativeEditFieldLabel_2
            app.FalseNegativeEditFieldLabel_2 = uilabel(app.PredictionPerformancePanel);
            app.FalseNegativeEditFieldLabel_2.HorizontalAlignment = 'right';
            app.FalseNegativeEditFieldLabel_2.Position = [7 81 89 22];
            app.FalseNegativeEditFieldLabel_2.Text = 'Operating Point';

            % Create FalseNegativeEditField_2
            app.FalseNegativeEditField_2 = uieditfield(app.PredictionPerformancePanel, 'text');
            app.FalseNegativeEditField_2.Position = [111 81 100 22];

            % Create FalseNegativeEditFieldLabel_3
            app.FalseNegativeEditFieldLabel_3 = uilabel(app.PredictionPerformancePanel);
            app.FalseNegativeEditFieldLabel_3.HorizontalAlignment = 'right';
            app.FalseNegativeEditFieldLabel_3.Position = [37 44 59 22];
            app.FalseNegativeEditFieldLabel_3.Text = 'Threshold';

            % Create FalseNegativeEditField_3
            app.FalseNegativeEditField_3 = uieditfield(app.PredictionPerformancePanel, 'text');
            app.FalseNegativeEditField_3.Position = [111 44 100 22];

            % Create FalseNegativeEditFieldLabel_4
            app.FalseNegativeEditFieldLabel_4 = uilabel(app.PredictionPerformancePanel);
            app.FalseNegativeEditFieldLabel_4.HorizontalAlignment = 'right';
            app.FalseNegativeEditFieldLabel_4.Position = [290 43 30 22];
            app.FalseNegativeEditFieldLabel_4.Text = 'Miss';

            % Create FalseNegativeEditField_4
            app.FalseNegativeEditField_4 = uieditfield(app.PredictionPerformancePanel, 'text');
            app.FalseNegativeEditField_4.Position = [335 43 100 22];

            % Create CalculateButton
            app.CalculateButton = uibutton(app.PredictionPerformancePanel, 'push');
            app.CalculateButton.Position = [16 12 194 22];
            app.CalculateButton.Text = 'Calculate';

            % Create AlphaEditFieldLabel
            app.AlphaEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.AlphaEditFieldLabel.HorizontalAlignment = 'right';
            app.AlphaEditFieldLabel.Position = [366 10 36 22];
            app.AlphaEditFieldLabel.Text = 'Alpha';

            % Create AlphaEditField
            app.AlphaEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.AlphaEditField.Position = [407 10 27 22];

            % Create ConfInterCheckBox
            app.ConfInterCheckBox = uicheckbox(app.PredictionPerformancePanel);
            app.ConfInterCheckBox.Text = 'Conf. Inter.';
            app.ConfInterCheckBox.Position = [275 12 78 22];

            % Create VisualizeButtonGroup_11
            app.VisualizeButtonGroup_11 = uibuttongroup(app.EnsembleTab);
            app.VisualizeButtonGroup_11.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_11.Title = 'Visualize';
            app.VisualizeButtonGroup_11.Position = [238 348 232 189];

            % Create IdentityOverlayButton
            app.IdentityOverlayButton = uitogglebutton(app.VisualizeButtonGroup_11);
            app.IdentityOverlayButton.Text = 'Identity Overlay';
            app.IdentityOverlayButton.Position = [9 136 212 22];
            app.IdentityOverlayButton.Value = true;

            % Create RecieverOperatingCharacteristicButton
            app.RecieverOperatingCharacteristicButton = uitogglebutton(app.VisualizeButtonGroup_11);
            app.RecieverOperatingCharacteristicButton.Text = 'Reciever Operating Characteristic';
            app.RecieverOperatingCharacteristicButton.Position = [9 115 213 22];

            % Create ROCAllStimuliButton
            app.ROCAllStimuliButton = uitogglebutton(app.VisualizeButtonGroup_11);
            app.ROCAllStimuliButton.Text = 'ROC (All Stimuli)';
            app.ROCAllStimuliButton.Position = [9 94 214 22];

            % Create ROCAllEnsemblesButton
            app.ROCAllEnsemblesButton = uitogglebutton(app.VisualizeButtonGroup_11);
            app.ROCAllEnsemblesButton.Text = 'ROC (All Ensembles)';
            app.ROCAllEnsemblesButton.Position = [8 73 216 22];

            % Create ROCOptimalSizeButton
            app.ROCOptimalSizeButton = uitogglebutton(app.VisualizeButtonGroup_11);
            app.ROCOptimalSizeButton.Text = 'ROC (Optimal Size)';
            app.ROCOptimalSizeButton.Position = [9 50 215 22];

            % Create RasterContinousButton
            app.RasterContinousButton = uitogglebutton(app.VisualizeButtonGroup_11);
            app.RasterContinousButton.Text = 'Raster (Continous)';
            app.RasterContinousButton.Position = [9 31 215 22];

            % Create RasterBinaryButton
            app.RasterBinaryButton = uitogglebutton(app.VisualizeButtonGroup_11);
            app.RasterBinaryButton.Text = 'Raster (Binary)';
            app.RasterBinaryButton.Position = [9 8 215 22];

            % Create ExportTableButton_4
            app.ExportTableButton_4 = uibutton(app.EnsembleTab, 'push');
            app.ExportTableButton_4.Position = [86 14 100 22];
            app.ExportTableButton_4.Text = 'Export Table';

            % Create ExportFigureButton_4
            app.ExportFigureButton_4 = uibutton(app.EnsembleTab, 'push');
            app.ExportFigureButton_4.Position = [323 14 100 22];
            app.ExportFigureButton_4.Text = 'Export Figure';

            % Create LabelEditFieldLabel
            app.LabelEditFieldLabel = uilabel(app.EnsembleTab);
            app.LabelEditFieldLabel.HorizontalAlignment = 'right';
            app.LabelEditFieldLabel.Position = [31 516 35 22];

            % Create LabelEditField
            app.LabelEditField = uieditfield(app.EnsembleTab, 'text');
            app.LabelEditField.Position = [81 516 124 22];

            % Create IndexTextAreaLabel
            app.IndexTextAreaLabel = uilabel(app.EnsembleTab);
            app.IndexTextAreaLabel.HorizontalAlignment = 'right';
            app.IndexTextAreaLabel.Position = [22 480 35 22];
            app.IndexTextAreaLabel.Text = 'Index';

            % Create IndexTextArea
            app.IndexTextArea = uitextarea(app.EnsembleTab);
            app.IndexTextArea.Position = [72 444 133 60];

            % Create UniqueTextAreaLabel
            app.UniqueTextAreaLabel = uilabel(app.EnsembleTab);
            app.UniqueTextAreaLabel.HorizontalAlignment = 'right';
            app.UniqueTextAreaLabel.Position = [13 403 44 22];
            app.UniqueTextAreaLabel.Text = 'Unique';

            % Create UniqueTextArea
            app.UniqueTextArea = uitextarea(app.EnsembleTab);
            app.UniqueTextArea.Position = [72 367 133 60];

            % Create PatternCompletionTab
            app.PatternCompletionTab = uitab(app.TabGroup4);
            app.PatternCompletionTab.Title = 'Pattern Completion';

            % Create NeuronStatisticsPanel
            app.NeuronStatisticsPanel = uipanel(app.PatternCompletionTab);
            app.NeuronStatisticsPanel.Title = 'Neuron Statistics';
            app.NeuronStatisticsPanel.FontSize = 16;
            app.NeuronStatisticsPanel.Position = [16 46 454 218];

            % Create AUCROCEditField_2Label
            app.AUCROCEditField_2Label = uilabel(app.NeuronStatisticsPanel);
            app.AUCROCEditField_2Label.HorizontalAlignment = 'right';
            app.AUCROCEditField_2Label.Position = [252 154 69 22];
            app.AUCROCEditField_2Label.Text = 'AUC (ROC)';

            % Create AUCROCEditField_2
            app.AUCROCEditField_2 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.AUCROCEditField_2.Position = [336 154 100 22];

            % Create SpecificityEditField_2Label
            app.SpecificityEditField_2Label = uilabel(app.NeuronStatisticsPanel);
            app.SpecificityEditField_2Label.HorizontalAlignment = 'right';
            app.SpecificityEditField_2Label.Position = [261 120 60 22];
            app.SpecificityEditField_2Label.Text = 'Specificity';

            % Create SpecificityEditField_2
            app.SpecificityEditField_2 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.SpecificityEditField_2.Position = [336 120 100 22];

            % Create SensitivityEditField_2Label
            app.SensitivityEditField_2Label = uilabel(app.NeuronStatisticsPanel);
            app.SensitivityEditField_2Label.HorizontalAlignment = 'right';
            app.SensitivityEditField_2Label.Position = [260 82 60 22];
            app.SensitivityEditField_2Label.Text = 'Sensitivity';

            % Create SensitivityEditField_2
            app.SensitivityEditField_2 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.SensitivityEditField_2.Position = [335 82 100 22];

            % Create AccuracyEditField_2Label
            app.AccuracyEditField_2Label = uilabel(app.NeuronStatisticsPanel);
            app.AccuracyEditField_2Label.HorizontalAlignment = 'right';
            app.AccuracyEditField_2Label.Position = [265 47 55 22];
            app.AccuracyEditField_2Label.Text = 'Accuracy';

            % Create AccuracyEditField_2
            app.AccuracyEditField_2 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.AccuracyEditField_2.Position = [335 47 100 22];

            % Create CalculateButton_2
            app.CalculateButton_2 = uibutton(app.NeuronStatisticsPanel, 'push');
            app.CalculateButton_2.Position = [17 10 194 22];
            app.CalculateButton_2.Text = 'Calculate';

            % Create AUCROCEditField_2Label_2
            app.AUCROCEditField_2Label_2 = uilabel(app.NeuronStatisticsPanel);
            app.AUCROCEditField_2Label_2.HorizontalAlignment = 'right';
            app.AUCROCEditField_2Label_2.Position = [11 154 77 22];
            app.AUCROCEditField_2Label_2.Text = 'Node Degree';

            % Create AUCROCEditField_3
            app.AUCROCEditField_3 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.AUCROCEditField_3.Position = [103 154 100 22];

            % Create AUCROCEditField_2Label_3
            app.AUCROCEditField_2Label_3 = uilabel(app.NeuronStatisticsPanel);
            app.AUCROCEditField_2Label_3.HorizontalAlignment = 'right';
            app.AUCROCEditField_2Label_3.Position = [51 92 39 22];
            app.AUCROCEditField_2Label_3.Text = 'Phi-11';

            % Create AUCROCEditField_4
            app.AUCROCEditField_4 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.AUCROCEditField_4.Position = [101 92 100 22];

            % Create AUCROCEditField_2Label_4
            app.AUCROCEditField_2Label_4 = uilabel(app.NeuronStatisticsPanel);
            app.AUCROCEditField_2Label_4.HorizontalAlignment = 'right';
            app.AUCROCEditField_2Label_4.Position = [51 52 40 22];
            app.AUCROCEditField_2Label_4.Text = 'Phi-10';

            % Create AUCROCEditField_5
            app.AUCROCEditField_5 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.AUCROCEditField_5.Position = [101 52 100 22];

            % Create AUCROCEditField_2Label_5
            app.AUCROCEditField_2Label_5 = uilabel(app.NeuronStatisticsPanel);
            app.AUCROCEditField_2Label_5.HorizontalAlignment = 'right';
            app.AUCROCEditField_2Label_5.Position = [48 122 38 22];
            app.AUCROCEditField_2Label_5.Text = 'In/Out';

            % Create AUCROCEditField_6
            app.AUCROCEditField_6 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.AUCROCEditField_6.Position = [101 122 100 22];

            % Create AccuracyEditField_2Label_2
            app.AccuracyEditField_2Label_2 = uilabel(app.NeuronStatisticsPanel);
            app.AccuracyEditField_2Label_2.HorizontalAlignment = 'right';
            app.AccuracyEditField_2Label_2.Position = [260 12 56 22];
            app.AccuracyEditField_2Label_2.Text = 'Node Pot';

            % Create AccuracyEditField_3
            app.AccuracyEditField_3 = uieditfield(app.NeuronStatisticsPanel, 'text');
            app.AccuracyEditField_3.Position = [331 12 100 22];

            % Create VisualizeButtonGroup_12
            app.VisualizeButtonGroup_12 = uibuttongroup(app.PatternCompletionTab);
            app.VisualizeButtonGroup_12.TitlePosition = 'centertop';
            app.VisualizeButtonGroup_12.Title = 'Visualize';
            app.VisualizeButtonGroup_12.Position = [238 348 232 189];

            % Create IdentityOverlayButton_2
            app.IdentityOverlayButton_2 = uitogglebutton(app.VisualizeButtonGroup_12);
            app.IdentityOverlayButton_2.Text = 'Identity Overlay';
            app.IdentityOverlayButton_2.Position = [9 136 212 22];
            app.IdentityOverlayButton_2.Value = true;

            % Create ROCButton
            app.ROCButton = uitogglebutton(app.VisualizeButtonGroup_12);
            app.ROCButton.Text = 'ROC';
            app.ROCButton.Position = [11 117 212 22];

            % Create ConnectivityButton
            app.ConnectivityButton = uitogglebutton(app.VisualizeButtonGroup_12);
            app.ConnectivityButton.Text = 'Connectivity';
            app.ConnectivityButton.Position = [11 97 212 22];

            % Create ConnectivityInOnlyButton
            app.ConnectivityInOnlyButton = uitogglebutton(app.VisualizeButtonGroup_12);
            app.ConnectivityInOnlyButton.Text = 'Connectivity (In Only)';
            app.ConnectivityInOnlyButton.Position = [11 77 212 22];

            % Create ExportTableButton_5
            app.ExportTableButton_5 = uibutton(app.PatternCompletionTab, 'push');
            app.ExportTableButton_5.Position = [86 14 100 22];
            app.ExportTableButton_5.Text = 'Export Table';

            % Create ExportFigureButton_5
            app.ExportFigureButton_5 = uibutton(app.PatternCompletionTab, 'push');
            app.ExportFigureButton_5.Position = [323 14 100 22];
            app.ExportFigureButton_5.Text = 'Export Figure';

            % Create LabelEditFieldLabel_2
            app.LabelEditFieldLabel_2 = uilabel(app.PatternCompletionTab);
            app.LabelEditFieldLabel_2.HorizontalAlignment = 'right';
            app.LabelEditFieldLabel_2.Position = [31 516 35 22];

            % Create LabelEditField_2
            app.LabelEditField_2 = uieditfield(app.PatternCompletionTab, 'text');
            app.LabelEditField_2.Position = [81 516 124 22];

            % Create IndexTextAreaLabel_2
            app.IndexTextAreaLabel_2 = uilabel(app.PatternCompletionTab);
            app.IndexTextAreaLabel_2.HorizontalAlignment = 'right';
            app.IndexTextAreaLabel_2.Position = [40 371 35 22];
            app.IndexTextAreaLabel_2.Text = 'Index';

            % Create IndexTextArea_2
            app.IndexTextArea_2 = uitextarea(app.PatternCompletionTab);
            app.IndexTextArea_2.Position = [75 372 133 21];

            % Create UniqueTextAreaLabel_2
            app.UniqueTextAreaLabel_2 = uilabel(app.PatternCompletionTab);
            app.UniqueTextAreaLabel_2.HorizontalAlignment = 'right';
            app.UniqueTextAreaLabel_2.Position = [34 400 44 22];
            app.UniqueTextAreaLabel_2.Text = 'Unique';

            % Create UniqueTextArea_2
            app.UniqueTextArea_2 = uitextarea(app.PatternCompletionTab);
            app.UniqueTextArea_2.Position = [76 404 133 20];

            % Create CriteriaListBoxLabel
            app.CriteriaListBoxLabel = uilabel(app.PatternCompletionTab);
            app.CriteriaListBoxLabel.HorizontalAlignment = 'right';
            app.CriteriaListBoxLabel.Position = [34 490 44 22];
            app.CriteriaListBoxLabel.Text = 'Criteria';

            % Create CriteriaListBox
            app.CriteriaListBox = uilistbox(app.PatternCompletionTab);
            app.CriteriaListBox.Position = [106 435 100 74];

            % Create SelectSpecificModelEditFieldLabel_2
            app.SelectSpecificModelEditFieldLabel_2 = uilabel(app.StimuliTab);
            app.SelectSpecificModelEditFieldLabel_2.HorizontalAlignment = 'center';
            app.SelectSpecificModelEditFieldLabel_2.FontSize = 16;
            app.SelectSpecificModelEditFieldLabel_2.Position = [41 597 192 22];
            app.SelectSpecificModelEditFieldLabel_2.Text = 'Select Stimulus';

            % Create SelectSpecificModelEditField_2
            app.SelectSpecificModelEditField_2 = uieditfield(app.StimuliTab, 'numeric');
            app.SelectSpecificModelEditField_2.HorizontalAlignment = 'center';
            app.SelectSpecificModelEditField_2.FontSize = 16;
            app.SelectSpecificModelEditField_2.Position = [258 597 194 22];

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.ResultsTab);
            title(app.UIAxes_2, 'Optimization Plot')
            xlabel(app.UIAxes_2, 'H')
            ylabel(app.UIAxes_2, 'Y')
            zlabel(app.UIAxes_2, {'ZHZ'; ''})
            app.UIAxes_2.Position = [561 35 1180 665];

            % Create ParametersTab
            app.ParametersTab = uitab(app.TabGroup);
            app.ParametersTab.Title = 'Parameters';

            % Create ModelingPanel
            app.ModelingPanel = uipanel(app.ParametersTab);
            app.ModelingPanel.Title = 'Modeling';
            app.ModelingPanel.FontSize = 16;
            app.ModelingPanel.Position = [31 21 838 696];

            % Create StructuralLearningSLambdaLabel
            app.StructuralLearningSLambdaLabel = uilabel(app.ModelingPanel);
            app.StructuralLearningSLambdaLabel.FontName = 'Palatino';
            app.StructuralLearningSLambdaLabel.FontSize = 18;
            app.StructuralLearningSLambdaLabel.Position = [24 617 375 22];
            app.StructuralLearningSLambdaLabel.Text = 'Structural Learning: S Lambda';

            % Create ParameterEstimationPLambdaLabel
            app.ParameterEstimationPLambdaLabel = uilabel(app.ModelingPanel);
            app.ParameterEstimationPLambdaLabel.FontName = 'Palatino';
            app.ParameterEstimationPLambdaLabel.FontSize = 18;
            app.ParameterEstimationPLambdaLabel.Position = [24 357 375 22];
            app.ParameterEstimationPLambdaLabel.Text = 'Parameter Estimation: P Lambda';

            % Create TotalNumberofModelsEditFieldLabel
            app.TotalNumberofModelsEditFieldLabel = uilabel(app.ModelingPanel);
            app.TotalNumberofModelsEditFieldLabel.Position = [24 67 132 22];
            app.TotalNumberofModelsEditFieldLabel.Text = 'Total Number of Models';

            % Create TotalNumberofModelsEditField
            app.TotalNumberofModelsEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.TotalNumberofModelsEditField.Position = [171 67 223 22];
            app.TotalNumberofModelsEditField.Value = 80;

            % Create GlobalModelingParametersLabel
            app.GlobalModelingParametersLabel = uilabel(app.ModelingPanel);
            app.GlobalModelingParametersLabel.FontName = 'Palatino';
            app.GlobalModelingParametersLabel.FontSize = 18;
            app.GlobalModelingParametersLabel.Position = [24 187 375 22];
            app.GlobalModelingParametersLabel.Text = 'Global Modeling Parameters';

            % Create PartitionFunctionLabel
            app.PartitionFunctionLabel = uilabel(app.ModelingPanel);
            app.PartitionFunctionLabel.FontName = 'Palatino';
            app.PartitionFunctionLabel.FontSize = 18;
            app.PartitionFunctionLabel.Position = [420 617 375 22];
            app.PartitionFunctionLabel.Text = 'Partition Function';

            % Create reweightdenominatorDropDown
            app.reweightdenominatorDropDown = uidropdown(app.ModelingPanel);
            app.reweightdenominatorDropDown.Items = {'Bethe Approximation', 'Bethe+JTA'};
            app.reweightdenominatorDropDown.Position = [420 577 393 22];
            app.reweightdenominatorDropDown.Value = 'Bethe Approximation';

            % Create BlockCoordinateFrankeWolfeLabel
            app.BlockCoordinateFrankeWolfeLabel = uilabel(app.ModelingPanel);
            app.BlockCoordinateFrankeWolfeLabel.FontName = 'Palatino';
            app.BlockCoordinateFrankeWolfeLabel.FontSize = 18;
            app.BlockCoordinateFrankeWolfeLabel.Position = [420 407 375 22];
            app.BlockCoordinateFrankeWolfeLabel.Text = 'Block-Coordinate Franke-Wolfe';

            % Create ReweightingLabel
            app.ReweightingLabel = uilabel(app.ModelingPanel);
            app.ReweightingLabel.FontName = 'Palatino';
            app.ReweightingLabel.FontSize = 18;
            app.ReweightingLabel.Position = [420 527 375 22];
            app.ReweightingLabel.Text = 'Reweighting';

            % Create PS_Label
            app.PS_Label = uilabel(app.ModelingPanel);
            app.PS_Label.FontName = 'Palatino';
            app.PS_Label.Position = [420 87 56 22];
            app.PS_Label.Text = 'Pool Size';

            % Create Poolsize_num
            app.Poolsize_num = uieditfield(app.ModelingPanel, 'numeric');
            app.Poolsize_num.Limits = [0 Inf];
            app.Poolsize_num.FontName = 'Palatino';
            app.Poolsize_num.Position = [540 87 273 22];
            app.Poolsize_num.Value = 8;

            % Create MergeUDFNeuronalNodesCheckBox
            app.MergeUDFNeuronalNodesCheckBox = uicheckbox(app.ModelingPanel);
            app.MergeUDFNeuronalNodesCheckBox.Text = 'Merge UDF & Neuronal Nodes';
            app.MergeUDFNeuronalNodesCheckBox.Position = [22 386 457 22];

            % Create RangeEditFieldLabel_2
            app.RangeEditFieldLabel_2 = uilabel(app.ModelingPanel);
            app.RangeEditFieldLabel_2.FontName = 'Palatino';
            app.RangeEditFieldLabel_2.Position = [24 577 47 22];
            app.RangeEditFieldLabel_2.Text = 'Range';

            % Create S_range
            app.S_range = uieditfield(app.ModelingPanel, 'numeric');
            app.S_range.Limits = [0 Inf];
            app.S_range.FontName = 'Palatino';
            app.S_range.Position = [80 577 317 22];
            app.S_range.Value = 100;

            % Create MinEditFieldLabel_2
            app.MinEditFieldLabel_2 = uilabel(app.ModelingPanel);
            app.MinEditFieldLabel_2.FontName = 'Palatino';
            app.MinEditFieldLabel_2.Position = [22 537 47 22];
            app.MinEditFieldLabel_2.Text = 'Min';

            % Create S_min
            app.S_min = uieditfield(app.ModelingPanel, 'numeric');
            app.S_min.Limits = [0 Inf];
            app.S_min.FontName = 'Palatino';
            app.S_min.Position = [80 537 317 22];
            app.S_min.Value = 1e-10;

            % Create MaxEditFieldLabel_2
            app.MaxEditFieldLabel_2 = uilabel(app.ModelingPanel);
            app.MaxEditFieldLabel_2.FontName = 'Palatino';
            app.MaxEditFieldLabel_2.Position = [24 499 47 22];
            app.MaxEditFieldLabel_2.Text = 'Max';

            % Create S_max
            app.S_max = uieditfield(app.ModelingPanel, 'numeric');
            app.S_max.Limits = [0 Inf];
            app.S_max.FontName = 'Palatino';
            app.S_max.Position = [80 499 317 22];
            app.S_max.Value = 0.5;

            % Create MinEditField_2Label_2
            app.MinEditField_2Label_2 = uilabel(app.ModelingPanel);
            app.MinEditField_2Label_2.FontName = 'Palatino';
            app.MinEditField_2Label_2.Position = [28 298 47 22];
            app.MinEditField_2Label_2.Text = 'Min';

            % Create P_min
            app.P_min = uieditfield(app.ModelingPanel, 'numeric');
            app.P_min.Limits = [0 Inf];
            app.P_min.FontName = 'Palatino';
            app.P_min.Position = [80 298 314 22];
            app.P_min.Value = 10;

            % Create MaxEditField_2Label_2
            app.MaxEditField_2Label_2 = uilabel(app.ModelingPanel);
            app.MaxEditField_2Label_2.FontName = 'Palatino';
            app.MaxEditField_2Label_2.Position = [24 265 47 22];
            app.MaxEditField_2Label_2.Text = 'Max';

            % Create P_max
            app.P_max = uieditfield(app.ModelingPanel, 'numeric');
            app.P_max.Limits = [0 Inf];
            app.P_max.FontName = 'Palatino';
            app.P_max.Position = [80 265 314 22];
            app.P_max.Value = 1000000;

            % Create ParameterSamplingDropDownLabel
            app.ParameterSamplingDropDownLabel = uilabel(app.ModelingPanel);
            app.ParameterSamplingDropDownLabel.Position = [24 417 115 22];
            app.ParameterSamplingDropDownLabel.Text = 'Parameter Sampling';

            % Create ParameterSamplingDropDown
            app.ParameterSamplingDropDown = uidropdown(app.ModelingPanel);
            app.ParameterSamplingDropDown.Items = {'Log Space', 'Linear Space'};
            app.ParameterSamplingDropDown.Position = [154 417 240 22];
            app.ParameterSamplingDropDown.Value = 'Log Space';

            % Create RangeEditField_2Label_2
            app.RangeEditField_2Label_2 = uilabel(app.ModelingPanel);
            app.RangeEditField_2Label_2.FontName = 'Palatino';
            app.RangeEditField_2Label_2.Position = [24 330 47 22];
            app.RangeEditField_2Label_2.Text = 'Range';

            % Create P_range
            app.P_range = uieditfield(app.ModelingPanel, 'numeric');
            app.P_range.Limits = [0 Inf];
            app.P_range.FontName = 'Palatino';
            app.P_range.Position = [80 330 314 22];
            app.P_range.Value = 10;

            % Create MaxIterationsEditFieldLabel
            app.MaxIterationsEditFieldLabel = uilabel(app.ModelingPanel);
            app.MaxIterationsEditFieldLabel.Position = [420 367 81 22];
            app.MaxIterationsEditFieldLabel.Text = 'Max Iterations';

            % Create MaxIterationsEditField
            app.MaxIterationsEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.MaxIterationsEditField.Position = [540 367 271 22];
            app.MaxIterationsEditField.Value = 75000;

            % Create EpsilonEditFieldLabel
            app.EpsilonEditFieldLabel = uilabel(app.ModelingPanel);
            app.EpsilonEditFieldLabel.Position = [420 327 45 22];
            app.EpsilonEditFieldLabel.Text = 'Epsilon';

            % Create EpsilonEditField
            app.EpsilonEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.EpsilonEditField.Position = [540 327 272 22];
            app.EpsilonEditField.Value = 0.1;

            % Create PrintIntervalEditFieldLabel
            app.PrintIntervalEditFieldLabel = uilabel(app.ModelingPanel);
            app.PrintIntervalEditFieldLabel.Position = [420 287 73 22];
            app.PrintIntervalEditFieldLabel.Text = 'Print Interval';

            % Create PrintIntervalEditField
            app.PrintIntervalEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.PrintIntervalEditField.Position = [540 287 273 22];
            app.PrintIntervalEditField.Value = 1000;

            % Create PrintTestEditFieldLabel
            app.PrintTestEditFieldLabel = uilabel(app.ModelingPanel);
            app.PrintTestEditFieldLabel.Position = [420 247 56 22];
            app.PrintTestEditFieldLabel.Text = 'Print Test';

            % Create PrintTestEditField
            app.PrintTestEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.PrintTestEditField.Position = [540 247 271 22];
            app.PrintTestEditField.Value = 100;

            % Create PrintDualityGapEditFieldLabel
            app.PrintDualityGapEditFieldLabel = uilabel(app.ModelingPanel);
            app.PrintDualityGapEditFieldLabel.Position = [420 207 96 22];
            app.PrintDualityGapEditFieldLabel.Text = 'Print Duality Gap';

            % Create PrintDualityGapEditField
            app.PrintDualityGapEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.PrintDualityGapEditField.Limits = [0 1];
            app.PrintDualityGapEditField.Position = [540 207 273 22];
            app.PrintDualityGapEditField.Value = 1;

            % Create NumberofStructuresEditFieldLabel
            app.NumberofStructuresEditFieldLabel = uilabel(app.ModelingPanel);
            app.NumberofStructuresEditFieldLabel.Position = [24 107 120 22];
            app.NumberofStructuresEditFieldLabel.Text = 'Number of Structures';

            % Create NumberofStructuresEditField
            app.NumberofStructuresEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.NumberofStructuresEditField.Position = [174 107 220 22];
            app.NumberofStructuresEditField.Value = 8;

            % Create ReweightDenominatorDropDownLabel
            app.ReweightDenominatorDropDownLabel = uilabel(app.ModelingPanel);
            app.ReweightDenominatorDropDownLabel.Position = [420 487 128 22];
            app.ReweightDenominatorDropDownLabel.Text = 'Reweight Denominator';

            % Create ReweightDenominatorDropDown
            app.ReweightDenominatorDropDown = uidropdown(app.ModelingPanel);
            app.ReweightDenominatorDropDown.Items = {'Mean Degree', 'Median Degree', 'Max Degree', 'RMS Degree'};
            app.ReweightDenominatorDropDown.Position = [556 487 257 22];
            app.ReweightDenominatorDropDown.Value = 'Mean Degree';

            % Create SplitEditFieldLabel
            app.SplitEditFieldLabel = uilabel(app.ModelingPanel);
            app.SplitEditFieldLabel.Position = [24 147 29 22];
            app.SplitEditFieldLabel.Text = 'Split';

            % Create SplitEditField
            app.SplitEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.SplitEditField.Position = [174 147 220 22];
            app.SplitEditField.Value = 0.8;

            % Create EdgeConstraintsDropDownLabel
            app.EdgeConstraintsDropDownLabel = uilabel(app.ModelingPanel);
            app.EdgeConstraintsDropDownLabel.Position = [24 457 98 22];
            app.EdgeConstraintsDropDownLabel.Text = 'Edge Constraints';

            % Create EdgeConstraintsDropDown
            app.EdgeConstraintsDropDown = uidropdown(app.ModelingPanel);
            app.EdgeConstraintsDropDown.Items = {'No UDF-UDF', 'All Edges Allowed'};
            app.EdgeConstraintsDropDown.Position = [138 457 256 22];
            app.EdgeConstraintsDropDown.Value = 'No UDF-UDF';

            % Create OvercompletionDebugDropDownLabel
            app.OvercompletionDebugDropDownLabel = uilabel(app.ModelingPanel);
            app.OvercompletionDebugDropDownLabel.Position = [420 447 128 22];
            app.OvercompletionDebugDropDownLabel.Text = 'Overcompletion Debug';

            % Create OvercompletionDebugDropDown
            app.OvercompletionDebugDropDown = uidropdown(app.ModelingPanel);
            app.OvercompletionDebugDropDown.Items = {'No', 'Check Stuck'};
            app.OvercompletionDebugDropDown.Position = [556 447 256 22];
            app.OvercompletionDebugDropDown.Value = 'No';

            % Create MaxTimeEditFieldLabel
            app.MaxTimeEditFieldLabel = uilabel(app.ModelingPanel);
            app.MaxTimeEditFieldLabel.Position = [420 167 58 22];
            app.MaxTimeEditFieldLabel.Text = 'Max Time';

            % Create MaxTimeEditField
            app.MaxTimeEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.MaxTimeEditField.Position = [540 167 271 22];
            app.MaxTimeEditField.Value = Inf;

            % Create ParallelizationDropDownLabel
            app.ParallelizationDropDownLabel = uilabel(app.ModelingPanel);
            app.ParallelizationDropDownLabel.Position = [420 127 80 22];
            app.ParallelizationDropDownLabel.Text = 'Parallelization';

            % Create ParallelizationDropDown
            app.ParallelizationDropDown = uidropdown(app.ModelingPanel);
            app.ParallelizationDropDown.Items = {'Single Core', 'Multicore', 'Cluster'};
            app.ParallelizationDropDown.Position = [540 127 273 22];
            app.ParallelizationDropDown.Value = 'Single Core';

            % Create DensityConstraintEditFieldLabel
            app.DensityConstraintEditFieldLabel = uilabel(app.ModelingPanel);
            app.DensityConstraintEditFieldLabel.HorizontalAlignment = 'right';
            app.DensityConstraintEditFieldLabel.Position = [214 388 104 22];
            app.DensityConstraintEditFieldLabel.Text = 'Density Constraint';

            % Create DensityConstraintEditField
            app.DensityConstraintEditField = uieditfield(app.ModelingPanel, 'numeric');
            app.DensityConstraintEditField.Limits = [0 1];
            app.DensityConstraintEditField.Position = [333 388 63 22];
            app.DensityConstraintEditField.Value = 1;

            % Create CountLabel
            app.CountLabel = uilabel(app.ModelingPanel);
            app.CountLabel.FontName = 'Palatino';
            app.CountLabel.Position = [25 228 47 22];
            app.CountLabel.Text = 'Count';

            % Create P_Count
            app.P_Count = uieditfield(app.ModelingPanel, 'numeric');
            app.P_Count.Limits = [0 Inf];
            app.P_Count.FontName = 'Palatino';
            app.P_Count.Position = [81 228 314 22];
            app.P_Count.Value = 2;

            % Create ImagingPanel
            app.ImagingPanel = uipanel(app.ParametersTab);
            app.ImagingPanel.Title = 'Imaging';
            app.ImagingPanel.FontSize = 16;
            app.ImagingPanel.Position = [912 19 841 696];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = APP_10_19_2021_exported

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