% ����
% ���������Զ������ֵ�б�
x_ticks = [75,76,77,78,79,80,81,82,83,84,85];     
y_ticks = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9];      

% ��ͼ
data = DifferKMResultsS2; % change it
figure;
h = bar3(data);

% ��ӱ�ǩ
xlabel('ms')
ylabel('kp')
zlabel('FPR') % change it

% ����������Ŀ̶Ⱥͱ�ǩ
set(gca, 'XTick', 1:length(x_ticks), 'XTickLabel', x_ticks)
set(gca, 'YTick', 1:length(y_ticks), 'YTickLabel', y_ticks)
zlim([0, 1]);
% ���õ�������
set(gcf, 'PaperPositionMode', 'auto'); % ��֤�ߴ�����Ļһ��
output_filename = 'G://University//GradePrediction//processwork//figure//Figure 9 b2.png'; % change it

% ����Ϊ TIFF ��ʽ��DPI ����Ϊ 600
print(gcf, output_filename, '-dpng', '-r600');