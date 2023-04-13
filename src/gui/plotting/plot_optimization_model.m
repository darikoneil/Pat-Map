function [Stop] = plot_optimization_model(plot_axis, results, state)

Stop = false;  % for compatibility reasons

switch state
    case 'initial'
        cla(plot_axis);
        plot_axis.Color=[0.94 0.94 0.94];
        plot_axis.XTickMode='auto';
        plot_axis.YTickMode='auto';
        plot_axis.ZTickMode='auto';
        plot_axis.XTickLabelMode='auto';
        plot_axis.YTickLabelMode='auto';
        plot_axis.ZTickLabelMode='auto';
        %plot_axis.XLabel.String = results.VariableDescriptions(1).Name;
        %plot_axis.YLabel.String = results.VariableDescriptions(2).Name;
        plot_axis.XLabel.String = 'S-Lambda';
        plot_axis.YLabel.String = 'P-Lambda';
        plot_axis.Title.String = 'Hyperparameter Optimization';
        plot_axis.ZLabel.String = 'Validation Negative Log-Likelihood';
    case {'iteration', 'done'}
        x_space = linspace(results.VariableDescriptions(1).Range(1), results.VariableDescriptions(1).Range(2), 50);
        y_space = linspace(results.VariableDescriptions(2).Range(1), results.VariableDescriptions(2).Range(2), 50);

        [mesh_x, mesh_y] = meshgrid(x_space, y_space);

        eval_grid = array2table([mesh_x(:), mesh_y(:)], 'VariableNames', {results.VariableDescriptions(1).Name, results.VariableDescriptions(2).Name});

        eval_obj = predictObjective(results, eval_grid);
        eval_obj = reshape(eval_obj, 50, 50);

        plot_axis.NextPlot = 'replacechildren';

        mesh(plot_axis, mesh_x, mesh_y, eval_obj, 'FaceColor', 'interp', 'EdgeColor', 'black', 'FaceAlpha', 0.95, 'EdgeAlpha', 0.55);
        axis(plot_axis,'tight');

        hold(plot_axis, 'on');
        
        best_point = bestPoint(results);
        
        bpt = table2array(best_point);
        
        est_pt = results.XTrace;
        
        est_pred = predictObjective(results, est_pt);
        
        est_pt = table2array(est_pt);
        
        scatter3(plot_axis, est_pt(:, 1), est_pt(:, 2), est_pred, 50, 'Marker', 'x', 'MarkerEdgeColor', 'black', 'LineWidth', 1.5);
        
        scatter3(plot_axis, bpt(:, 1), bpt(:, 2), predictObjective(results, best_point), 100, 'Marker', '*', 'MarkerEdgeColor', 'red', 'LineWidth', 2);
        
        next_pt = table2array(results.NextPoint);
        
        scatter3(plot_axis, next_pt(:, 1), next_pt(:, 2), predictObjective(results, results.NextPoint), 75, 'Marker', 'o', 'MarkerEdgeColor', 'black', 'LineWidth', 1.5);
        
        % contour(plot_axis, mesh_x, mesh_y, eval_obj);
        
        %plot3(plot_axis, mesh_x, mesh_y, likelihood, '-o', 'MarkerSize', 5, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'black');

        %scatter3(plot_axis, x, y, z, 50, 'Marker', 'x', 'MarkerFaceColor','black', 'MarkerEdgeColor', 'black', 'LineWidth', 2);
        %plot3(plot_axis, x, y, z, '-o', 'MarkerSize', 5, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', 'black');

        %scatter3(plot_axis, b_x, b_y, b_z, 75, 'Marker', '*', 'MarkerFaceColor', 'red', 'MarkerEdgeColor', 'red', 'LineWidth', 2);

        hold(plot_axis, 'off');
        
        legend(plot_axis, {'Modeled Hyperparameter Space', 'Evaluation Points', 'Estimated Minima', 'Next Point'} , 'Location', 'best');
        colorbar(plot_axis);
    end


end
