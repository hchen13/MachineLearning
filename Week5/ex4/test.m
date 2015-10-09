clear ; close all; clc

input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;  

fprintf('Loading and Visualizing Data ...\n')

load('ex4data1.mat');
m = size(X, 1);

fprintf('\nLoading Saved Neural Network Parameters ...\n');

load('ex4weights.mat');
% a1 = [ones(m, 1) X];
% z2 = a1 * Theta1';
% a2 = sigmoid(z2);
% a2 = [ones(m, 1) a2];
% z3 = a2 * Theta2';
% h = sigmoid(z3);

% yVecs = zeros(m, num_labels);
% yVecs = bsxfun(@eq, [1 : num_labels], y);

% J = sum(yVecs .* log(h) + (1 - yVecs) .* log(1 - h), 2);
% J = -sum(J) / m;

% checkNNGradients;

% Theta1_grad = zeros(size(Theta1)); % 25 X 401
% Theta2_grad = zeros(size(Theta2)); % 10 X 26

% for i = 1 : m,
% 	delta_3 = h(i, :) - yVecs(i, :);
% 	delta_2 = delta_3 * Theta2 .* (a2(i, :) .* (1 - a2(i, :)));
% 	delta_2 = delta_2(2: end);
% 	Theta2_grad = Theta2_grad + delta_3' * a2(i, :);
% 	Theta1_grad = Theta1_grad + delta_2' * a1(i, :);
% end
% Theta1_grad = Theta1_grad ./ m;
% Theta2_grad = Theta2_grad ./ m;

nn_params = [Theta1(:) ; Theta2(:)];
cost = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, 3);
