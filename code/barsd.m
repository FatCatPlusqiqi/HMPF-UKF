% 数据
% 假设你有自定义的阈值列表
x_ticks = [75,76,77,78,79,80,81,82,83,84,85];     
y_ticks = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9];      

% 绘图
data = DifferKMResultsS2; % change it
figure;
h = bar3(data);

% 添加标签
xlabel('ms')
ylabel('kp')
zlabel('FPR') % change it

% 设置坐标轴的刻度和标签
set(gca, 'XTick', 1:length(x_ticks), 'XTickLabel', x_ticks)
set(gca, 'YTick', 1:length(y_ticks), 'YTickLabel', y_ticks)
zlim([0, 1]);
% 设置导出参数
set(gcf, 'PaperPositionMode', 'auto'); % 保证尺寸与屏幕一致
output_filename = 'G://University//GradePrediction//processwork//figure//Figure 9 b2.png'; % change it

% 导出为 TIFF 格式，DPI 设置为 600
print(gcf, output_filename, '-dpng', '-r600');