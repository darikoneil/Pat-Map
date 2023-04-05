function [node_thr]=boostrapped_node_thr(node_scores)
node_thr=zeros(1,3);
%remove NaN if necessary
node_scores(isnan(node_scores))=[];
bootstat = bootstrp(100,@customPrc,node_scores);
node_thr = mean(bootstat,1);
end
