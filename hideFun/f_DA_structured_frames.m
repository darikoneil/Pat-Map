function f_DA_structured_frames(app)

% Function to visualize structured prediction by sorted frame
% Darik O'Neil 12-28-2021

%% Initialize
newcolors = [
      0.47 0.25 0.80
      0.25 0.80 0.54
      0.0745 0.6235 1.00
      1.00 0.0745 0.6510
      0.83 0.14 0.14
      1.00 0.54 0.00
      0.6510 0.6510 0.6510];
  
stimNum = app.SelectStimulus.Value;
results = app.results;
params = app.params;

ensembleIdx = results.core_crf{stimNum};
LL = results.LL_on(ensembleIdx,:); %grab framewise likelihood
LL=sum(LL); %sum to vector of scalar values
Thresh = results.thcell{stimNum,stimNum}; %grab threshold
true_labels = params.UDF(:,stimNum)';

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
line(app.PerformanceAxes,[1 length(LLC)],[Thresh Thresh], 'LineStyle','--','color','k','LineWidth',1);
hold(app.PerformanceAxes,'on');
area(app.PerformanceAxes,X,LLC,b,'FaceColor',[0.87,0.82,0.94], 'EdgeColor',[0.47 0.25 0.8],'FaceAlpha',1,'LineWidth',2,'EdgeAlpha',1);
line(app.PerformanceAxes,[1 length(LLC)],[Thresh Thresh], 'LineStyle','--','color','k','LineWidth',1);
% line(app.PerformanceAxes,[length(oneOne_LL) length(oneOne_LL)],[b a], 'LineStyle','-.','color', newcolors(3,:),'LineWidth',1);
% line(app.PerformanceAxes,[(length(oneOne_LL)+length(oneNil_LL)) (length(oneOne_LL)+length(oneNil_LL))],[b a], 'LineStyle','-.','color',newcolors(4,:),'LineWidth',1);
% line(app.PerformanceAxes,[(length(oneOne_LL)+length(oneNil_LL)+length(nilOne_LL)) (length(oneOne_LL)+length(oneNil_LL)+length(nilOne_LL))],[b a],'LineStyle','-.','color',newcolors(5,:),'LineWidth',1);
% Removed Darik 12-28-2021

% Plot Highlights

% Plot true pos highlights
LabelTP = ones(size(LL)).*b;
LabelTP((startIdx:(length(oneOne_LL))))=a;
area(app.PerformanceAxes,X,LabelTP,b,'FaceAlpha',0.25,'FaceColor',newcolors(2,:),'EdgeColor',newcolors(2,:),'EdgeAlpha',0);
line(app.PerformanceAxes,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);
startIdx = startIdx+length(oneOne_LL);
endAdj = startIdx-1;


% Plot false neg highlights
LabelFN = ones(size(LL)).*b;
LabelFN(startIdx:(endAdj+length(oneNil_LL)))=a;
area(app.PerformanceAxes,X,LabelFN,b,'FaceAlpha',0.25,'FaceColor',newcolors(4,:),'EdgeColor',newcolors(4,:),'EdgeAlpha',0);
line(app.PerformanceAxes,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);
startIdx = startIdx+length(oneNil_LL);
endAdj = startIdx-1;

% Plot false pos highlights
LabelFP = ones(size(LL)).*b;
LabelFP(startIdx:(endAdj+length(nilOne_LL)))=a;
area(app.PerformanceAxes,X,LabelFP,b,'FaceAlpha',0.25,'FaceColor',newcolors(5,:),'EdgeColor',newcolors(5,:),'EdgeAlpha',0);
line(app.PerformanceAxes,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);
startIdx = startIdx+length(nilOne_LL);
endAdj=startIdx-1;


% Plot true neg highlights
LabelTN = ones(size(LL)).*b;
LabelTN(startIdx:(endAdj+length(nilNil_LL)))=a;
area(app.PerformanceAxes,X,LabelTN,b,'FaceAlpha',0.25,'FaceColor',newcolors(3,:),'EdgeColor',newcolors(3,:),'EdgeAlpha',0);
line(app.PerformanceAxes,[startIdx startIdx],[b a], 'color','k','LineStyle','--','LineWidth',1);

hold(app.PerformanceAxes,'off');
app.PerformanceAxes.XLabel.String='Frame # (Sorted TP-FN-FP-TN)';
app.PerformanceAxes.YLabel.String='Log-Likelihood Ratio';
app.PerformanceAxes.Title.String='Structured Prediction Visualized';

axis(app.PerformanceAxes,'tight');

%grab and flip children
chi=get(app.PerformanceAxes, 'Children');
set(app.PerformanceAxes, 'Children', flipud(chi));
end

