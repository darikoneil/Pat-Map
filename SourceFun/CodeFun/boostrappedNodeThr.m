function [NodeThr]=boostrappedNodeThr(NodeScores)
NodeThr=zeros(1,3);
%remove NaN if necessary
NodeScores(isnan(NodeScores))=[];
bootstat = bootstrp(100,@customPrc,NodeScores);
NodeThr = mean(bootstat,1);
end
