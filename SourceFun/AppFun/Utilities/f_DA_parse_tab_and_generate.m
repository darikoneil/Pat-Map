function f_DA_parse_tab_and_generate(app)
%need 4 speed bois
% this function creates the tab figures as needy to make things snappier

tabString = app.TabGroup.SelectedTab.Title;
formerCase = app.formerCase;
%% First Destroy
switch formerCase
    case 'IO'
        delete(app.ROIPreview);
        delete(app.DataPreview);
        formerCase = 'IO';
    case 'Structural Learning'
        delete(app.MaxSL);
        delete(app.MeanSL);
        delete(app.MedianSL);
        delete(app.RMSSL);
        delete(app.ComplexitySL);
        delete(app.ParameterSpace);
        delete(app.TestSL);
        delete(app.TrainSL);
        delete(app.PreviewSL);
    case 'Parameter Estimation'
        delete(app.TrainPE);
        delete(app.TestPE);
        delete(app.ParameterSpace_PE);
        delete(app.PreviewPE);
        delete(app.NodePE);
        delete(app.EdgePE);
    case 'Evaluate Model'
        delete(app.DecodingEM);
        delete(app.EvalModel1);
        delete(app.EvalModel2);
    case 'Identify Ensembles'
        delete(app.AucIdEns);
        delete(app.IdIdEns);
end
    

%% Now Construct
switch tabString
    case 'IO'
        f_DA_genComponent_ROIPreviews(app);
        f_DA_genComponent_DataPreviews(app);
        formerCase = 'IO';
    case 'Structural Learning'
        f_DA_genComponent_MaxSL(app);
        f_DA_genComponent_MeanSL(app);
        f_DA_genComponent_MedianSL(app);
        f_DA_genComponent_RMSSL(app);
        f_DA_genComponent_ComplexitySL(app);
        f_DA_genComponent_ParameterSpace(app);
        f_DA_genComponent_TestSL(app);
        f_DA_genComponent_TrainSL(app);
        f_DA_genComponent_PreviewSL(app);
        formerCase = 'Structural Learning';
    case 'Parameter Estimation'
        f_DA_genComponent_TrainPE(app);
        f_DA_genComponent_TestPE(app);
        f_DA_genComponent_ParameterSpace_PE(app);
        f_DA_genComponent_PreviewPE(app);
        f_DA_genComponent_EdgeWeight_PE(app);
        f_DA_genComponent_NodeWeight_PE(app);
        formerCase = 'Parameter Estimation';
    case 'Evaluate Model'
        f_DA_genComponent_DecodingEM(app);
        f_DA_genComponent_EvalModel1(app);
        f_DA_genComponent_EvalModel2(app);
        formerCase = 'Evaluate Model';
    case 'Identify Ensembles'
        f_DA_genComponent_AucIdEns(app);
        f_DA_genComponent_IdIdEns(app);
        formerCase = 'Identify Ensembles';
end

        
app.formerCase = formerCase;
end