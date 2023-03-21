function [gcc,lcc] = f_DA_find_cluster_prop(app)

[gcc] = find_global_cluster_coeff(app.best_model.structure);
[lcc] = find_local_cluster_coeff(app.best_model.structure);

end