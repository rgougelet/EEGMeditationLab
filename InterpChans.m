% InterpChans

% runICA
cd('E:\EEGMeditationLab\artifact rejected');

allSets = dir('*.set');
for n = 1:length(allSets)
    loadName = allSets(n).name;
    
    % load dataset
    EEG = pop_loadset('filename', loadName, 'filepath', pwd);
    load('E:\Grayson\32chans.mat')
    EEG = pop_interp(EEG, chans, 'spherical');
    
    if strcmp(EEG.filename,'105C0B.set') || strcmp(EEG.filename,'105C0M.set')
        continue
    end
    %epoch
    EEG = eeg_regepochs(EEG, 'recurrence', 2, 'limits', [0 2], 'rmbase', NaN, 'extractepochs', 'on');
    
    % save data
    pop_saveset(EEG, 'filename', loadName(1:end-4), 'filepath', 'E:\EEGMeditationLab\InterpSets');
end