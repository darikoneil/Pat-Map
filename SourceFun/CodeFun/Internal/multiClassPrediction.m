function [multiclass]= multiClassPrediction(params,results)

%% Documentation Contents
% Darik O'Neil 1-13-2022
% Function for multiclass prediction

%% Function Contents


%% Initialize

%grab parameters and results
UDF_Count = params.UDF_Count; %UDF
thresholds = cell2mat(results.completePerf.thcell);
true_labels = params.UDF';
LL = results.LL_on((size(params.data,2)+1):(size(params.data,2)+UDF_Count),:);

%find number of classes to predict
predClassPos = UDF_Count+1; %Add one for null

%preallocate
Prediction = nan(1,size(params.UDF,1));
tmpIdx = zeros(1,UDF_Count);
ties = [];
%% Index threshold passes

for a = 1:length(Prediction)
    tmpIdx=zeros(1,UDF_Count);
    for b = 1:UDF_Count
        if LL(b,a)>thresholds(b)
            tmpIdx(b)=1;
        end
    end
    if sum(tmpIdx)>1
        [~,I] = max(LL(:,a));
        Prediction(a)=I;
        ties = [ties a];
    elseif sum(tmpIdx)==1
        Prediction(a)=find(tmpIdx==1);
    else
        Prediction(a) = predClassPos;
    end
end

%% Evaluate

%make multi-label truths
    multiLabel = true_labels.*(transpose([1:UDF_Count]));
    multiLabel = sum(multiLabel,1);
    multiLabel(multiLabel==0)=predClassPos;
%find true "ties"
    tiesR=sum(params.UDF,2);
    tiesIdx = find(tiesR>1);
    tiesR=tiesIdx;
%prune "ties"
    Prediction(tiesR)=[];
    multiLabel(tiesR)=[];
%find performance
    Performance = zeros(size(Prediction));
    for c = 1:length(Prediction)
        if Prediction(c)==multiLabel(c)
            Performance(c)=1;
        else
            Performance(c)=0;
        end
        %if Performance(c)==0 & multiLabel(c)==4
         %   Performance(c)=NaN;
        %end
        
    end
    
    %Ground Truth
    gTruth = true_labels.*transpose(1:UDF_Count); 
    %Remove Ties
    gTruth(:,tiesR)=[];
    gTruth=sum(gTruth,1);
    gTruth(gTruth==0)=predClassPos;
    
    %Multiclass Performance Analysis
    multiclass = classperf(gTruth,Prediction);
     
end



