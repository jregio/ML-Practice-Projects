% calculate cost and gradient with regularization

function [J, grad] = cost(X, y, theta, lambda)

m = size(X, 1);
predictions = sigmoid(X * theta);

J = sum((-y .* log(predictions)) - ((1 - y) .* log(1 - predictions))) / (2 * m) ...
    + (lambda / (2 * m)) * sum(theta(2:end).^2);

grad = (X.' * (predictions - y)) / (2 * m) ...
    + ((lambda / m) * sum(theta(2:end)));

end