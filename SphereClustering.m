% Made by Zela Tainos
addpath('CircStat2012a');
addpath('SPKmeans');
%   The first task is to understand clustering on the hypersphere in order to
%   understand classification of the data set.

%   Make a two sphere
clf;
[sx, sy, sz] = sphere;
figure;
lightGrey = 0.8*[1 1 1]; % It looks better if the lines are lighter
surface(sx,sy,sz,'FaceColor', 'none','EdgeColor',lightGrey)
hold on;


%   Create sample spaces on the sphere
n = 10;
numClusters = 70;
data = cell(numClusters, 2);
dataMatrix = [];
meanMatrix = [];
kappa = 100;
for i = 1:numClusters
    mean1 = 2*pi*rand() - pi;
    mean2 = 2*pi*rand() - pi;
    angles = [circ_vmrnd(mean1, kappa, n) circ_vmrnd(mean2, kappa, n)];
    [x ,y, z] = sph2cart(angles(:,1), angles(:, 2), 1);
    data{i,1} = [x ,y, z];
    [muX, muY, muZ] = sph2cart(mean1, mean2, 1);
    meanMatrix = [meanMatrix; muX, muY, muZ];
    dataMatrix = [dataMatrix; data{i,1}];
end

hold on;

K = numClusters;
[best_x,best_f,mem,empty,loop]=SPKmeans(dataMatrix,K,3, 'rand');

scatter3(dataMatrix(:,1),dataMatrix(:,2),dataMatrix(:,3),4,mem);
scatter3(meanMatrix(:,1),meanMatrix(:,2),meanMatrix(:,3),100,'k','x');
scatter3(best_x(:,1), best_x(:,2), best_x(:,3), 100, 'r', 'x');

%   Is the method accurate? Yes

%   70 clusters
