%% Merge script

cd('E:\EEGMeditationLab\ASR_Cleaned')

allSets = dir('*.set');
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
for subjectId = {'104','105','107','210','211','212','213','103'}
    for sessionId = {'0','1'}
        subjectsets = {};
        for setIndex = 1:length(allSets)
            loadName = allSets(setIndex).name;
            subject = loadName(1:3);
            session = loadName(5);
            if strcmp(subjectId,subject) && strcmp(session,sessionId)
                subjectsets{end+1} = loadName;
            end
        end
        EEG = pop_loadset('filename', subjectsets, 'filepath', pwd);
        [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'study',0);
        if length(ALLEEG) ~= 3
            STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
            continue
%             newchans = intersect({ALLEEG(1).chanlocs.labels},{ALLEEG(2).chanlocs.labels});
%             ALLEEG(1) = pop_select(ALLEEG(1),'channel',newchans);
%             ALLEEG(2) = pop_select(ALLEEG(2),'channel',newchans);
%             EEG = eeg_checkset( EEG );
        end
        if length(ALLEEG) == 3
            newchans = intersect(intersect({ALLEEG(1).chanlocs.labels},{ALLEEG(2).chanlocs.labels}),{ALLEEG(3).chanlocs.labels});
            
            ALLEEG(1) = pop_select(ALLEEG(1),'channel',newchans);
            ALLEEG(1).event = []; ALLEEG(1).urevent = [];
            pop_saveset(ALLEEG(1), 'filename', ALLEEG(2).filename, 'filepath', 'E:\EEGMeditationLab\EqualChans');
            
            ALLEEG(2) = pop_select(ALLEEG(2),'channel',newchans);
            ALLEEG(2).event = []; ALLEEG(2).urevent = [];
            pop_saveset(ALLEEG(2), 'filename', ALLEEG(2).filename, 'filepath', 'E:\EEGMeditationLab\EqualChans');
            
            ALLEEG(3) = pop_select(ALLEEG(3),'channel',newchans);
            ALLEEG(3).event = []; ALLEEG(3).urevent = [];
            pop_saveset(ALLEEG(3), 'filename', ALLEEG(3).filename, 'filepath', 'E:\EEGMeditationLab\EqualChans');
            
%             EEG = eeg_checkset( EEG );
        end
        
        % save data
%         pop_saveset(EEG, 'filename', [subjectId{1},'_',sessionId{1}], 'filepath', 'E:\EEGMeditationLab\EqualChans');
        STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
    end
end




% 
%     for searchIndex = n:length(allSets)
%         searchName = allSets(n).name;
%         if strcmp(searchName,subject)
%             subjec
%         end
%     end
    