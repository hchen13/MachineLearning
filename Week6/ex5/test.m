 clear ; close all; clc

load ('ex5data1.mat');

m = size(X, 1);

theta = [1; 1];

lambda = 0;

% -- advanced cost function optimization 
[theta] = trainLinearReg([ones(m, 1) X], y, lambda);
[J grad] = linearRegCostFunction([ones(m, 1) X], y, theta, lambda);
fprintf('fmincg Cost = %f\n', J);


% -- gradient descent
% -- piece of advice: when the cost J(theta) keeps growing larger, it's good practice to reduce the learning rate alpha
theta = [1; 1];
alpha = .0009;
for iter = 1:10000,
	[J grad] = linearRegCostFunction([ones(m, 1) X], y, theta, lambda);
	theta = theta - alpha .* grad;
end
fprintf('gradient descent Cost = %f\n', J);
% p = 8;
% X_poly = polyFeatures(X, p);
% [X_poly, mu, sigma] = featureNormalize(X_poly);  % Normalize
% X_poly = [ones(m, 1), X_poly];                   % Add Ones

% % Map X_poly_test and normalize (using mu and sigma)
% X_poly_test = polyFeatures(Xtest, p);
% X_poly_test = bsxfun(@minus, X_poly_test, mu);
% X_poly_test = bsxfun(@rdivide, X_poly_test, sigma);
% X_poly_test = [ones(size(X_poly_test, 1), 1), X_poly_test];         % Add Ones

% % Map X_poly_val and normalize (using mu and sigma)
% X_poly_val = polyFeatures(Xval, p);
% X_poly_val = bsxfun(@minus, X_poly_val, mu);
% X_poly_val = bsxfun(@rdivide, X_poly_val, sigma);
% X_poly_val = [ones(size(X_poly_val, 1), 1), X_poly_val];  

% [lambda_vec, error_train, error_val] = ...
%     validationCurve(X_poly, y, X_poly_val, yval);

% fprintf('lambda\t\tTrain Error\tValidation Error\n');

% optLambda = 0;
% minErr = 1000;
% for i = 1:length(lambda_vec)
% 	if error_val(i) < minErr,
% 		optLambda = lambda_vec(i);
% 		minErr = error_val(i);
% 	end
% end
% % train theta using final lambda and calculate the cost on the test set
% [theta] = trainLinearReg(X_poly, y, optLambda);
% J = linearRegCostFunction(X_poly_test, ytest, theta, 0);
