function [ImData] = importImagingData(spike_prob,filename)
% Function to import imaging data for pattern completion
%
% Darik O'Neil, Rafael Yuste Laboratory, 12-20-2021
%
%Purpose: to prepare an ImData file for CRF analysis
%
% INPUT FORMATS
% spike_prob: spike probability (0-1) in the form neurons x frames 
% filename: imaging file (.mat)
%
% Imaging file format: 
% MUST CONTAIN:
% F: Fluorescent traces in the form ROIs x frame
% Fneu: Neuropil traces in the form ROIs x frame
% IC: Matrix indicating whether ROI is neuron & confidence score in the
% form ROIs x 2
% stat: structure of ROI statistics exported from Suite2P
% fops: structure of Suite2P parameters
%
% OUTPUTs:
%
% fTrace: corrected traces in the form frame x neuron
% dFoF: corrected change in fluorescence over baseline traces in the form
% frame x neuron
% ROI_contours: suub-structure containing the cells xpix, ypix, and
% boundedOutline. Each of these cells are a vector of flexible lengths. 
% ROI_bounds: 2 x 1 vector of scalar image bounds
% firingRate: firing rates in the form frame x neuron
% SNR: signal-to-noise ratio in the form neuron x SNR
% fr: scalar framerate
% TimeStamps: 1 x frame vector of TimeStamps
% 
% All Output are containing the structure ImData
%
% To accomplish this, we proceed in four steps
% (1, Load File)
% (2, Load Imaging Data)
% (3, Calculate SNR)
% (4, Calculate Firing Rate)
%
%% (1, Load File)
if nargin < 3
    filename = uigetfile('*.mat');
end

%Load Imaging File
load(filename);

%% (2, Load Imaging Data)

%Initialize
ImData = struct();
fr=fops.fs; %grab framerate
ImData.fr = fr; %store

%Grab Neuron Index
NeuronIndex = IC(:,1).*transpose(1:size(F,1));
NeuronIndex(NeuronIndex==0)=[];

%find fTrace
%first correct neuropil contamination
fTrace = zeros(size(F)); %pre-allocate
for i = 1:size(fTrace,1)
    fTrace(i,:) = correct_FT(F(i,:),Fneu(i,:));
end
[fTrace] = ad(15,fTrace,fr); %smooth/denoise
ImData.fTrace = transpose(fTrace(NeuronIndex,:)); %store to structure in correct form & constrain to only neuronal ROIs

%find dFoF
[dFoF] = prepCascade(fTrace,fr);
ImData.dFoF = transpose(dFoF(NeuronIndex,:)); %store to structure in correct form & constrain to only neuronal ROIs
RNdFoF= smoothANDrectify(dFoF); %normalize and rectify
ImData.RNdFoF = transpose(RNdFoF(NeuronIndex,:)); %store to structure & constrain to only neuronal ROIs

%Grab TimeStamps
ImData.TimeStamps = [(1:length(fTrace))]*(1/fr); %find timestamps by multiply frames x time per frame
%find ROI Contours
%grab bounds
ROI_bounds = [fops.Lx, fops.Ly];
%Make Substructure:
ROI_contours = struct();
ROI_contours.xpix = cell(1,length(NeuronIndex));
ROI_contours.ypix = cell(1,length(NeuronIndex));
ROI_contours.boundaryOutline = cell(1,length(NeuronIndex));
%Fill sub-structures
for i = 1:numel(NeuronIndex)
    ypix = (double(stat{NeuronIndex(i)}.ypix)+1);%.*double(~(stat{NeuronIndex(i)}.overlap)); % grab ypixels and zero overlaps
    xpix = (double(stat{NeuronIndex(i)}.xpix)+1);%.*double(~(stat{NeuronIndex(i)}.overlap)); %grab xpixels and zero overlaps
    %ypix(ypix==0)=[]; %remove overlaps
    %xpix(xpix==0)=[]; %remove overlaps
    boundaryOutlines = boundary(transpose(xpix),transpose(ypix)); %generate boundary outline
    ROI_contours.xpix{i}=xpix; %store xpix
    ROI_contours.ypix{i}=ypix; %store ypix
    ROI_contours.boundaryOutlines{i}=boundaryOutlines; %store boundary outlines
end
%correction
for i = 1:numel(NeuronIndex)
    ROI_contours.xpix{i}=ROI_contours.xpix{i}-1;
    ROI_contours.ypix{i}=ROI_contours.ypix{i}-1;
    ROI_contours.boundaryOutlines{i}=ROI_contours.boundaryOutlines{i};
end

%Store in structure
ImData.ROI_conoturs = ROI_contours;
ImData.ROI_bounds = ROI_bounds;

%% (3, Calculate SNR)
% Find SNR using findSNR function using the top 5 peaks of the fTrace
% constrained to five to the being in seperate events using the tau of the
% indicator

%first we find the appropriate lockout scale
tau = fops.tau; %grab tau
lockout = tau*fr; %lockout is the tau times the framerate
numPeaks = 5; %we'll calculate from five peaks
[SNR] = findSNR(fTrace, numPeaks, lockout);
ImData.SNR = SNR; %store

%% (4, Calculate firing rates)
[firingRates,~] = convSPR(spike_prob,fr); %find using convSPR function which takes the spike_prob and framerate (flagged to not return the binary matrix)
ImData.firingRates=firingRates; %store
end






