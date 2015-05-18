files = dir('Q:\EEG Meditation Lab\Meditation A Cable\');
files = files(10:end);
for file = files'

   EEG = pop_biosig(strcat('Q:\EEG Meditation Lab\Meditation A Cable\',file.name)); 
%     EEG = pop_resample( EEG, 256);
%     EEG = pop_eegfiltnew(EEG, 0.5, 58.5, 1690, 0, [], 0);
    
    EEG = pop_select( EEG,'channel',{'A1' 'A2' 'A3' 'A4' 'A5' 'A6' 'A7' 'A8' 'A9' 'A10' 'A11' 'A12' 'A13' 'A14' 'A15' 'A16' 'A17' 'A18' 'A19' 'A20' 'A21' 'A22' 'A23' 'A24' 'A25' 'A26' 'A27' 'A28' 'A29' 'A30' 'A31' 'A32'}); 
    EEG = pop_chanedit(EEG, 'lookup','C:\\Users\\Pineda\\Documents\\MATLAB\\eeglab13_4_4b\\plugins\\dipfit2.2\\standard_BESA\\standard-10-5-cap385.elp','load',{'C:\\Users\\Pineda\\Documents\\Standard-10-10-Cap32 (1).ced' 'filetype' 'autodetect'});
    % optimize head center
    EEG = pop_chanedit(EEG, 'eval','chans = pop_chancenter( chans, [],[]);');
    
    % perform 1-Hz high-pass filter
    EEG = pop_firws(EEG, 'fcutoff', 0.5, 'ftype', 'highpass', 'wtype', 'hamming', 'forder', 6760, 'minphase', 0);
    
    % apply cleanline
    EEG = pop_cleanline(EEG, 'bandwidth',2,'chanlist',1:EEG.nbchan ,'computepower',0,'linefreqs',[60:60:240] ,'normSpectrum',0,'p',0.01,'pad',2,'plotfigures',0,'scanforlines',1,'sigtype','Channels','tau',100,'verb',1,'winsize',4,'winstep',4);

    % apply Artifact Subspace Reconstruction
    EEG = clean_rawdata(EEG, 5, [-1], 0.8, 4, 20, 0.5);
    
    % epoch data
%     EEG = eeg_regepochs(EEG, 'recurrence', 1, 'limits', [0 1], 'rmbase', NaN, 'extractepochs', 'on');

    % save dataset
    EEG = pop_saveset( EEG, 'filename',strcat(file.name(1:end-3),'set'),'filepath','E:\\EEGMeditationLab\\ASR\\');
end