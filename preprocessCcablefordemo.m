files = dir('Q:\EEG Meditation Lab\After 4-1-15');
files = files(3:end);

for file = files'

EEG = pop_biosig('Q:\EEG Meditation Lab\Anon Baseline.bdf');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG = pop_resample( EEG, 256);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'gui','off'); 
EEG = pop_eegfiltnew(EEG, 0.5, 58.5, 1690, 0, [], 0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'gui','off'); 
EEG = pop_select( EEG,'channel',{'C1' 'C2' 'C3' 'C4' 'C5' 'C6' 'C7' 'C8' 'C9' 'C10' 'C11' 'C12' 'C13' 'C14' 'C15' 'C16' 'C17' 'C18' 'C19' 'C20' 'C21' 'C22' 'C23' 'C24' 'C25' 'C26' 'C27' 'C28' 'C29' 'C30' 'C31' 'C32'});
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'gui','off'); 
EEG = pop_saveset( EEG, 'filename',strcat(file.name(1:end-3),'set'),'filepath','E:\\EEGMeditationLab\\Preprocessed EEGs\\');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

end