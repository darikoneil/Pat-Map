function f_DA_update_structPred_decoding(app,value)

%% Documentation Contents
% Darik O"Neil 1-12-2022
% Function to visualize decoding performance frame by frame (structured
% prediction)

%% Function Contents

%% Initialize
newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.9600 1.0000 0.4900
      0.6510 0.6510 0.6510];
  
cla(app.Structural_Prediction_Visualized_Decoding,'reset');
v=value;
results = app.results;
params = app.params;

LL = results.LL_on(size(params.data,2)+v,:); %grab framewise likelihood
Thresh = results.completePerf.thcell{v}; %grab threshold
true_labels = params.UDF(:,v)';

% make binary vector of LL over/under threshold
binLL = zeros(size(LL)); 
posIdx = find(LL>=Thresh);
binLL(posIdx)=1;

% preallocate indices of true pos / false neg / false pos / true neg 
% (form is label/prediction)
oneOne = [];
oneNil = [];
nilOne = [];
nilNil = [];

%% Find Indices
    for i = 1:length(true_labels)
        if (true_labels(i)==1)
            switch binLL(i)
                case 0
                    oneNil = [oneNil i];
                case 1
                    oneOne = [oneOne i];
            end
        else
            switch binLL(i)
                case 0
                    nilNil = [nilNil i];
                case 1
                    nilOne = [nilOne i];
            end
        end
    end
    
% Grab Indexed Values    
oneOne_LL = LL(oneOne);
oneNil_LL = LL(oneNil);
nilOne_LL = LL(nilOne);
nilNil_LL = LL(nilNil);

% Arrange the indexed values
[~,oneOne_I] = maxk(oneOne_LL,length(oneOne_LL));
[~,oneNil_I] = maxk(oneNil_LL,length(oneNil_LL));
[~,nilOne_I] = maxk(nilOne_LL,length(nilOne_LL));
[~,nilNil_I] = maxk(nilNil_LL,length(nilNil_LL));

% Compile
LLC = [oneOne_LL(oneOne_I) oneNil_LL(oneNil_I) nilOne_LL(nilOne_I) nilNil_LL(nilNil_I)];

%% Visualize

% formulate X-axis vector
X=1:length(LL);
% fine min/max for plotting
a = max(LL);
b = min(LL);
% Index highlights adjustments
startIdx = 1;
endAdj = 0;

% plot standard
line(app.Structural_Prediction_Visualized_Decoding,[1 length(LLC)],[Thresh Thresh], 'LineStyle','--','color','k','LineWidth',1);
hold(app.Structural_Prediction_Visualized_Decoding,'on');
area(app.Structural_Prediction_Visualized_Decoding,X,LLC,b,'FaceColor',[0.87,0.82,0.94], 'EdgeColor',[0.47 0.25 0.8],'FaceAlpha',1,'LineWidth',2,'EdgeAlpha',1);
line(app.Structural_Prediction_Visualized_Decoding,[1 length(LLC)],[Thresh Thresh], 'LineStyle','--','color','k','LineWidth',1);

% Plot Highlights

% Plot true pos highlights
LabelTP = ones(size(LL)).*b;
LabelTP((startIdx:(length(oneOne_LL))))=a;
area(app.Structural_Prediction_Visualized_Decoding,X,LabelTP,b,'FaceAlpha',0.25,'FaceColor',newcolors(2,:),'EdgeColor',newcolors(2,:),'EdgeAlpha',0);
line(app.Structural_Prediction_Visualized_Decoding,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);
startIdx = startIdx+length(oneOne_LL);
endAdj = startIdx-1;

% Plot false neg highlights
LabelFN = ones(size(LL)).*b;
LabelFN(startIdx:(endAdj+length(oneNil_LL)))=a;
area(app.Structural_Prediction_Visualized_Decoding,X,LabelFN,b,'FaceAlpha',0.25,'FaceColor',newcolors(4,:),'EdgeColor',newcolors(4,:),'EdgeAlpha',0);
line(app.Structural_Prediction_Visualized_Decoding,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);
startIdx = startIdx+length(oneNil_LL);
endAdj = startIdx-1;

% Plot false pos highlights
LabelFP = ones(size(LL)).*b;
LabelFP(startIdx:(endAdj+length(nilOne_LL)))=a;
area(app.Structural_Prediction_Visualized_Decoding,X,LabelFP,b,'FaceAlpha',0.25,'FaceColor',newcolors(7,:),'EdgeColor',newcolors(5,:),'EdgeAlpha',0);
line(app.Structural_Prediction_Visualized_Decoding,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);
startIdx = startIdx+length(nilOne_LL);
endAdj=startIdx-1;

% Plot true neg highlights
LabelTN = ones(size(LL)).*b;
LabelTN(startIdx:(endAdj+length(nilNil_LL)))=a;
area(app.Structural_Prediction_Visualized_Decoding,X,LabelTN,b,'FaceAlpha',0.25,'FaceColor',newcolors(3,:),'EdgeColor',newcolors(3,:),'EdgeAlpha',0);
line(app.Structural_Prediction_Visualized_Decoding,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);

hold(app.Structural_Prediction_Visualized_Decoding,'off');
app.Structural_Prediction_Visualized_Decoding.XLabel.String='Frame # (Sorted TP-FN-FP-TN)';
app.Structural_Prediction_Visualized_Decoding.YLabel.String='Log-Likelihood Ratio';
app.Structural_Prediction_Visualized_Decoding.Title.String='Structured Prediction Visualized';

axis(app.Structural_Prediction_Visualized_Decoding,'tight');

%grab and flip children
chi = get(app.Structural_Prediction_Visualized_Decoding,'Children');
set(app.Structural_Prediction_Visualized_Decoding,'Children',flipud(chi));
end

