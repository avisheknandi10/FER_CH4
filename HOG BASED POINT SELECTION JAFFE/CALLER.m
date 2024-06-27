%The caller function
PATH = 'C:\DB\JAFFE\';
CS = [8 8];
BS = [4 4];

% [EXP,EXP2,HOG_POINTWISE] = getHogsPointwise(PATH,CS,BS);
% save('DataBase.mat','EXP','EXP2','HOG_POINTWISE');
% netSize = 10;
% Per = train_pointwise(HOG_POINTWISE,EXP2,netSize);
% PACC = sum(Per,2)/7;
% save('PER.mat','Per','PACC');
% noPoint = 25;
% %select points 
% [~,POINT_SEL] = maxk(PACC,noPoint); 
% save('POINT_SEL.mat','POINT_SEL');
% 
% DATASET = computeDatabase(PATH,POINT_SEL);
load('DATASET.mat');
load('DataBase.mat');
%DATASET2  = cell2mat(DATASET');
DATASET2 = DATASET(:,sum(DATASET)>0)';
[y,bcm,bper,ACC1] = train5(DATASET2,EXP2');
save('BCM.mat','bcm','bper','ACC1')
% netSize = 10;
% PERF = train_and_cross_validate2(DATASET2,EXP2',netSize);
% save('PERF.mat','PERF');
% ACC = mean(1-PERF);
% save('ACC.mat','ACC')
fprintf('Overall Performance: %d\n',mean(ACC1))

 