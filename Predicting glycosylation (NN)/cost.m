% calculates regularized cost of parameters on neural network

function [J, grad] = cost(X, y, lambda, h, theta)

% --------------- Forward Propagation ---------------
[m, n] = size(X);

[theta1, theta2, theta3] = getTheta(theta, 12, h, 3);

% regularization does not take into account bias nodes
regTheta1 = regTheta(theta1);
regTheta2 = regTheta(theta2);
regTheta3 = regTheta(theta3);

% activations of previous layers are needed for backpropagation
[z2, a2, z3, a3, z4, a4] = fwdProp(X, theta1, theta2, theta3);

J = sum(sum(((-y .* log(a4)) - ((1 - y) .* log(1 - a4))))) / m ...
    + (lambda / (2 * m)) * (sum(sum(regTheta1.^2)) + sum(sum(regTheta2.^2)) + sum(sum(regTheta3.^2)));

% --------------- Back Propagation ---------------

d4 = a4 - y;

temp3 = d4 * theta3;
d3 = temp3(:, 2:end) .* sigmoidGradient(z3);
temp2 = d3 * theta2;
d2 = temp2(:, 2:end) .* sigmoidGradient(z2);

delta3 = d4.' * a3;
delta2 = d3.' * a2;
delta1 = d2.' * X;

theta1grad = (delta1 + (lambda * regTheta1)) / m;
theta2grad = (delta2 + (lambda * regTheta2)) / m;
theta3grad = (delta3 + (lambda * regTheta3)) / m;

grad = [theta1grad(:); theta2grad(:); theta3grad(:)];

end