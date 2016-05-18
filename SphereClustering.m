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
n = 15;
numClusters = 10;
data = cell(70, 1);
dataMatrix = [];
for i = 1:numClusters
    mean1 = 2*pi*rand() - pi;
    mean2 = 2*pi*rand() - pi;
    angles = [circ_vmrnd(mean1, 1, n) circ_vmrnd(mean2, 1, n)];
    [x ,y, z] = sph2cart(angles(:,1), angles(:, 2), 1);
    data{i,1} = [x ,y, z];
    dataMatrix = [dataMatrix; data{i,1}];
end

hold on;

K = numClusters;
[best_x,best_f,mem,empty,loop]=SPKmeans(dataMatrix,K,3, 'rand');

scatter3(dataMatrix(:,1),dataMatrix(:,2),dataMatrix(:,3),4,mem);

%   Is the method accurate? Yes

%   70 clusters
