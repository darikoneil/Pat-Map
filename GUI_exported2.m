classdef GUI_exported2 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        StructuralLearningSLambdaLabel  matlab.ui.control.Label
        RangeEditFieldLabel             matlab.ui.control.Label
        S_range                         matlab.ui.control.NumericEditField
        MinEditFieldLabel               matlab.ui.control.Label
        S_min                           matlab.ui.control.NumericEditField
        MaxEditFieldLabel               matlab.ui.control.Label
        S_max                           matlab.ui.control.NumericEditField
        ParameterEstimationPLambdaLabel  matlab.ui.control.Label
        RangeEditField_2Label           matlab.ui.control.Label
        P_range                         matlab.ui.control.NumericEditField
        MinEditField_2Label             matlab.ui.control.Label
        P_min                           matlab.ui.control.NumericEditField
        MaxEditField_2Label             matlab.ui.control.Label
        P_max                           matlab.ui.control.NumericEditField
        ParameterSamplingDropDownLabel  matlab.ui.control.Label
        ParameterSamplingDropDown       matlab.ui.control.DropDown
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
        ContinueButton_2                matlab.ui.control.Button
        SplitEditFieldLabel             matlab.ui.control.Label
        SplitEditField                  matlab.ui.control.NumericEditField
        EdgeConstraintsDropDownLabel    matlab.ui.control.Label
        EdgeConstraintsDropDown         matlab.ui.control.DropDown
        TotalNumberofModelsEditFieldLabel  matlab.ui.control.Label
        TotalNumberofModelsEditField    matlab.ui.control.NumericEditField
        SelectModelingParametersLabel   matlab.ui.control.Label
        GlobalModelingParametersLabel   matlab.ui.control.Label
        PartitionFunctionLabel          matlab.ui.control.Label
        reweightdenominatorDropDown_2   matlab.ui.control.DropDown
        BlockCoordinateFrankeWolfeLabel  matlab.ui.control.Label
        ReweightingLabel                matlab.ui.control.Label
        OvercompletionDebugDropDownLabel  matlab.ui.control.Label
        OvercompletionDebugDropDown     matlab.ui.control.DropDown
        MaxTimeEditField_2Label         matlab.ui.control.Label
        MaxTimeEditField_2              matlab.ui.control.NumericEditField
        ParallelizationDropDownLabel    matlab.ui.control.Label
        ParallelizationDropDown         matlab.ui.control.DropDown
        PS_Label                        matlab.ui.control.Label
        Poolsize_num                    matlab.ui.control.NumericEditField
        MergeUDFNeuronalNodesCheckBox   matlab.ui.control.CheckBox
        DensityConstraintEditFieldLabel  matlab.ui.control.Label
        DensityConstraintEditField      matlab.ui.control.NumericEditField
        CountLabel                      matlab.ui.control.Label
        P_Count                         matlab.ui.control.NumericEditField
    end

    
    properties (Access = public)
        params = struct('p_lambda_count',2,'p_lambda_min',10,'p_lambda_max', 10000,'edges','simple','no_same_neuron_edges',1,'reweight_denominator',...
            'mean_degree','compute_true_logZ',logical(0),'structure_type','loopy','BCFW_max_iterations',75000,'split',0.8,'s_lambda_range',100,'s_lambda_min',...
            1e-5,'s_lambda_max',0.5, 'poolsize',8,'data',[],'UDF',[],'coords',[],'best_model_slambda',[],'best_model_plambda',[],'hyperedge',2,...
            'BCFW_fval_epsilon',0.1,'printInterval',1000,'printTest',100,'MaxTime',Inf,'num_structures',8,'logspace',1,'multicore',0,'merge',0, 'density',1);
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: S_range
        function S_rangeValueChanged(app, event)
            value = app.S_range.Value;
            app.params.s_lambda_range=value;
        end

        % Value changed function: S_min
        function S_minValueChanged(app, event)
            value = app.S_min.Value;
            app.params.s_lambda_min=value;
        end

        % Value changed function: S_max
        function S_maxValueChanged(app, event)
            value = app.S_max.Value;
            app.params.s_lambda_max=value;
        end

        % Callback function
        function P_rangeValueChanged(app, event)
            %value = app.P_range.Value;
            %app.params.p_lambda_count=value;
            %ChangeModel(app, event);
        end

        % Value changed function: P_min
        function P_minValueChanged(app, event)
            value = app.P_min.Value;
            app.params.p_lambda_min=value;
        end

        % Value changed function: P_max
        function P_maxValueChanged(app, event)
            value = app.P_max.Value;
            app.params.p_lambda_max=value;
        end

        % Callback function
        function ContinueButtonPushed(app, event)
            params = app.params;
            save('parameters.mat','params');
            closereq
        end

        % Callback function
        function HypergraphButtonGroupSelectionChanged(app, event)
            selectedButton = app.HypergraphButtonGroup.SelectedObject;
            app.params.full_structure = selectedButton.NewValue;
        end

        % Callback function
        function ConstrainEdgesButtonGroupSelectionChanged(app, event)
            selectedButton = app.ConstrainEdgesButtonGroup.SelectedObject;
            app.params.hyperedges=selectedButtonn.NewValue;
        end

        % Callback function
        function HypergraphButtonGroupSizeChanged(app, event)
            position = app.HypergraphButtonGroup.Position;
            
        end

        % Callback function
        function MethodButtonGroupSelectionChanged(app, event)
            selectedButton = app.MethodButtonGroup.SelectedObject;
            app.params.optimization=selectedButton.NewValue;
        end

        % Callback function
        function ValidationDropDownValueChanged(app, event)
            value = app.ValidationDropDown.Value;
            app.params.valid=value;
        end

        % Callback function
        function NumShuffleEditFieldValueChanged(app, event)
            value = app.NumShuffleEditField.Value;
            app.params.num_shuffle=value;
        end

        % Value changed function: MaxIterationsEditField
        function ChangeMaxIt(app, event)
            value = app.MaxIterationsEditField.Value;
            app.params.BCFW_max_iterations=value;
        end

        % Value changed function: EpsilonEditField
        function ChangeEpsilon(app, event)
            value = app.EpsilonEditField.Value;
            app.params.BCFW_fval_epsilon=value;
        end

        % Value changed function: PrintIntervalEditField
        function ChangePrintInterval(app, event)
            value = app.PrintIntervalEditField.Value;
            app.params.printInterval = value;
        end

        % Value changed function: PrintTestEditField
        function ChangePrintTest(app, event)
            value = app.PrintTestEditField.Value;
            app.params.printTest=value;
        end

        % Value changed function: MaxTimeEditField_2
        function ChangeMaxTime(app, event)
            value = app.PrintDualityGapEditField.Value;
            app.params.MaxTime=value;
        end

        % Value changed function: NumberofStructuresEditField
        function ChangeStructures(app, event)
            value = app.NumberofStructuresEditField.Value;
            app.params.num_structures=value;
            ChangeModel(app, event);
        end

        % Value changed function: ReweightDenominatorDropDown
        function ChangeReweight(app, event)
            value = app.ReweightDenominatorDropDown.Value;
            if strcmp(value,'Mean Degree')
                app.params.reweight_demoninator = 'mean degree';
            elseif strcmp(value, 'Median Degree')
                app.params.reweight_demominatior = 'median degree';
            elseif strcmp(value, 'Max Degree')
                app.params.reweight_denominator = 'max degree';
            else
                app.params.reweight_denominator = 'rms degree';
            end
            app.params.reweight_denominator = value;
        end

        % Button pushed function: ContinueButton_2
        function ContinuePUSH(app, event)
            params=app.params;
            save('parameters.mat','params');
            closereq
            
        end

        % Value changed function: SplitEditField
        function ChangeSplit(app, event)
            value = app.SplitEditField.Value;
            app.params.split=value;
        end

        % Value changed function: EdgeConstraintsDropDown
        function ChangeUDF(app, event)
            value = app.EdgeConstraintsDropDown.Value;
            if strcmp(value,'No UDF-UDF')
                app.params.hyperedge=2;
            else
                app.params.hyperedge=1;
            end
        end

        % Value changed function: TotalNumberofModelsEditField
        function ChangeModel(app, event)
            %prange = app.P_range.Value;
            params=app.params;
            p_lambda_count = params.p_lambda_count;
            numstruct = app.NumberofStructuresEditField.Value;
            app.TotalNumberofModelsEditField.Value = p_lambda_count*numstruct;
      
        end

        % Value changed function: ParameterSamplingDropDown
        function ChangeSpace(app, event)
            value = app.ParameterSamplingDropDown.Value;
            if strcmp(value,'Log Space')
                app.params.logspace = 1;
            else
                app.params.logspace = 0;
            end
        end

        % Value changed function: Poolsize_num
        function Poolsize_numValueChanged(app, event)
            value = app.Poolsize_num.Value;
            app.params.poolsize=value;
        end

        % Value changed function: ParallelizationDropDown
        function ParallelizationDropDownValueChanged(app, event)
            value = app.ParallelizationDropDown.Value;
            if strcmp(value,'Single Core')
                app.params.multicore=0;
            elseif strcmp(value,'Multicore')
                app.params.multicore=1;
            else
                app.params.multicore=2;
            end
        end

        % Value changed function: MergeUDFNeuronalNodesCheckBox
        function Merge_Checked(app, event)
            value = app.MergeUDFNeuronalNodesCheckBox.Value;
            params=app.params;
            if value==1
                params.merge=1;
            else
                params.merge=0;
            end
            app.params=params;
        end

        % Value changed function: DensityConstraintEditField
        function DensityConstrained(app, event)
            value = app.DensityConstraintEditField.Value;
            params = app.params;
            params.density=value;
            app.params=params;
        end

        % Value changed function: P_Count, P_range
        function P_CountValueChanged(app, event)
            value = app.P_Count.Value;
            params = app.params;
            params.p_lambda_count=value;
            app.params=params;
            ChangeModel(app, event);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1000 716];
            app.UIFigure.Name = 'UI Figure';

            % Create StructuralLearningSLambdaLabel
            app.StructuralLearningSLambdaLabel = uilabel(app.UIFigure);
            app.StructuralLearningSLambdaLabel.FontName = 'Palatino';
            app.StructuralLearningSLambdaLabel.FontSize = 18;
            app.StructuralLearningSLambdaLabel.Position = [51 565 375 22];
            app.StructuralLearningSLambdaLabel.Text = 'Structural Learning: S Lambda';

            % Create RangeEditFieldLabel
            app.RangeEditFieldLabel = uilabel(app.UIFigure);
            app.RangeEditFieldLabel.FontName = 'Palatino';
            app.RangeEditFieldLabel.Position = [51 525 47 22];
            app.RangeEditFieldLabel.Text = 'Range';

            % Create S_range
            app.S_range = uieditfield(app.UIFigure, 'numeric');
            app.S_range.Limits = [0 Inf];
            app.S_range.ValueChangedFcn = createCallbackFcn(app, @S_rangeValueChanged, true);
            app.S_range.FontName = 'Palatino';
            app.S_range.Position = [107 525 317 22];
            app.S_range.Value = 100;

            % Create MinEditFieldLabel
            app.MinEditFieldLabel = uilabel(app.UIFigure);
            app.MinEditFieldLabel.FontName = 'Palatino';
            app.MinEditFieldLabel.Position = [49 485 47 22];
            app.MinEditFieldLabel.Text = 'Min';

            % Create S_min
            app.S_min = uieditfield(app.UIFigure, 'numeric');
            app.S_min.Limits = [0 Inf];
            app.S_min.ValueChangedFcn = createCallbackFcn(app, @S_minValueChanged, true);
            app.S_min.FontName = 'Palatino';
            app.S_min.Position = [107 485 317 22];
            app.S_min.Value = 1e-10;

            % Create MaxEditFieldLabel
            app.MaxEditFieldLabel = uilabel(app.UIFigure);
            app.MaxEditFieldLabel.FontName = 'Palatino';
            app.MaxEditFieldLabel.Position = [51 447 47 22];
            app.MaxEditFieldLabel.Text = 'Max';

            % Create S_max
            app.S_max = uieditfield(app.UIFigure, 'numeric');
            app.S_max.Limits = [0 Inf];
            app.S_max.ValueChangedFcn = createCallbackFcn(app, @S_maxValueChanged, true);
            app.S_max.FontName = 'Palatino';
            app.S_max.Position = [107 447 317 22];
            app.S_max.Value = 0.5;

            % Create ParameterEstimationPLambdaLabel
            app.ParameterEstimationPLambdaLabel = uilabel(app.UIFigure);
            app.ParameterEstimationPLambdaLabel.FontName = 'Palatino';
            app.ParameterEstimationPLambdaLabel.FontSize = 18;
            app.ParameterEstimationPLambdaLabel.Position = [51 305 375 22];
            app.ParameterEstimationPLambdaLabel.Text = 'Parameter Estimation: P Lambda';

            % Create RangeEditField_2Label
            app.RangeEditField_2Label = uilabel(app.UIFigure);
            app.RangeEditField_2Label.FontName = 'Palatino';
            app.RangeEditField_2Label.Position = [51 278 47 22];
            app.RangeEditField_2Label.Text = 'Range';

            % Create P_range
            app.P_range = uieditfield(app.UIFigure, 'numeric');
            app.P_range.Limits = [0 Inf];
            app.P_range.ValueChangedFcn = createCallbackFcn(app, @P_CountValueChanged, true);
            app.P_range.FontName = 'Palatino';
            app.P_range.Position = [107 278 314 22];
            app.P_range.Value = 10;

            % Create MinEditField_2Label
            app.MinEditField_2Label = uilabel(app.UIFigure);
            app.MinEditField_2Label.FontName = 'Palatino';
            app.MinEditField_2Label.Position = [55 246 47 22];
            app.MinEditField_2Label.Text = 'Min';

            % Create P_min
            app.P_min = uieditfield(app.UIFigure, 'numeric');
            app.P_min.Limits = [0 Inf];
            app.P_min.ValueChangedFcn = createCallbackFcn(app, @P_minValueChanged, true);
            app.P_min.FontName = 'Palatino';
            app.P_min.Position = [107 246 314 22];
            app.P_min.Value = 10;

            % Create MaxEditField_2Label
            app.MaxEditField_2Label = uilabel(app.UIFigure);
            app.MaxEditField_2Label.FontName = 'Palatino';
            app.MaxEditField_2Label.Position = [51 213 47 22];
            app.MaxEditField_2Label.Text = 'Max';

            % Create P_max
            app.P_max = uieditfield(app.UIFigure, 'numeric');
            app.P_max.Limits = [0 Inf];
            app.P_max.ValueChangedFcn = createCallbackFcn(app, @P_maxValueChanged, true);
            app.P_max.FontName = 'Palatino';
            app.P_max.Position = [107 213 314 22];
            app.P_max.Value = 1000000;

            % Create ParameterSamplingDropDownLabel
            app.ParameterSamplingDropDownLabel = uilabel(app.UIFigure);
            app.ParameterSamplingDropDownLabel.Position = [51 365 115 22];
            app.ParameterSamplingDropDownLabel.Text = 'Parameter Sampling';

            % Create ParameterSamplingDropDown
            app.ParameterSamplingDropDown = uidropdown(app.UIFigure);
            app.ParameterSamplingDropDown.Items = {'Log Space', 'Linear Space'};
            app.ParameterSamplingDropDown.ValueChangedFcn = createCallbackFcn(app, @ChangeSpace, true);
            app.ParameterSamplingDropDown.Position = [181 365 240 22];
            app.ParameterSamplingDropDown.Value = 'Log Space';

            % Create MaxIterationsEditFieldLabel
            app.MaxIterationsEditFieldLabel = uilabel(app.UIFigure);
            app.MaxIterationsEditFieldLabel.Position = [541 315 81 22];
            app.MaxIterationsEditFieldLabel.Text = 'Max Iterations';

            % Create MaxIterationsEditField
            app.MaxIterationsEditField = uieditfield(app.UIFigure, 'numeric');
            app.MaxIterationsEditField.ValueChangedFcn = createCallbackFcn(app, @ChangeMaxIt, true);
            app.MaxIterationsEditField.Position = [661 315 290 22];
            app.MaxIterationsEditField.Value = 75000;

            % Create EpsilonEditFieldLabel
            app.EpsilonEditFieldLabel = uilabel(app.UIFigure);
            app.EpsilonEditFieldLabel.Position = [541 275 45 22];
            app.EpsilonEditFieldLabel.Text = 'Epsilon';

            % Create EpsilonEditField
            app.EpsilonEditField = uieditfield(app.UIFigure, 'numeric');
            app.EpsilonEditField.ValueChangedFcn = createCallbackFcn(app, @ChangeEpsilon, true);
            app.EpsilonEditField.Position = [661 275 290 22];
            app.EpsilonEditField.Value = 0.1;

            % Create PrintIntervalEditFieldLabel
            app.PrintIntervalEditFieldLabel = uilabel(app.UIFigure);
            app.PrintIntervalEditFieldLabel.Position = [541 235 73 22];
            app.PrintIntervalEditFieldLabel.Text = 'Print Interval';

            % Create PrintIntervalEditField
            app.PrintIntervalEditField = uieditfield(app.UIFigure, 'numeric');
            app.PrintIntervalEditField.ValueChangedFcn = createCallbackFcn(app, @ChangePrintInterval, true);
            app.PrintIntervalEditField.Position = [661 235 290 22];
            app.PrintIntervalEditField.Value = 1000;

            % Create PrintTestEditFieldLabel
            app.PrintTestEditFieldLabel = uilabel(app.UIFigure);
            app.PrintTestEditFieldLabel.Position = [541 195 56 22];
            app.PrintTestEditFieldLabel.Text = 'Print Test';

            % Create PrintTestEditField
            app.PrintTestEditField = uieditfield(app.UIFigure, 'numeric');
            app.PrintTestEditField.ValueChangedFcn = createCallbackFcn(app, @ChangePrintTest, true);
            app.PrintTestEditField.Position = [661 195 290 22];
            app.PrintTestEditField.Value = 100;

            % Create PrintDualityGapEditFieldLabel
            app.PrintDualityGapEditFieldLabel = uilabel(app.UIFigure);
            app.PrintDualityGapEditFieldLabel.Position = [541 155 96 22];
            app.PrintDualityGapEditFieldLabel.Text = 'Print Duality Gap';

            % Create PrintDualityGapEditField
            app.PrintDualityGapEditField = uieditfield(app.UIFigure, 'numeric');
            app.PrintDualityGapEditField.Limits = [0 1];
            app.PrintDualityGapEditField.Position = [661 155 290 22];
            app.PrintDualityGapEditField.Value = 1;

            % Create NumberofStructuresEditFieldLabel
            app.NumberofStructuresEditFieldLabel = uilabel(app.UIFigure);
            app.NumberofStructuresEditFieldLabel.Position = [51 55 120 22];
            app.NumberofStructuresEditFieldLabel.Text = 'Number of Structures';

            % Create NumberofStructuresEditField
            app.NumberofStructuresEditField = uieditfield(app.UIFigure, 'numeric');
            app.NumberofStructuresEditField.ValueChangedFcn = createCallbackFcn(app, @ChangeStructures, true);
            app.NumberofStructuresEditField.Position = [201 55 220 22];
            app.NumberofStructuresEditField.Value = 8;

            % Create ReweightDenominatorDropDownLabel
            app.ReweightDenominatorDropDownLabel = uilabel(app.UIFigure);
            app.ReweightDenominatorDropDownLabel.Position = [541 435 128 22];
            app.ReweightDenominatorDropDownLabel.Text = 'Reweight Denominator';

            % Create ReweightDenominatorDropDown
            app.ReweightDenominatorDropDown = uidropdown(app.UIFigure);
            app.ReweightDenominatorDropDown.Items = {'Mean Degree', 'Median Degree', 'Max Degree', 'RMS Degree'};
            app.ReweightDenominatorDropDown.ValueChangedFcn = createCallbackFcn(app, @ChangeReweight, true);
            app.ReweightDenominatorDropDown.Position = [677 435 274 22];
            app.ReweightDenominatorDropDown.Value = 'Mean Degree';

            % Create ContinueButton_2
            app.ContinueButton_2 = uibutton(app.UIFigure, 'push');
            app.ContinueButton_2.ButtonPushedFcn = createCallbackFcn(app, @ContinuePUSH, true);
            app.ContinueButton_2.Position = [900 4 100 22];
            app.ContinueButton_2.Text = 'Continue';

            % Create SplitEditFieldLabel
            app.SplitEditFieldLabel = uilabel(app.UIFigure);
            app.SplitEditFieldLabel.Position = [51 95 29 22];
            app.SplitEditFieldLabel.Text = 'Split';

            % Create SplitEditField
            app.SplitEditField = uieditfield(app.UIFigure, 'numeric');
            app.SplitEditField.ValueChangedFcn = createCallbackFcn(app, @ChangeSplit, true);
            app.SplitEditField.Position = [201 95 220 22];
            app.SplitEditField.Value = 0.8;

            % Create EdgeConstraintsDropDownLabel
            app.EdgeConstraintsDropDownLabel = uilabel(app.UIFigure);
            app.EdgeConstraintsDropDownLabel.Position = [51 405 98 22];
            app.EdgeConstraintsDropDownLabel.Text = 'Edge Constraints';

            % Create EdgeConstraintsDropDown
            app.EdgeConstraintsDropDown = uidropdown(app.UIFigure);
            app.EdgeConstraintsDropDown.Items = {'No UDF-UDF', 'All Edges Allowed'};
            app.EdgeConstraintsDropDown.ValueChangedFcn = createCallbackFcn(app, @ChangeUDF, true);
            app.EdgeConstraintsDropDown.Position = [165 405 256 22];
            app.EdgeConstraintsDropDown.Value = 'No UDF-UDF';

            % Create TotalNumberofModelsEditFieldLabel
            app.TotalNumberofModelsEditFieldLabel = uilabel(app.UIFigure);
            app.TotalNumberofModelsEditFieldLabel.Position = [51 15 132 22];
            app.TotalNumberofModelsEditFieldLabel.Text = 'Total Number of Models';

            % Create TotalNumberofModelsEditField
            app.TotalNumberofModelsEditField = uieditfield(app.UIFigure, 'numeric');
            app.TotalNumberofModelsEditField.ValueChangedFcn = createCallbackFcn(app, @ChangeModel, true);
            app.TotalNumberofModelsEditField.Position = [198 15 223 22];
            app.TotalNumberofModelsEditField.Value = 80;

            % Create SelectModelingParametersLabel
            app.SelectModelingParametersLabel = uilabel(app.UIFigure);
            app.SelectModelingParametersLabel.HorizontalAlignment = 'center';
            app.SelectModelingParametersLabel.FontSize = 72;
            app.SelectModelingParametersLabel.Position = [1 599 1000 88];
            app.SelectModelingParametersLabel.Text = 'Select Modeling Parameters';

            % Create GlobalModelingParametersLabel
            app.GlobalModelingParametersLabel = uilabel(app.UIFigure);
            app.GlobalModelingParametersLabel.FontName = 'Palatino';
            app.GlobalModelingParametersLabel.FontSize = 18;
            app.GlobalModelingParametersLabel.Position = [51 135 375 22];
            app.GlobalModelingParametersLabel.Text = 'Global Modeling Parameters';

            % Create PartitionFunctionLabel
            app.PartitionFunctionLabel = uilabel(app.UIFigure);
            app.PartitionFunctionLabel.FontName = 'Palatino';
            app.PartitionFunctionLabel.FontSize = 18;
            app.PartitionFunctionLabel.Position = [541 565 375 22];
            app.PartitionFunctionLabel.Text = 'Partition Function';

            % Create reweightdenominatorDropDown_2
            app.reweightdenominatorDropDown_2 = uidropdown(app.UIFigure);
            app.reweightdenominatorDropDown_2.Items = {'Bethe Approximation', 'Bethe+JTA'};
            app.reweightdenominatorDropDown_2.Position = [541 525 410 22];
            app.reweightdenominatorDropDown_2.Value = 'Bethe Approximation';

            % Create BlockCoordinateFrankeWolfeLabel
            app.BlockCoordinateFrankeWolfeLabel = uilabel(app.UIFigure);
            app.BlockCoordinateFrankeWolfeLabel.FontName = 'Palatino';
            app.BlockCoordinateFrankeWolfeLabel.FontSize = 18;
            app.BlockCoordinateFrankeWolfeLabel.Position = [541 355 375 22];
            app.BlockCoordinateFrankeWolfeLabel.Text = 'Block-Coordinate Franke-Wolfe';

            % Create ReweightingLabel
            app.ReweightingLabel = uilabel(app.UIFigure);
            app.ReweightingLabel.FontName = 'Palatino';
            app.ReweightingLabel.FontSize = 18;
            app.ReweightingLabel.Position = [541 475 375 22];
            app.ReweightingLabel.Text = 'Reweighting';

            % Create OvercompletionDebugDropDownLabel
            app.OvercompletionDebugDropDownLabel = uilabel(app.UIFigure);
            app.OvercompletionDebugDropDownLabel.Position = [541 395 128 22];
            app.OvercompletionDebugDropDownLabel.Text = 'Overcompletion Debug';

            % Create OvercompletionDebugDropDown
            app.OvercompletionDebugDropDown = uidropdown(app.UIFigure);
            app.OvercompletionDebugDropDown.Items = {'No', 'Check Stuck'};
            app.OvercompletionDebugDropDown.Position = [677 395 274 22];
            app.OvercompletionDebugDropDown.Value = 'No';

            % Create MaxTimeEditField_2Label
            app.MaxTimeEditField_2Label = uilabel(app.UIFigure);
            app.MaxTimeEditField_2Label.Position = [541 115 58 22];
            app.MaxTimeEditField_2Label.Text = 'Max Time';

            % Create MaxTimeEditField_2
            app.MaxTimeEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.MaxTimeEditField_2.ValueChangedFcn = createCallbackFcn(app, @ChangeMaxTime, true);
            app.MaxTimeEditField_2.Position = [661 115 290 22];
            app.MaxTimeEditField_2.Value = Inf;

            % Create ParallelizationDropDownLabel
            app.ParallelizationDropDownLabel = uilabel(app.UIFigure);
            app.ParallelizationDropDownLabel.Position = [541 75 80 22];
            app.ParallelizationDropDownLabel.Text = 'Parallelization';

            % Create ParallelizationDropDown
            app.ParallelizationDropDown = uidropdown(app.UIFigure);
            app.ParallelizationDropDown.Items = {'Single Core', 'Multicore', 'Cluster'};
            app.ParallelizationDropDown.ValueChangedFcn = createCallbackFcn(app, @ParallelizationDropDownValueChanged, true);
            app.ParallelizationDropDown.Position = [661 75 290 22];
            app.ParallelizationDropDown.Value = 'Single Core';

            % Create PS_Label
            app.PS_Label = uilabel(app.UIFigure);
            app.PS_Label.FontName = 'Palatino';
            app.PS_Label.Position = [541 35 56 22];
            app.PS_Label.Text = 'Pool Size';

            % Create Poolsize_num
            app.Poolsize_num = uieditfield(app.UIFigure, 'numeric');
            app.Poolsize_num.Limits = [0 Inf];
            app.Poolsize_num.ValueChangedFcn = createCallbackFcn(app, @Poolsize_numValueChanged, true);
            app.Poolsize_num.FontName = 'Palatino';
            app.Poolsize_num.Position = [661 35 290 22];
            app.Poolsize_num.Value = 8;

            % Create MergeUDFNeuronalNodesCheckBox
            app.MergeUDFNeuronalNodesCheckBox = uicheckbox(app.UIFigure);
            app.MergeUDFNeuronalNodesCheckBox.ValueChangedFcn = createCallbackFcn(app, @Merge_Checked, true);
            app.MergeUDFNeuronalNodesCheckBox.Text = 'Merge UDF & Neuronal Nodes';
            app.MergeUDFNeuronalNodesCheckBox.Position = [49 334 457 22];

            % Create DensityConstraintEditFieldLabel
            app.DensityConstraintEditFieldLabel = uilabel(app.UIFigure);
            app.DensityConstraintEditFieldLabel.HorizontalAlignment = 'right';
            app.DensityConstraintEditFieldLabel.Position = [241 336 104 22];
            app.DensityConstraintEditFieldLabel.Text = 'Density Constraint';

            % Create DensityConstraintEditField
            app.DensityConstraintEditField = uieditfield(app.UIFigure, 'numeric');
            app.DensityConstraintEditField.Limits = [0 1];
            app.DensityConstraintEditField.ValueChangedFcn = createCallbackFcn(app, @DensityConstrained, true);
            app.DensityConstraintEditField.Position = [360 336 63 22];
            app.DensityConstraintEditField.Value = 1;

            % Create CountLabel
            app.CountLabel = uilabel(app.UIFigure);
            app.CountLabel.FontName = 'Palatino';
            app.CountLabel.Position = [52 176 47 22];
            app.CountLabel.Text = 'Count';

            % Create P_Count
            app.P_Count = uieditfield(app.UIFigure, 'numeric');
            app.P_Count.Limits = [0 Inf];
            app.P_Count.ValueChangedFcn = createCallbackFcn(app, @P_CountValueChanged, true);
            app.P_Count.FontName = 'Palatino';
            app.P_Count.Position = [108 176 314 22];
            app.P_Count.Value = 2;

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUI_exported2

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

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