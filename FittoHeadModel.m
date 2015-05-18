files = dir('E:\EEGMeditationLab\Preprocessed EEGs\*.set');

for file = files'
    
    EEG = pop_loadset('filename','201M0B.set','filepath','E:\\EEGMeditationLab\\Preprocessed EEGs\\');
    EEG = pop_chanedit(EEG, 'lookup','C:\\Users\\Pineda\\Documents\\MATLAB\\eeglab\\plugins\\dipfit2.2\\standard_BESA\\standard-10-5-cap385.elp','load',{'C:\\Users\\Pineda\\Documents\\Standard-10-10-Cap32 (1).ced' 'filetype' 'autodetect'});
    EEG = pop_saveset( EEG, 'filename',file.name,'filepath','E:\\EEGMeditationLab\\Preprocessed EEGs\\');

end

    