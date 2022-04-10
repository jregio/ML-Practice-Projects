% calculate cost and gradient of parameters by sum of squared residuals

function [J, grad] = cost(X, y, theta)

[m, n] = size(X);

diff = (X * theta) - y;

J = sum(diff.^2) / (2 * m);
grad = (X.' * diff) / m;

end