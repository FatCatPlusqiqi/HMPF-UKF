% load Pet_Net
clear
clc
% nROI=90 ;
% Y=[ones(size(Net_NC,3),1);zeros(size(Net_PD,3),1)];
% Net_NC=reshape(Net_NC,nROI*nROI,size(Net_NC,3));
% 
% Net_SC=reshape(Net_PD,nROI*nROI,size(Net_PD,3));
% data=[Net_NC Net_SC];
% tmp=zeros(nROI*nROI,1);
% subnum =size(Net_NC,2)+size(Net_SC,2);

%% 原代�?
name ='Fun_Net';
% load Fun_Net
% Net_NC=Net_NC(:,1:90,:);
% Net_PD=Net_PD(:,1:90,:);

% PCWT:舌回与顶上回，舌回与额上回背外侧�?
% SRWT�?4，PCWT�?1
load brainNetSet_SR_NITRC.mat;
brainNetSet=brainNetSet{4};

Net_PD=brainNetSet(:,:,1:45);
Net_NC=brainNetSet(:,:,46:91);

nROI=90 ;
tmp=zeros(nROI*nROI,1);
label=[ones(size(Net_NC,3),1) ;zeros(size(Net_PD,3),1)];
Net = cat(3,Net_NC,Net_PD);
subnum=size(Net,3);
data=reshape(Net,nROI*nROI,subnum);
Y=label;
for i=1:subnum
    index=setdiff(1:subnum,i);
    datat=data(:,index);
    yt=Y(index);
    
    [a b]=ttest2(datat(:,yt==1)',datat(:,yt==0)');
    thr = 0.01;%gretna_FDR(b,0.05);
    b(isnan(b))=1;
    
    %tmp(b<0.001)=tmp(b<0.001)+1;
    
    net=reshape(b,nROI,nROI);
    
    tmp(b<thr)=tmp(b<thr)+1;
end

index = find(tmp==subnum);
net_consesus=double(tmp==subnum);
net_consesus=reshape(net_consesus,nROI,nROI);

%load aal_Labels

%node=Reference(2:91,1);
[~,~,tmp]=xlsread('AAL模板.xls');
node=tmp(2:91,1);

[a b]=ttest2(data(:,yt==1)',data(:,yt==0)');
pnet=reshape(b,nROI,nROI);
pnet(isnan(pnet))=1;

xlabel=ceil(index/nROI);
ylabel=nROI+index-xlabel*nROI;
tex=node(xlabel);
tex=[tex node(ylabel)];

tex=[tex num2cell(pnet(index))];
Net_NC_mean=mean(Net_NC,3);
Net_SC_mean=mean(Net_PD,3);
tex=[tex num2cell(Net_NC_mean(index))];
tex=[tex num2cell(Net_SC_mean(index))];

Net_NC_var=var(Net_NC, 0, 3);
Net_SC_var=var(Net_PD, 0, 3);
tex=[tex num2cell(Net_NC_var(index))];
tex=[tex num2cell(Net_SC_var(index))];

net_consesus(net_consesus>0)=double(Net_NC_mean(index)-Net_SC_mean(index)>0)+1;
net_consesus=reshape(net_consesus,nROI,nROI);

% save([name 'consesus.edge'],'net_consesus','-ascii')
net=double(net_consesus>0)./pnet;
myColorMap = lines(length(net));
circularGraph(net,'Colormap',myColorMap,'Label',node);
set(findobj('FontSize',15),'FontSize',6);
photo_path = 'D:\Desktop\paper 1\论文图\ppt图\';
saveas(gcf, [photo_path '�?7-SRraw.svg']);

% 
[a b]=sort(cell2mat(tex(:,3)));
top_10=tex(b(1:2:end),:);


[sortedtex, idx] = sortrows(tex, 3);


% for i=1:subnum
%     index1=setdiff(1:subnum,i);
%     datat=data(:,index1);
%     yt=Y(index1);
%     
%     [a b]=ttest2(data(:,yt==1)',data(:,yt==0)');
% 
%     
%     %% 计算每次的P
%     pnet=reshape(b,nROI,nROI);
%     pnet(isnan(pnet))=1;
%     
%     xlabel=ceil(index/nROI);
%     ylabel=nROI+index-xlabel*nROI;
%     tex=node(xlabel);
%     tex=[tex node(ylabel)];
%     
%     tex=[tex num2cell(pnet(index))];
%     Net_NC_mean=mean(Net_NC,3);
%     Net_SC_mean=mean(Net_PD,3);
%     tex=[tex num2cell(Net_NC_mean(index))];
%     tex=[tex num2cell(Net_SC_mean(index))];
% 
%     c(:,:) = tex(idx,:);
% end