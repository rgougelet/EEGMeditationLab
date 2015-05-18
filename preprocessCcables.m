files = dir('Q:\EEG Meditation Lab\Meditation C Cable\');
files = files(3:end);
for file = files'
 
    EEG = pop_biosig(strcat('Q:\EEG Meditation Lab\Meditation C Cable\',file.name));
%     EEG = pop_resample( EEG, 2048);
%     EEG = pop_eegfiltnew(EEG, 0.5, 58.5, 1690, 0, [], 0);
    EEG = pop_select( EEG,'channel',{'C1' 'C2' 'C3' 'C4' 'C5' 'C6' 'C7' 'C8' 'C9' 'C10' 'C11' 'C12' 'C13' 'C14' 'C15' 'C16' 'C17' 'C18' 'C19' 'C20' 'C21' 'C22' 'C23' 'C24' 'C25' 'C26' 'C27' 'C28' 'C29' 'C30' 'C31' 'C32'}); 
    EEG = pop_chanedit(EEG, 'lookup','C:\\Users\\Pineda\\Documents\\MATLAB\\eeglab\\plugins\\dipfit2.2\\standard_BESA\\standard-10-5-cap385.elp','load',{'C:\\Users\\Pineda\\Documents\\Standard-10-10-Cap32 (1).ced' 'filetype' 'autodetect'});
    EEG = clean_rawdata(EEG, 5, [0.25 0.75], 0.8, 4, 5, 0.5);
    EEG = pop_saveset( EEG, 'filename',strcat(file.name(1:end-3),'set'),'filepath','E:\\EEGMeditationLab\\Preprocessed EEGs\\');

end