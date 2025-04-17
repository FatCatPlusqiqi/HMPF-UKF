%% load name
state_name = {'S1-T1', 'S2-T1', 'S3-T1', 'S4-T1', 'S5-T1', ...
           'S1-T2', 'S2-T2', 'S3-T2', 'S4-T2', 'S5-T2'};
myLabel = cell(10);
for i = 1:10
  myLabel{i} = state_name(i);
end
%% load data
x5 = hmmstatesmapped;
%% plot it
figure;
myColorMap = lines(length(x5));
circularGraph(x5,'Colormap',myColorMap,'Label',myLabel);