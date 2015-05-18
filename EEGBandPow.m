%General Script for average frewquency band power. Modify variables within
%as necessary. Run this script from matlab command line by typing in
%EEGBandPow with your current folder as Grayson.

for chNum = 11;
%Must know the number of the channel for the electrode locations you have. In this case, 16 = C4.

%index the number of channels looped through to compute a mean average
pow = zeros(length(ALLEEG),1);

%The number datasest you want in eeglab if you have multiple datasets loaded. If only one dataset, then set x = 1.
for x = 1:length(ALLEEG)
    EEG = ALLEEG(1,x); %Updates current EEG file in eeglab.

    timeSeries = EEG.data(chNum,:)'; %Grabs entire time series for wanted channel.

    lo = 8; %Frequency cutoffs for the band
    hi = 12;
    temp = bandpower(timeSeries,EEG.srate,[lo hi]); %Calculates logpower from other script in folder. This finds the log normalized power of the frequency band at every time point.
    %Undo log, average for the entire timecourse, relog, and store. 
    temp = 10.^temp; 
    pow(x) = log10(sum(temp)/length(temp));
    
    %total the power from each channel
end
end
%pow %#ok<NOPTS> %Displays the average powers once finished. 
pow

