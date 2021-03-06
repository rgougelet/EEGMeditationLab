%% Merge script

cd('E:\EEGMeditationLab\A3_Manual_Cleaned')

allSets = dir('*.set');

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
        if length(ALLEEG) ~= 3 % make sure has all three datasets, for each session, if not then skip subject
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
            ALLEEG(2) = pop_select(ALLEEG(2),'channel',newchans);
            ALLEEG(2).event = []; ALLEEG(2).urevent = [];
            ALLEEG(3) = pop_select(ALLEEG(3),'channel',newchans);
            ALLEEG(3).event = []; ALLEEG(3).urevent = [];
            EEG = eeg_checkset( EEG );
        end
        EEG = pop_mergeset( ALLEEG, [1  2  3], 0);
        % save data
        pop_saveset(EEG, 'filename', [subjectId{1},'_',sessionId{1}], 'filepath', 'E:\EEGMeditationLab\C_Merged');
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
    