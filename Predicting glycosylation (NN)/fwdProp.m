% runs forward propagation through neural network

function [z2, a2, z3, a3, z4, a4] = fwdProp(X, theta1, theta2, theta3)

[m, n] = size(X);

z2 = X * theta1.';
a2 = [ones(m, 1) sigmoid(z2)];

z3 = a2 * theta2.';
a3 = [ones(m, 1) sigmoid(z3)];

z4 = a3 * theta3.';
a4 = sigmoid(z4);

end