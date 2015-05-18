%% Takes raw bdf data and converts to highpass filtered, cleanlined, ASR'd, EEGLAB set and fdt files

files = dir('E:\EEGMeditationLab\A1_TempBDF\');
files = files(10:end);
for file = files'

    EEG = pop_biosig(strcat('E:\EEGMeditationLab\A1_TempBDF\',file.name));
%     EEG = pop_resample( EEG, 256);
%     EEG = pop_eegfiltnew(EEG, 0.5, 58.5, 1690, 0, [], 0);
    
    EEG = pop_select( EEG,'channel',{'C1' 'C2' 'C3' 'C4' 'C5' 'C6' 'C7' 'C8' 'C9' 'C10' 'C11' 'C12' 'C13' 'C14' 'C15' 'C16' 'C17' 'C18' 'C19' 'C20' 'C21' 'C22' 'C23' 'C24' 'C25' 'C26' 'C27' 'C28' 'C29' 'C30' 'C31' 'C32'}); 
    EEG = pop_chanedit(EEG, 'lookup','.\standard-10-5-cap385.elp','load',{'.\Standard-10-10-Cap32.ced' 'filetype' 'autodetect'});
    
    % optimize head center
    EEG = pop_chanedit(EEG, 'eval','chans = pop_chancenter( chans, [],[]);');
    
    % perform 1-Hz high-pass filter
    EEG = pop_firws(EEG, 'fcutoff', 0.5, 'ftype', 'highpass', 'wtype', 'hamming', 'forder', 6760, 'minphase', 0);
    
    % apply cleanline
    EEG = pop_cleanline(EEG, 'bandwidth',2,'chanlist',1:EEG.nbchan ,'computepower',0,'linefreqs',[60:60:240] ,'normSpectrum',0,'p',0.01,'pad',2,'plotfigures',0,'scanforlines',1,'sigtype','Channels','tau',100,'verb',1,'winsize',4,'winstep',4);

    % apply Artifact Subspace Reconstruction
    EEG = clean_rawdata(EEG, 5, [-1], 0.8, 4, 20, 0.5);
    
    % epoch data
    EEG = eeg_regepochs(EEG, 'recurrence', 1, 'limits', [0 1], 'rmbase', NaN, 'extractepochs', 'on');

    % save dataset
    EEG = pop_saveset( EEG, 'filename',strcat(file.name(1:end-3),'set'),'filepath','E:\\EEGMeditationLab\\A2_ASR_Epoched\\');
end