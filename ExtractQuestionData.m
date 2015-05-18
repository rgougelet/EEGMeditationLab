% Import the file
newData1 = importdata('E:\Grayson\questions.csv');

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

data(:,[1,6, 11, 16]) = [];
data(31:39,:) = [];
clear newData1 i vars;

cohen_controls0 = data(1:10,(1:4)+4);
pmiaw_controls0 = data(11:20,(1:4)+4);
pmiac_controls0 = data(21:30,(1:4)+4);

cohen_controls1 = data(1:10,(1:4)+12);
pmiaw_controls1 = data(11:20,(1:4)+12);
pmiac_controls1 = data(21:30,(1:4)+12);

cohen_meditators0 = data(1:10,(1:4));
pmiaw_meditators0 = data(11:20,(1:4));
pmiac_meditators0 = data(21:30,(1:4));

cohen_meditators1 = data(1:10,(1:4)+4);
pmiaw_meditators1 = data(11:20,(1:4)+4);
pmiac_meditators1 = data(21:30,(1:4)+4);

textdata = reshape({textdata{2:31,:}},30,2);
clear data