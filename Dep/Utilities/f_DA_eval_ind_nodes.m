function f_DA_eval_ind_nodes(app)

f_DA_update_log(app, 'Checking Memory Requirements');
[app.params.bigData, chunks] = checkMemoryRequirements(size(app.params.data,2)*size(app.params.data,2)*size(app.params.data,1));

if app.params.bigData
    f_DA_eval_ind_nodes_BIG(app, chunks);
else
    f_DA_eval_ind_nodes_ALL_IN_MEM(app);
    
end