% Made by Zela Tainos
addpath('CircStat2012a');
addpath('SPKmeans');
%   Make shpere
clf;
[sx, sy, sz] = sphere;
figure;
lightGrey = 0.8*[ 1 1 1 ];
surface(sx,sy,sz, 'FaceColor', 'none', 'EdgeColor', lightGrey);
hold on;
%   Make sampling point clusters
% Direction is anyone from 0 to 2pi and is the mean point or angle
% Small variance is less concise and vise versa
% This is on a circle.
directionX = 4/pi;
directionY = 3/pi;
variance = 100;
numSamps = 100;
matrixOfAnglesX = circ_vmrnd(directionX, variance, numSamps);
matrixOfAnglesY = circ_vmrnd(directionY, variance, numSamps); % For the second dimension off the plane

% Second sample space
matrixOfAngles1 = circ_vmrnd(2/pi, variance, numSamps);
matrixOfAngles2 = circ_vmrnd(pi, variance, numSamps);

% We have two angles to represent a point on a sphere. So we now want the
% point.
[x,y,z] = sph2cart(matrixOfAnglesX, matrixOfAnglesY, 1);
[x1,y1, z1] = sph2cart(matrixOfAngles1, matrixOfAngles2, 1);
data = [x,y,z;x1,y1,z1];
plot3(data(:,1),data(:,2),data(:,3), '.', 'MarkerSize', 20);

%   Find the clusters on spehere
[centroid, object, category] = SPKmeans(data, 2, 10);



