
function [PCNs,PAPS_INDEXED] = PAPS_score(best_model,results,params)

%import relevant information
data=params.data;
UDF=params.UDF;
num_neur = size(data,2);
num_ens = params.UDF_Count;
ens = results.core_crf;
ENS_STATE = cell(1,num_ens);

node_str=results.epsum(1:num_neur);
degrees = sum(best_model.structure(1:num_neur,1:num_neur));
auc=results.auc(1:num_neur,:);
edge_potentials = best_model.theta.edge_potentials(1:num_neur,1:num_neur);

for i = 1:num_ens
    ENS_STATE{i}=auc(:,i);
    ENS_STATE{i}=round(ENS_STATE{i});
    size_ens{i}=sum(ENS_STATE{i});
    ENS_STATE{i}=ENS_STATE{i}.*transpose((1:num_neur));
    ENS_STATE{i}(ENS_STATE{i}==0)=[];
end

nsmi = []; %min node str
nsma = []; %max node str
nS = []; %min max norm node str
auc2 = []; %auc by ens

PAPS_INDEXED = cell(2,num_ens); %INDEX OF PAPS BY ENS
PCNs = cell(1,num_ens);
for i = 1:num_ens
    
    nsmi= min(node_str([ENS_STATE{i}]));
    nsma = max(node_str([ENS_STATE{i}]));
    nS = results.epsum;
    %nS = transpose((node_str([ENS_STATE{i}])-nsmi)./(nsma-nsmi));
        
    auc2 = auc([ENS_STATE{i}],i);
    auc2=transpose(auc2);
    
    PCNs{i} = find((nS>(nanmean(nS)+nanstd(nS)))&(auc2>(mean(auc2)+std(auc2))));
    
    %PAPS_INDEXED{1,i}=ENS_STATE{i};
    %for ii = 1:length(ENS_STATE{i})
        %PAPS = @(Ni) (nS(Ni)+auc2(Ni))/2;
        %PAPS_INDEXED{2,i}=[PAPS_INDEXED{2,i} PAPS(ii)];
        %PAPS_INDEXED{2,i}(isnan(PAPS_INDEXED{2,i}))=0;
    %end
end

%Now select only the top p% of each ensemble OR above X standard deviations
%PCNs = cell(1,num_ens);
%for i = 1:num_ens
  %  idx = find(PAPS_INDEXED{2,i}>((mean(PAPS_INDEXED{2,i})+std(PAPS_INDEXED{2,i}))));
    %[Mk,idx] = maxk(PAPS_INDEXED{2,i},round(0.07*length(PAPS_INDEXED{2,i})));
 %   PCNs{i} = transpose(PAPS_INDEXED{1,i}(idx));
%end

end