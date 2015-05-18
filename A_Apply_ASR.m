% An article about computational science in a scientic publication is
% not the scholarship itself, it is merely advertising of the scholarship.
% The actual scholarship is the complete software development environment
% and the complete set of instructions which generated the figures.
% Jon Claerbout (Geophysicist)
% From: WaveLab and Reproducible Research by Jonathan B. Buckheit and David L. Donoho

% 09/03/2014 Created.
cd('/data/mobi/Darts/Data/SET EEG/2-AnalogDigital Data')

allSets = dir('*.set');
for n = 1:length(allSets)
    loadName = allSets(n).name;
    
    % load dataset
    EEG = pop_loadset('filename', loadName, 'filepath', pwd);
    
    % exclude EXT7 EXT8
    EEG = pop_select( EEG,'nochannel',{'EXT7' 'EXT8'});
    
    % optimize head center
    EEG = pop_chanedit(EEG, 'eval','chans = pop_chancenter( chans, [],[]);');
    
    % perform 1-Hz high-pass filter
    EEG = pop_firws(EEG, 'fcutoff', 0.5, 'ftype', 'highpass', 'wtype', 'hamming', 'forder', 6760, 'minphase', 0);
    
    % apply cleanline
    EEG = pop_cleanline(EEG, 'bandwidth',2,'chanlist',1:EEG.nbchan ,'computepower',0,'linefreqs',[60:60:240] ,'normSpectrum',0,'p',0.01,'pad',2,'plotfigures',0,'scanforlines',1,'sigtype','Channels','tau',100,'verb',1,'winsize',4,'winstep',4);

    % apply Artifact Subspace Reconstruction
    EEG = clean_rawdata(EEG, 5, [-1], 0.8, 4, 20, 0.5);

    % save data
    pop_saveset(EEG, 'filename', loadName(1:end-4), 'filepath', '/data/mobi/Darts/makoto/cleanedSets');
end
    
    