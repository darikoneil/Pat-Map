function f_DA_plot_potentials_distributions(app)

v = app.PlotModelEditField_PE.Value;
p_lambda =app.model_collection.models{v}.p_lambda;
s_lambda = app.model_collection.models{v}.s_lambda;
app.PLambdaModelEditField.Value = p_lambda;
app.SLambdaModelEditField.Value = s_lambda;
%newcolors = app.newcolors;

%% NODES FIRST
 weights = reshape(app.model_collection.models{v}.theta.node_potentials,[],1);
 weights(weights==0)=[];
 [f,x] = ksdensity(weights,'Function','pdf','Bandwidth',app.BandwidthEditField.Value,'Kernel','epanechnikov');
 plot(app.NodePE, x, f, 'LineWidth', 3);
 
%% EDGES FIRST
weights = reshape(app.model_collection.models{v}.theta.edge_potentials,[],1);
weights(weights==0)=[];
%[f,x] = ksdensity(weights,'Function','pdf');
 [f,x] = ksdensity(weights,'Function','pdf','Bandwidth',app.BandwidthEditField_2.Value,'Kernel','epanechnikov');
plot(app.EdgePE, x, f, 'LineWidth', 3);


 %% new colors
 newcolors = app.newcolors;
 app.NodePE.ColorOrder=newcolors;
 app.EdgePE.ColorOrder=newcolors;
end
