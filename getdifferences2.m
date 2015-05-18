%Get differences #2 Baseline vs. Stillness
cd E:\EEGMeditationLab\Subraction_Meditation_Study_URC


meditators0S = [];
meditators1S = [];
controls0S = [];
controls1S = [];

for subject = { '213' , '211' , '210' , '212' , '103' , '104' , '105' , '107'}
    load('-mat', ['design3_',subject{1},'_Baseline_0.datspec'],'average_spec');
    load('-mat', ['design3_',subject{1},'_Baseline_0.datspec'],'freqs');
     baseline0 = average_spec;
    clear average_spec
    load('-mat', ['design3_',subject{1},'_Stillness_0.datspec'],'average_spec');
    subtraction0 = average_spec;
    clear average_spec
    difference0 = subtraction0 - baseline0;
    
 
 load('-mat', ['design3_',subject{1},'_Baseline_1.datspec'],'average_spec');
    load('-mat', ['design3_',subject{1},'_Baseline_1.datspec'],'freqs');
    baseline1 = average_spec;
    clear average_spec
    load('-mat', ['design3_',subject{1},'_Stillness_1.datspec'],'average_spec');
    subtraction1 = average_spec;
    clear average_spec
    difference1 = subtraction1 - baseline1;
    
    if subject{1}(1) == '2'
        meditators0S(end+1,:) = difference0;

        meditators1S(end+1,:) = difference1;
    end
    if subject{1}(1) == '1'
        controls0S(end+1,:) = difference0;

        controls1S(end+1,:) = difference1;
    end
    
end

 plot(freqs, difference1-difference0);