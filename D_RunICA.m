% runICA
cd('E:\EEGMeditationLab\C_Merged');

allSets = dir('*.set');
for n = 1:length(allSets)
    loadName = allSets(n).name;
    
    % load dataset
    EEG = pop_loadset('filename', loadName, 'filepath', pwd);
    
    %runICA
    EEG = pop_runica(EEG, 'icatype', 'sobi');
    
    W = EEG.icaweights;
    S = EEG.icasphere;
    cd 'E:\EEGMeditationLab\D1_ICAweights';
    save(loadName(1:end-4), 'S', 'W');
    cd('E:\EEGMeditationLab\C_Merged');
    
    % save data
    pop_saveset(EEG, 'filename', loadName(1:end-4), 'filepath', 'E:\EEGMeditationLab\D2_ICAsets');
end