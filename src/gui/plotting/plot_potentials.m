function plot_potentials(app)

v = app.PlotModelEditField.Value;
p_lambda =app.model_collection.models{v}.p_lambda;
s_lambda = app.model_collection.models{v}.s_lambda;
%newcolors = app.newcolors;

%% NODES FIRST
 weights = reshape(app.model_collection.models{v}.theta.node_potentials,[],1);
 weights(weights==0)=[];
 if ~isempty(weights)
     [f,x] = ksdensity(weights,'Function','pdf','Bandwidth',app.BandwidthEditField.Value,'Kernel','epanechnikov');
     plot(app.node_weight_parameter_estimation, x, f, 'LineWidth', 3);
 else
     cla(app.node_weight_parameter_estimation);
 end
 
%% EDGES FIRST
weights = reshape(app.model_collection.models{v}.theta.edge_potentials,[],1);
weights(weights==0)=[];
%[f,x] = ksdensity(weights,'Function','pdf');
if ~isempty(weights)
     [f,x] = ksdensity(weights,'Function','pdf','Bandwidth',app.BandwidthEditField_2.Value,'Kernel','epanechnikov');
    plot(app.edge_weight_parameter_estimation, x, f, 'LineWidth', 3);
else
    cla(app.edge_weight_parameter_estimation);
end

 %% new colors
 newcolors = app.newcolors;
 app.node_weight_parameter_estimation.ColorOrder=newcolors;
 app.edge_weight_parameter_estimation.ColorOrder=newcolors;
end
