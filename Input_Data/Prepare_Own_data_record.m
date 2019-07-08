%% GET MEG signals
clear all
load('MEG_E001')


%% get one sample
num=1;


indp=find(y==1); Xp=X(indp,:);
indn=find(y~=1); Xn=X(indn,:);

Fs= size(Xp,2)
N=Fs;
t=[0:N-1]/Fs;

M=min(size(Xp,1),size(Xn,1));
Xp=Xp(1:M,:);
Xn=Xn(1:M,:);

save('EEG_data_UCI.mat','Fs','Xp','Xn','y','t','N')