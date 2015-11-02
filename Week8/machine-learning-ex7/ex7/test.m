clear; close all; clc

load('ex7data1.mat');

% plot(X(:, 1), X(:, 2), 'bo');
% axis([0.5 6.5 2 8]);
% axis square;

[X_norm, mu, sigma] = featureNormalize(X);

[U, S] = pca(X_norm);