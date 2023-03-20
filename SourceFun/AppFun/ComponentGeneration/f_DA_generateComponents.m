function f_DA_generateComponents(app)

% IO TAB AXIS
f_DA_genComponent_ROIPreviews(app);
f_DA_genComponent_DataPreviews(app);

% STRUCTURAL LEARNING TAB AXIS
f_DA_genComponent_MaxSL(app);
f_DA_genComponent_MeanSL(app);
f_DA_genComponent_MedianSL(app);
f_DA_genComponent_RMSSL(app);
f_DA_genComponent_ComplexitySL(app);



f_DA_genComponent_ParameterSpace(app);
f_DA_genComponent_TestSL(app);
f_DA_genComponent_TrainSL(app);
f_DA_genComponent_PreviewSL(app);

% PARAMETER ESTIMATION TAB
f_DA_genComponent_TrainPE(app);
f_DA_genComponent_TestPE(app);
f_DA_genComponent_ParameterSpace_PE(app);
%f_DA_genComponent_PreviewPE(app);
f_DA_genComponent_EdgeWeight_PE(app);
f_DA_genComponent_NodeWeight_PE(app);

% EVALUATE MODEL
f_DA_genComponent_DecodingEM(app);
f_DA_genComponent_EvalModel1(app);
f_DA_genComponent_EvalModel2(app);

% IDENTIFY ENSEMBLES
f_DA_genComponent_AucIdEns(app);
f_DA_genComponent_IdIdEns(app);

% EVALUATE ENSEMBLES
f_DA_genComponent_AS(app);
f_DA_genComponent_AE(app);
f_DA_genComponent_NODE(app);
f_DA_genComponent_NEURON(app);
f_DA_genComponent_LINEAR(app);
%f_DA_genComponent_SIZEOPT(app);

% IDENTIFY PATTERN COMPLETION
f_DA_genComponent_PC1(app);
f_DA_genComponent_PC2(app);
f_DA_genComponent_PC3(app);
%f_DA_genComponent_PC4(app);
%f_DA_genComponent_PC5(app);

end
