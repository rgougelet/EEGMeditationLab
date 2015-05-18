files = dir('Q:\EEG Meditation Lab\Meditation A Cable\');
files = files(3:end);
for file = files'
 
    EEG = pop_biosig(strcat('Q:\EEG Meditation Lab\Meditation A Cable\',file.name));
    EEG = pop_resample( EEG, 256);
    EEG = pop_eegfiltnew(EEG, 0.5, 58.5, 1690, 0, [], 0);
    EEG = pop_select( EEG,'channel',{'A1' 'A2' 'A3' 'A4' 'A5' 'A6' 'A7' 'A8' 'A9' 'A10' 'A11' 'A12' 'A13' 'A14' 'A15' 'A16' 'A17' 'A18' 'A19' 'A20' 'A21' 'A22' 'A23' 'A24' 'A25' 'A26' 'A27' 'A28' 'A29' 'A30' 'A31' 'A32'}); 
    EEG = pop_saveset( EEG, 'filename',strcat(file.name(1:end-3),'set'),'filepath','E:\\EEGMeditationLab\\Preprocessed EEGs\\');

end