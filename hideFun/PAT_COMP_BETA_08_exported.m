classdef PAT_COMP_BETA_08_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        IOPanel                         matlab.ui.container.Panel
        ResultsFilePath                 matlab.ui.control.EditField
        ImageFilePath                   matlab.ui.control.EditField
        LoggingConsoleLabel             matlab.ui.control.Label
        BrowseResults                   matlab.ui.control.Button
        BrowseImage                     matlab.ui.control.Button
        LoadResults                     matlab.ui.control.Button
        LoadImage                       matlab.ui.control.Button
        PatCompLabel                    matlab.ui.control.Label
        v08Label                        matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        LogTextArea                     matlab.ui.control.TextArea
        TabGroup                        matlab.ui.container.TabGroup
        DecodingTab                     matlab.ui.container.Tab
        PredictionPerformancePanel_Decoding  matlab.ui.container.Panel
        TruePositiveEditField_2Label    matlab.ui.control.Label
        TruePositiveEditField_Decoding  matlab.ui.control.EditField
        FalsePositiveEditField_2Label   matlab.ui.control.Label
        FalsePositiveEditField_Decoding  matlab.ui.control.EditField
        TrueNegativeEditField_2Label    matlab.ui.control.Label
        TrueNegativeEditField_Decoding  matlab.ui.control.EditField
        FalseNegativeEditField_2Label   matlab.ui.control.Label
        FalseNegativeEditField_Decoding  matlab.ui.control.EditField
        ThresholdLabel_2                matlab.ui.control.Label
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
        MissLabel_Decoding              matlab.ui.control.Label
        Miss_EditField_Decoding         matlab.ui.control.EditField
        StimulusEditFieldLabel_2        matlab.ui.control.Label
        SelectStimulus_Decoding         matlab.ui.control.NumericEditField
        DecodingButtonGroup             matlab.ui.container.ButtonGroup
        ROC_Decoding                    matlab.ui.control.ToggleButton
        PR_Decoding                     matlab.ui.control.ToggleButton
        MultiClass_Decoding             matlab.ui.control.ToggleButton
        Plot_Decoding_Label             matlab.ui.control.Label
        PerformanceAxes_Decoding        matlab.ui.control.UIAxes
        ROIAxes_Decoding                matlab.ui.control.UIAxes
        Structural_Prediction_Visualized_Decoding  matlab.ui.control.UIAxes
        EnsembleTab                     matlab.ui.container.Tab
        StimulusEditFieldLabel          matlab.ui.control.Label
        SelectStimulus                  matlab.ui.control.NumericEditField
        PredictionPerformancePanel      matlab.ui.container.Panel
        TruePositiveEditFieldLabel      matlab.ui.control.Label
        TruePositiveEditField           matlab.ui.control.EditField
        FalsePositiveEditFieldLabel     matlab.ui.control.Label
        FalsePositiveEditField          matlab.ui.control.EditField
        TrueNegativeEditFieldLabel      matlab.ui.control.Label
        TrueNegativeEditField           matlab.ui.control.EditField
        FalseNegativeEditFieldLabel     matlab.ui.control.Label
        FalseNegativeEditField          matlab.ui.control.EditField
        ThresholdLabel                  matlab.ui.control.Label
        Threshold_Edit_Field            matlab.ui.control.EditField
        SpecificityEditFieldLabel       matlab.ui.control.Label
        SpecificityEditField            matlab.ui.control.EditField
        SensitivityEditFieldLabel       matlab.ui.control.Label
        SensitivityEditField            matlab.ui.control.EditField
        AccuracyEditFieldLabel          matlab.ui.control.Label
        AccuracyEditField               matlab.ui.control.EditField
        PrecLabel                       matlab.ui.control.Label
        PrecEditField                   matlab.ui.control.EditField
        AUC_ROC_LABEL                   matlab.ui.control.Label
        AUC_ROC_EditField               matlab.ui.control.EditField
        AUCPR_Label                     matlab.ui.control.Label
        AUCPR_EditLabel                 matlab.ui.control.EditField
        MissLabel                       matlab.ui.control.Label
        Miss_EditField                  matlab.ui.control.EditField
        EnsemblePerformanceButtonGroup  matlab.ui.container.ButtonGroup
        ROCvsRandomButton               matlab.ui.control.ToggleButton
        ROCvsAllStimuliButton           matlab.ui.control.ToggleButton
        ROCvsAllEnsemblesButton         matlab.ui.control.ToggleButton
        ROCvsSingleTuningButton         matlab.ui.control.ToggleButton
        ROCvsEnsembleSizeButton         matlab.ui.control.ToggleButton
        ROCvsCompleteModelButton        matlab.ui.control.ToggleButton
        ROCvsLinearEnsembleButton       matlab.ui.control.ToggleButton
        ROCvsSingleTuning2Button        matlab.ui.control.ToggleButton
        PRvsRandomButton                matlab.ui.control.ToggleButton
        PRvsAllStimuliButton            matlab.ui.control.ToggleButton
        PRvsAllEnsemblesButton          matlab.ui.control.ToggleButton
        PRvsSingleTuningButton          matlab.ui.control.ToggleButton
        PRvsEnsembleSizeButton          matlab.ui.control.ToggleButton
        PRvsCompleteModelButton         matlab.ui.control.ToggleButton
        PRvsLinearEnsemblesButton       matlab.ui.control.ToggleButton
        PRvsSingleTuning2Button         matlab.ui.control.ToggleButton
        StructuredPredictionbyFrameButton  matlab.ui.control.ToggleButton
        Panel                           matlab.ui.container.Panel
        EnsembleNeuronsTextAreaLabel    matlab.ui.control.Label
        EnsembleNeuronsTextArea         matlab.ui.control.TextArea
        UniqueNeuronsTextArea           matlab.ui.control.TextArea
        EnsembleNeuronsTextAreaLabel_2  matlab.ui.control.Label
        PromNeuronsTextArea             matlab.ui.control.TextArea
        PromNeuronsLabel                matlab.ui.control.Label
        PercentUniqueLabel              matlab.ui.control.Label
        PercentUniqueVal                matlab.ui.control.Label
        PerformanceAxes                 matlab.ui.control.UIAxes
        IdentityAxes                    matlab.ui.control.UIAxes
        ROIAxes                         matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
       
    end
    
    properties (Access = public)
          log;
          log_line=1;
          ops = struct();
          results = struct();
          params = struct();
          model_collection = struct();
          best_model;
          file_loc;
          file_loc_IM;
          ImData=struct();
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
             pwd2 = fileparts(which('PAT_COMP_BETA_08'));
                 %pwd2 = pwd;
            
            if exist([pwd2 '\hideFun'], 'dir')
                addpath([pwd2 '\hideFun']);
            else
                f_DA_update_log(app,'ROBO RAFA: You need to move to PatComp directory and reopen GUI!!!');
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
            f_DA_initialize_ensemble(app);
            f_DA_initialize_decoding(app);
        end

        % Callback function
        function sLambdaPlotBGSelectionChanged(app, event)
            selectedButton = app.sLambdaPlotBG.SelectedObject;
            f_DA_structural_learning_plot(selectedButton,app);
        end

        % Value changed function: SelectStimulus
        function SelectStimulusValueChanged(app, event)
            value = app.SelectStimulus.Value;
            f_DA_update_ensemble_values(app,value);
        end

        % Selection changed function: EnsemblePerformanceButtonGroup
        function EnsemblePerformanceButtonGroupSelectionChanged(app, event)
            selectedButton = app.EnsemblePerformanceButtonGroup.SelectedObject;
            f_DA_ensemble_performance(selectedButton,app);
        end

        % Value changed function: SelectStimulus_Decoding
        function SelectStimulus_DecodingValueChanged(app, event)
            value = app.SelectStimulus_Decoding.Value;
            f_DA_update_decoding_values(app,value);  
        end

        % Selection changed function: DecodingButtonGroup
        function DecodingButtonGroupSelectionChanged(app, event)
            selectedButton = app.DecodingButtonGroup.SelectedObject;
            f_DA_update_decoding_performance(selectedButton,app);
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
            app.ResultsFilePath.FontName = 'Arial';
            app.ResultsFilePath.Position = [441 157 1140 22];
            app.ResultsFilePath.Value = 'Load Results File (.mat)';

            % Create ImageFilePath
            app.ImageFilePath = uieditfield(app.IOPanel, 'text');
            app.ImageFilePath.FontName = 'Arial';
            app.ImageFilePath.Position = [441 117 1140 22];
            app.ImageFilePath.Value = 'Load Imaging File (.mat)';

            % Create LoggingConsoleLabel
            app.LoggingConsoleLabel = uilabel(app.IOPanel);
            app.LoggingConsoleLabel.HorizontalAlignment = 'center';
            app.LoggingConsoleLabel.FontName = 'Arial';
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
            app.PatCompLabel.FontName = 'Arial';
            app.PatCompLabel.FontSize = 36;
            app.PatCompLabel.FontWeight = 'bold';
            app.PatCompLabel.Position = [41 94 164 45];
            app.PatCompLabel.Text = 'PatComp';

            % Create v08Label
            app.v08Label = uilabel(app.IOPanel);
            app.v08Label.FontName = 'Arial';
            app.v08Label.FontSize = 24;
            app.v08Label.FontWeight = 'bold';
            app.v08Label.Position = [81 69 52 30];
            app.v08Label.Text = 'v0.8';

            % Create Image
            app.Image = uiimage(app.IOPanel);
            app.Image.Position = [1621 18 161 161];

            % Create LogTextArea
            app.LogTextArea = uitextarea(app.IOPanel);
            app.LogTextArea.Editable = 'off';
            app.LogTextArea.FontName = 'Arial';
            app.LogTextArea.FontSize = 14;
            app.LogTextArea.Position = [242 17 1339 62];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [21 21 1780 760];

            % Create DecodingTab
            app.DecodingTab = uitab(app.TabGroup);
            app.DecodingTab.Title = 'Decoding';

            % Create PredictionPerformancePanel_Decoding
            app.PredictionPerformancePanel_Decoding = uipanel(app.DecodingTab);
            app.PredictionPerformancePanel_Decoding.Title = 'Prediction Performance';
            app.PredictionPerformancePanel_Decoding.FontSize = 16;
            app.PredictionPerformancePanel_Decoding.Position = [11 431 454 260];

            % Create TruePositiveEditField_2Label
            app.TruePositiveEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.TruePositiveEditField_2Label.HorizontalAlignment = 'right';
            app.TruePositiveEditField_2Label.FontName = 'Arial';
            app.TruePositiveEditField_2Label.Position = [22 196 75 22];
            app.TruePositiveEditField_2Label.Text = 'True Positive';

            % Create TruePositiveEditField_Decoding
            app.TruePositiveEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.TruePositiveEditField_Decoding.Editable = 'off';
            app.TruePositiveEditField_Decoding.FontName = 'Arial';
            app.TruePositiveEditField_Decoding.Position = [112 196 100 22];

            % Create FalsePositiveEditField_2Label
            app.FalsePositiveEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.FalsePositiveEditField_2Label.HorizontalAlignment = 'right';
            app.FalsePositiveEditField_2Label.FontName = 'Arial';
            app.FalsePositiveEditField_2Label.Position = [17 162 80 22];
            app.FalsePositiveEditField_2Label.Text = 'False Positive';

            % Create FalsePositiveEditField_Decoding
            app.FalsePositiveEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.FalsePositiveEditField_Decoding.Editable = 'off';
            app.FalsePositiveEditField_Decoding.Position = [112 162 100 22];

            % Create TrueNegativeEditField_2Label
            app.TrueNegativeEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.TrueNegativeEditField_2Label.HorizontalAlignment = 'right';
            app.TrueNegativeEditField_2Label.FontName = 'Arial';
            app.TrueNegativeEditField_2Label.Position = [16 124 80 22];
            app.TrueNegativeEditField_2Label.Text = 'True Negative';

            % Create TrueNegativeEditField_Decoding
            app.TrueNegativeEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.TrueNegativeEditField_Decoding.Editable = 'off';
            app.TrueNegativeEditField_Decoding.Position = [111 124 100 22];

            % Create FalseNegativeEditField_2Label
            app.FalseNegativeEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.FalseNegativeEditField_2Label.HorizontalAlignment = 'right';
            app.FalseNegativeEditField_2Label.FontName = 'Arial';
            app.FalseNegativeEditField_2Label.Position = [10 89 86 22];
            app.FalseNegativeEditField_2Label.Text = 'False Negative';

            % Create FalseNegativeEditField_Decoding
            app.FalseNegativeEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.FalseNegativeEditField_Decoding.Editable = 'off';
            app.FalseNegativeEditField_Decoding.Position = [111 89 100 22];

            % Create ThresholdLabel_2
            app.ThresholdLabel_2 = uilabel(app.PredictionPerformancePanel_Decoding);
            app.ThresholdLabel_2.HorizontalAlignment = 'right';
            app.ThresholdLabel_2.FontName = 'Arial';
            app.ThresholdLabel_2.Position = [262 196 59 22];
            app.ThresholdLabel_2.Text = 'Threshold';

            % Create Threshold_Edit_Field_Decoding
            app.Threshold_Edit_Field_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.Threshold_Edit_Field_Decoding.Editable = 'off';
            app.Threshold_Edit_Field_Decoding.Position = [336 196 100 22];

            % Create SpecificityEditField_2Label
            app.SpecificityEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.SpecificityEditField_2Label.HorizontalAlignment = 'right';
            app.SpecificityEditField_2Label.FontName = 'Arial';
            app.SpecificityEditField_2Label.Position = [261 162 60 22];
            app.SpecificityEditField_2Label.Text = 'Specificity';

            % Create SpecificityEditField_Decoding
            app.SpecificityEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.SpecificityEditField_Decoding.Editable = 'off';
            app.SpecificityEditField_Decoding.Position = [336 162 100 22];

            % Create SensitivityEditField_2Label
            app.SensitivityEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.SensitivityEditField_2Label.HorizontalAlignment = 'right';
            app.SensitivityEditField_2Label.FontName = 'Arial';
            app.SensitivityEditField_2Label.Position = [260 124 60 22];
            app.SensitivityEditField_2Label.Text = 'Sensitivity';

            % Create SensitivityEditField_Decoding
            app.SensitivityEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.SensitivityEditField_Decoding.Editable = 'off';
            app.SensitivityEditField_Decoding.Position = [335 124 100 22];

            % Create AccuracyEditField_2Label
            app.AccuracyEditField_2Label = uilabel(app.PredictionPerformancePanel_Decoding);
            app.AccuracyEditField_2Label.HorizontalAlignment = 'right';
            app.AccuracyEditField_2Label.FontName = 'Arial';
            app.AccuracyEditField_2Label.Position = [265 89 55 22];
            app.AccuracyEditField_2Label.Text = 'Accuracy';

            % Create AccuracyEditField_Decoding
            app.AccuracyEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.AccuracyEditField_Decoding.Editable = 'off';
            app.AccuracyEditField_Decoding.Position = [335 89 100 22];

            % Create PrecLabel_Decoding
            app.PrecLabel_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.PrecLabel_Decoding.HorizontalAlignment = 'right';
            app.PrecLabel_Decoding.FontName = 'Arial';
            app.PrecLabel_Decoding.Position = [265 52 55 22];
            app.PrecLabel_Decoding.Text = 'Precision';

            % Create PrecEditField_Decoding
            app.PrecEditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.PrecEditField_Decoding.Editable = 'off';
            app.PrecEditField_Decoding.Position = [335 52 100 22];

            % Create AUC_ROC_LABEL_Decoding
            app.AUC_ROC_LABEL_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.AUC_ROC_LABEL_Decoding.HorizontalAlignment = 'right';
            app.AUC_ROC_LABEL_Decoding.FontName = 'Arial';
            app.AUC_ROC_LABEL_Decoding.Position = [27 51 69 22];
            app.AUC_ROC_LABEL_Decoding.Text = 'AUC (ROC)';

            % Create AUC_ROC_EditField_Decoding
            app.AUC_ROC_EditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.AUC_ROC_EditField_Decoding.Editable = 'off';
            app.AUC_ROC_EditField_Decoding.Position = [111 51 100 22];

            % Create AUCPR_Label_Decoding
            app.AUCPR_Label_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.AUCPR_Label_Decoding.HorizontalAlignment = 'right';
            app.AUCPR_Label_Decoding.FontName = 'Arial';
            app.AUCPR_Label_Decoding.Position = [37 14 59 22];
            app.AUCPR_Label_Decoding.Text = 'AUC (PR)';

            % Create AUCPR_EditLabel_Decoding
            app.AUCPR_EditLabel_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.AUCPR_EditLabel_Decoding.Editable = 'off';
            app.AUCPR_EditLabel_Decoding.Position = [111 14 100 22];

            % Create MissLabel_Decoding
            app.MissLabel_Decoding = uilabel(app.PredictionPerformancePanel_Decoding);
            app.MissLabel_Decoding.HorizontalAlignment = 'right';
            app.MissLabel_Decoding.FontName = 'Arial';
            app.MissLabel_Decoding.Position = [290 13 30 22];
            app.MissLabel_Decoding.Text = 'Miss';

            % Create Miss_EditField_Decoding
            app.Miss_EditField_Decoding = uieditfield(app.PredictionPerformancePanel_Decoding, 'text');
            app.Miss_EditField_Decoding.Editable = 'off';
            app.Miss_EditField_Decoding.Position = [335 13 100 22];

            % Create StimulusEditFieldLabel_2
            app.StimulusEditFieldLabel_2 = uilabel(app.DecodingTab);
            app.StimulusEditFieldLabel_2.HorizontalAlignment = 'right';
            app.StimulusEditFieldLabel_2.FontName = 'Arial';
            app.StimulusEditFieldLabel_2.FontSize = 16;
            app.StimulusEditFieldLabel_2.Position = [11 702 71 22];
            app.StimulusEditFieldLabel_2.Text = 'Stimulus ';

            % Create SelectStimulus_Decoding
            app.SelectStimulus_Decoding = uieditfield(app.DecodingTab, 'numeric');
            app.SelectStimulus_Decoding.Limits = [1 Inf];
            app.SelectStimulus_Decoding.ValueDisplayFormat = '%.0f';
            app.SelectStimulus_Decoding.ValueChangedFcn = createCallbackFcn(app, @SelectStimulus_DecodingValueChanged, true);
            app.SelectStimulus_Decoding.FontName = 'Arial';
            app.SelectStimulus_Decoding.FontSize = 16;
            app.SelectStimulus_Decoding.Position = [97 702 100 22];
            app.SelectStimulus_Decoding.Value = 1;

            % Create DecodingButtonGroup
            app.DecodingButtonGroup = uibuttongroup(app.DecodingTab);
            app.DecodingButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @DecodingButtonGroupSelectionChanged, true);
            app.DecodingButtonGroup.Position = [11 402 454 30];

            % Create ROC_Decoding
            app.ROC_Decoding = uitogglebutton(app.DecodingButtonGroup);
            app.ROC_Decoding.Text = 'ROC';
            app.ROC_Decoding.FontName = 'Arial';
            app.ROC_Decoding.Position = [157 4 100 22];
            app.ROC_Decoding.Value = true;

            % Create PR_Decoding
            app.PR_Decoding = uitogglebutton(app.DecodingButtonGroup);
            app.PR_Decoding.Text = 'PR';
            app.PR_Decoding.FontName = 'Arial';
            app.PR_Decoding.Position = [255 4 100 22];

            % Create MultiClass_Decoding
            app.MultiClass_Decoding = uitogglebutton(app.DecodingButtonGroup);
            app.MultiClass_Decoding.Text = 'MultiClass';
            app.MultiClass_Decoding.FontName = 'Arial';
            app.MultiClass_Decoding.Position = [352 4 100 22];

            % Create Plot_Decoding_Label
            app.Plot_Decoding_Label = uilabel(app.DecodingButtonGroup);
            app.Plot_Decoding_Label.HorizontalAlignment = 'center';
            app.Plot_Decoding_Label.FontName = 'Arial';
            app.Plot_Decoding_Label.Position = [4 3 154 22];
            app.Plot_Decoding_Label.Text = 'Performance Plot';

            % Create PerformanceAxes_Decoding
            app.PerformanceAxes_Decoding = uiaxes(app.DecodingTab);
            title(app.PerformanceAxes_Decoding, 'Ensemble Performance')
            xlabel(app.PerformanceAxes_Decoding, 'X')
            ylabel(app.PerformanceAxes_Decoding, 'Y')
            zlabel(app.PerformanceAxes_Decoding, 'Z')
            app.PerformanceAxes_Decoding.FontName = 'Arial';
            app.PerformanceAxes_Decoding.Position = [981 14 780 700];

            % Create ROIAxes_Decoding
            app.ROIAxes_Decoding = uiaxes(app.DecodingTab);
            title(app.ROIAxes_Decoding, 'Identified ROIs')
            app.ROIAxes_Decoding.FontName = 'Arial';
            app.ROIAxes_Decoding.XTick = [];
            app.ROIAxes_Decoding.YTick = [];
            app.ROIAxes_Decoding.Position = [522 409 390 300];

            % Create Structural_Prediction_Visualized_Decoding
            app.Structural_Prediction_Visualized_Decoding = uiaxes(app.DecodingTab);
            title(app.Structural_Prediction_Visualized_Decoding, 'Structural Prediction Visualized')
            app.Structural_Prediction_Visualized_Decoding.FontName = 'Arial';
            app.Structural_Prediction_Visualized_Decoding.XTick = [];
            app.Structural_Prediction_Visualized_Decoding.YTick = [];
            app.Structural_Prediction_Visualized_Decoding.Position = [11 14 901 376];

            % Create EnsembleTab
            app.EnsembleTab = uitab(app.TabGroup);
            app.EnsembleTab.Title = 'Ensemble';

            % Create StimulusEditFieldLabel
            app.StimulusEditFieldLabel = uilabel(app.EnsembleTab);
            app.StimulusEditFieldLabel.HorizontalAlignment = 'right';
            app.StimulusEditFieldLabel.FontName = 'Arial';
            app.StimulusEditFieldLabel.FontSize = 16;
            app.StimulusEditFieldLabel.Position = [11 702 71 22];
            app.StimulusEditFieldLabel.Text = 'Stimulus ';

            % Create SelectStimulus
            app.SelectStimulus = uieditfield(app.EnsembleTab, 'numeric');
            app.SelectStimulus.Limits = [1 Inf];
            app.SelectStimulus.ValueDisplayFormat = '%.0f';
            app.SelectStimulus.ValueChangedFcn = createCallbackFcn(app, @SelectStimulusValueChanged, true);
            app.SelectStimulus.FontName = 'Arial';
            app.SelectStimulus.FontSize = 16;
            app.SelectStimulus.Position = [97 702 100 22];
            app.SelectStimulus.Value = 1;

            % Create PredictionPerformancePanel
            app.PredictionPerformancePanel = uipanel(app.EnsembleTab);
            app.PredictionPerformancePanel.Title = 'Prediction Performance';
            app.PredictionPerformancePanel.FontSize = 16;
            app.PredictionPerformancePanel.Position = [21 24 454 260];

            % Create TruePositiveEditFieldLabel
            app.TruePositiveEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.TruePositiveEditFieldLabel.HorizontalAlignment = 'right';
            app.TruePositiveEditFieldLabel.FontName = 'Arial';
            app.TruePositiveEditFieldLabel.Position = [22 196 75 22];
            app.TruePositiveEditFieldLabel.Text = 'True Positive';

            % Create TruePositiveEditField
            app.TruePositiveEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.TruePositiveEditField.FontName = 'Arial';
            app.TruePositiveEditField.Position = [112 196 100 22];

            % Create FalsePositiveEditFieldLabel
            app.FalsePositiveEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.FalsePositiveEditFieldLabel.HorizontalAlignment = 'right';
            app.FalsePositiveEditFieldLabel.FontName = 'Arial';
            app.FalsePositiveEditFieldLabel.Position = [17 162 80 22];
            app.FalsePositiveEditFieldLabel.Text = 'False Positive';

            % Create FalsePositiveEditField
            app.FalsePositiveEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.FalsePositiveEditField.Position = [112 162 100 22];

            % Create TrueNegativeEditFieldLabel
            app.TrueNegativeEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.TrueNegativeEditFieldLabel.HorizontalAlignment = 'right';
            app.TrueNegativeEditFieldLabel.FontName = 'Arial';
            app.TrueNegativeEditFieldLabel.Position = [16 124 80 22];
            app.TrueNegativeEditFieldLabel.Text = 'True Negative';

            % Create TrueNegativeEditField
            app.TrueNegativeEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.TrueNegativeEditField.Position = [111 124 100 22];

            % Create FalseNegativeEditFieldLabel
            app.FalseNegativeEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.FalseNegativeEditFieldLabel.HorizontalAlignment = 'right';
            app.FalseNegativeEditFieldLabel.FontName = 'Arial';
            app.FalseNegativeEditFieldLabel.Position = [10 89 86 22];
            app.FalseNegativeEditFieldLabel.Text = 'False Negative';

            % Create FalseNegativeEditField
            app.FalseNegativeEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.FalseNegativeEditField.Position = [111 89 100 22];

            % Create ThresholdLabel
            app.ThresholdLabel = uilabel(app.PredictionPerformancePanel);
            app.ThresholdLabel.HorizontalAlignment = 'right';
            app.ThresholdLabel.FontName = 'Arial';
            app.ThresholdLabel.Position = [262 196 59 22];
            app.ThresholdLabel.Text = 'Threshold';

            % Create Threshold_Edit_Field
            app.Threshold_Edit_Field = uieditfield(app.PredictionPerformancePanel, 'text');
            app.Threshold_Edit_Field.Position = [336 196 100 22];

            % Create SpecificityEditFieldLabel
            app.SpecificityEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.SpecificityEditFieldLabel.HorizontalAlignment = 'right';
            app.SpecificityEditFieldLabel.FontName = 'Arial';
            app.SpecificityEditFieldLabel.Position = [261 162 60 22];
            app.SpecificityEditFieldLabel.Text = 'Specificity';

            % Create SpecificityEditField
            app.SpecificityEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.SpecificityEditField.Position = [336 162 100 22];

            % Create SensitivityEditFieldLabel
            app.SensitivityEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.SensitivityEditFieldLabel.HorizontalAlignment = 'right';
            app.SensitivityEditFieldLabel.FontName = 'Arial';
            app.SensitivityEditFieldLabel.Position = [260 124 60 22];
            app.SensitivityEditFieldLabel.Text = 'Sensitivity';

            % Create SensitivityEditField
            app.SensitivityEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.SensitivityEditField.Position = [335 124 100 22];

            % Create AccuracyEditFieldLabel
            app.AccuracyEditFieldLabel = uilabel(app.PredictionPerformancePanel);
            app.AccuracyEditFieldLabel.HorizontalAlignment = 'right';
            app.AccuracyEditFieldLabel.FontName = 'Arial';
            app.AccuracyEditFieldLabel.Position = [265 89 55 22];
            app.AccuracyEditFieldLabel.Text = 'Accuracy';

            % Create AccuracyEditField
            app.AccuracyEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.AccuracyEditField.Position = [335 89 100 22];

            % Create PrecLabel
            app.PrecLabel = uilabel(app.PredictionPerformancePanel);
            app.PrecLabel.HorizontalAlignment = 'right';
            app.PrecLabel.FontName = 'Arial';
            app.PrecLabel.Position = [265 52 55 22];
            app.PrecLabel.Text = 'Precision';

            % Create PrecEditField
            app.PrecEditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.PrecEditField.Position = [335 52 100 22];

            % Create AUC_ROC_LABEL
            app.AUC_ROC_LABEL = uilabel(app.PredictionPerformancePanel);
            app.AUC_ROC_LABEL.HorizontalAlignment = 'right';
            app.AUC_ROC_LABEL.FontName = 'Arial';
            app.AUC_ROC_LABEL.Position = [27 51 69 22];
            app.AUC_ROC_LABEL.Text = 'AUC (ROC)';

            % Create AUC_ROC_EditField
            app.AUC_ROC_EditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.AUC_ROC_EditField.Position = [111 51 100 22];

            % Create AUCPR_Label
            app.AUCPR_Label = uilabel(app.PredictionPerformancePanel);
            app.AUCPR_Label.HorizontalAlignment = 'right';
            app.AUCPR_Label.FontName = 'Arial';
            app.AUCPR_Label.Position = [37 14 59 22];
            app.AUCPR_Label.Text = 'AUC (PR)';

            % Create AUCPR_EditLabel
            app.AUCPR_EditLabel = uieditfield(app.PredictionPerformancePanel, 'text');
            app.AUCPR_EditLabel.Position = [111 14 100 22];

            % Create MissLabel
            app.MissLabel = uilabel(app.PredictionPerformancePanel);
            app.MissLabel.HorizontalAlignment = 'right';
            app.MissLabel.FontName = 'Arial';
            app.MissLabel.Position = [290 13 30 22];
            app.MissLabel.Text = 'Miss';

            % Create Miss_EditField
            app.Miss_EditField = uieditfield(app.PredictionPerformancePanel, 'text');
            app.Miss_EditField.Position = [335 13 100 22];

            % Create EnsemblePerformanceButtonGroup
            app.EnsemblePerformanceButtonGroup = uibuttongroup(app.EnsembleTab);
            app.EnsemblePerformanceButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @EnsemblePerformanceButtonGroupSelectionChanged, true);
            app.EnsemblePerformanceButtonGroup.Title = 'Ensemble Performance';
            app.EnsemblePerformanceButtonGroup.Position = [212 304 263 420];

            % Create ROCvsRandomButton
            app.ROCvsRandomButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsRandomButton.Text = 'ROC (vs. Random)';
            app.ROCvsRandomButton.Position = [42 357 182 22];
            app.ROCvsRandomButton.Value = true;

            % Create ROCvsAllStimuliButton
            app.ROCvsAllStimuliButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsAllStimuliButton.Text = 'ROC (vs. All Stimuli)';
            app.ROCvsAllStimuliButton.FontName = 'Arial';
            app.ROCvsAllStimuliButton.Position = [42 336 182 22];

            % Create ROCvsAllEnsemblesButton
            app.ROCvsAllEnsemblesButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsAllEnsemblesButton.Text = 'ROC (vs. All Ensembles)';
            app.ROCvsAllEnsemblesButton.FontName = 'Arial';
            app.ROCvsAllEnsemblesButton.Position = [42 315 182 22];

            % Create ROCvsSingleTuningButton
            app.ROCvsSingleTuningButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsSingleTuningButton.Text = 'ROC (vs. Single Tuning)';
            app.ROCvsSingleTuningButton.FontName = 'Arial';
            app.ROCvsSingleTuningButton.Position = [42 294 182 22];

            % Create ROCvsEnsembleSizeButton
            app.ROCvsEnsembleSizeButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsEnsembleSizeButton.Text = 'ROC (vs. Ensemble Size)';
            app.ROCvsEnsembleSizeButton.FontName = 'Arial';
            app.ROCvsEnsembleSizeButton.Position = [42 273 182 22];

            % Create ROCvsCompleteModelButton
            app.ROCvsCompleteModelButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsCompleteModelButton.Text = 'ROC (vs. Complete Model)';
            app.ROCvsCompleteModelButton.FontName = 'Arial';
            app.ROCvsCompleteModelButton.Position = [42 252 182 22];

            % Create ROCvsLinearEnsembleButton
            app.ROCvsLinearEnsembleButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsLinearEnsembleButton.Text = 'ROC (vs. Linear Ensemble)';
            app.ROCvsLinearEnsembleButton.FontName = 'Arial';
            app.ROCvsLinearEnsembleButton.Position = [42 231 182 22];

            % Create ROCvsSingleTuning2Button
            app.ROCvsSingleTuning2Button = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.ROCvsSingleTuning2Button.Text = 'ROC (vs. Single Tuning 2)';
            app.ROCvsSingleTuning2Button.FontName = 'Arial';
            app.ROCvsSingleTuning2Button.Position = [42 210 182 22];

            % Create PRvsRandomButton
            app.PRvsRandomButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsRandomButton.Text = 'PR (vs. Random)';
            app.PRvsRandomButton.FontName = 'Arial';
            app.PRvsRandomButton.Position = [42 189 182 22];

            % Create PRvsAllStimuliButton
            app.PRvsAllStimuliButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsAllStimuliButton.Text = 'PR (vs. All Stimuli)';
            app.PRvsAllStimuliButton.FontName = 'Arial';
            app.PRvsAllStimuliButton.Position = [42 168 182 22];

            % Create PRvsAllEnsemblesButton
            app.PRvsAllEnsemblesButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsAllEnsemblesButton.Text = 'PR (vs. All Ensembles)';
            app.PRvsAllEnsemblesButton.FontName = 'Arial';
            app.PRvsAllEnsemblesButton.Position = [42 147 182 22];

            % Create PRvsSingleTuningButton
            app.PRvsSingleTuningButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsSingleTuningButton.Text = 'PR (vs. Single Tuning)';
            app.PRvsSingleTuningButton.FontName = 'Arial';
            app.PRvsSingleTuningButton.Position = [42 126 182 22];

            % Create PRvsEnsembleSizeButton
            app.PRvsEnsembleSizeButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsEnsembleSizeButton.Text = 'PR (vs. Ensemble Size)';
            app.PRvsEnsembleSizeButton.FontName = 'Arial';
            app.PRvsEnsembleSizeButton.Position = [42 105 182 22];

            % Create PRvsCompleteModelButton
            app.PRvsCompleteModelButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsCompleteModelButton.Text = 'PR (vs. Complete Model)';
            app.PRvsCompleteModelButton.FontName = 'Arial';
            app.PRvsCompleteModelButton.Position = [42 84 182 22];

            % Create PRvsLinearEnsemblesButton
            app.PRvsLinearEnsemblesButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsLinearEnsemblesButton.Text = 'PR (vs. Linear Ensembles)';
            app.PRvsLinearEnsemblesButton.FontName = 'Arial';
            app.PRvsLinearEnsemblesButton.Position = [42 63 182 22];

            % Create PRvsSingleTuning2Button
            app.PRvsSingleTuning2Button = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.PRvsSingleTuning2Button.Text = 'PR (vs. Single Tuning 2)';
            app.PRvsSingleTuning2Button.FontName = 'Arial';
            app.PRvsSingleTuning2Button.Position = [42 42 182 22];

            % Create StructuredPredictionbyFrameButton
            app.StructuredPredictionbyFrameButton = uitogglebutton(app.EnsemblePerformanceButtonGroup);
            app.StructuredPredictionbyFrameButton.Text = 'Structured Prediction by Frame';
            app.StructuredPredictionbyFrameButton.FontName = 'Arial';
            app.StructuredPredictionbyFrameButton.Position = [44 21 182 22];

            % Create Panel
            app.Panel = uipanel(app.EnsembleTab);
            app.Panel.Position = [17 304 180 389];

            % Create EnsembleNeuronsTextAreaLabel
            app.EnsembleNeuronsTextAreaLabel = uilabel(app.Panel);
            app.EnsembleNeuronsTextAreaLabel.HorizontalAlignment = 'center';
            app.EnsembleNeuronsTextAreaLabel.FontName = 'Arial';
            app.EnsembleNeuronsTextAreaLabel.FontSize = 16;
            app.EnsembleNeuronsTextAreaLabel.Position = [19 357 142 22];
            app.EnsembleNeuronsTextAreaLabel.Text = 'Ensemble Neurons';

            % Create EnsembleNeuronsTextArea
            app.EnsembleNeuronsTextArea = uitextarea(app.Panel);
            app.EnsembleNeuronsTextArea.FontName = 'Arial';
            app.EnsembleNeuronsTextArea.FontSize = 16;
            app.EnsembleNeuronsTextArea.Position = [44 294 95 60];

            % Create UniqueNeuronsTextArea
            app.UniqueNeuronsTextArea = uitextarea(app.Panel);
            app.UniqueNeuronsTextArea.FontName = 'Arial';
            app.UniqueNeuronsTextArea.FontSize = 16;
            app.UniqueNeuronsTextArea.Position = [44 200 95 60];

            % Create EnsembleNeuronsTextAreaLabel_2
            app.EnsembleNeuronsTextAreaLabel_2 = uilabel(app.Panel);
            app.EnsembleNeuronsTextAreaLabel_2.HorizontalAlignment = 'center';
            app.EnsembleNeuronsTextAreaLabel_2.FontName = 'Arial';
            app.EnsembleNeuronsTextAreaLabel_2.FontSize = 16;
            app.EnsembleNeuronsTextAreaLabel_2.Position = [31 263 121 22];
            app.EnsembleNeuronsTextAreaLabel_2.Text = 'Unique Neurons';

            % Create PromNeuronsTextArea
            app.PromNeuronsTextArea = uitextarea(app.Panel);
            app.PromNeuronsTextArea.FontName = 'Arial';
            app.PromNeuronsTextArea.FontSize = 16;
            app.PromNeuronsTextArea.Position = [44 105 95 60];

            % Create PromNeuronsLabel
            app.PromNeuronsLabel = uilabel(app.Panel);
            app.PromNeuronsLabel.HorizontalAlignment = 'center';
            app.PromNeuronsLabel.FontName = 'Arial';
            app.PromNeuronsLabel.FontSize = 16;
            app.PromNeuronsLabel.Position = [8 168 163 22];
            app.PromNeuronsLabel.Text = 'Promiscuous Neurons';

            % Create PercentUniqueLabel
            app.PercentUniqueLabel = uilabel(app.Panel);
            app.PercentUniqueLabel.HorizontalAlignment = 'center';
            app.PercentUniqueLabel.FontName = 'Arial';
            app.PercentUniqueLabel.FontSize = 16;
            app.PercentUniqueLabel.Position = [32 73 116 22];
            app.PercentUniqueLabel.Text = 'Percent Unique';

            % Create PercentUniqueVal
            app.PercentUniqueVal = uilabel(app.Panel);
            app.PercentUniqueVal.HorizontalAlignment = 'center';
            app.PercentUniqueVal.FontName = 'Arial';
            app.PercentUniqueVal.FontSize = 16;
            app.PercentUniqueVal.Position = [32 42 116 22];
            app.PercentUniqueVal.Text = '';

            % Create PerformanceAxes
            app.PerformanceAxes = uiaxes(app.EnsembleTab);
            title(app.PerformanceAxes, 'Ensemble Performance')
            xlabel(app.PerformanceAxes, 'X')
            ylabel(app.PerformanceAxes, 'Y')
            zlabel(app.PerformanceAxes, 'Z')
            app.PerformanceAxes.FontName = 'Arial';
            app.PerformanceAxes.Position = [981 14 780 700];

            % Create IdentityAxes
            app.IdentityAxes = uiaxes(app.EnsembleTab);
            title(app.IdentityAxes, 'Ensemble Identity')
            app.IdentityAxes.FontName = 'Arial';
            app.IdentityAxes.XTick = [];
            app.IdentityAxes.YTick = [];
            app.IdentityAxes.Position = [561 424 370 300];

            % Create ROIAxes
            app.ROIAxes = uiaxes(app.EnsembleTab);
            title(app.ROIAxes, 'Identified ROIs')
            app.ROIAxes.FontName = 'Arial';
            app.ROIAxes.XTick = [];
            app.ROIAxes.YTick = [];
            app.ROIAxes.Position = [561 14 390 300];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = PAT_COMP_BETA_08_exported

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