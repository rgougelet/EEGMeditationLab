% runICA
cd('E:\EEGMeditationLab\Merged');

allSets = dir('*.set');
for n = 1:length(allSets)
    loadName = allSets(n).name;
    
    % load dataset
    EEG = pop_loadset('filename', loadName, 'filepath', pwd);
    
    %runICA
    EEG = pop_runica(EEG, 'icatype', 'sobi');
    
    W = EEG.icaweights;
    S = EEG.icasphere;
    cd 'E:\EEGMeditationLab\ICAweights';
    save(loadName(1:end-4), 'S', 'W');
    cd('E:\EEGMeditationLab\Merged');
    
    % save data
    pop_saveset(EEG, 'filename', loadName(1:end-4), 'filepath', 'E:\EEGMeditationLab\ICAsets');
end