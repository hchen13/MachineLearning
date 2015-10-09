data = load('ex1data1.txt');
y = data(:, 2);
m = length(y);
X = [ones(m, 1), data(:, 1)];


theta0 = linspace(-10, 10, 100);
theta1 = linspace(-1, 4, 100);
matrix_theta = [theta0', theta1'];

J = zeros(100, 100);

for i = 1: 100
	for j = 1: 100
		theta = [matrix_theta(i, 1); matrix_theta(j, 2)];
		J(i, j) = computeCost(X, y, theta);
	end
end

J = J';
figure;
contour(matrix_theta(:, 1), matrix_theta(:, 2), J, logspace(-2, 3, 20));
xlabel('theta_0'); ylabel('theta_1');
hold on;
plot(-3.630291, 1.166362, 'rx');