% evaluates the derivative of the sigmoid function on input x

function y = sigmoidGradient(x)

y = sigmoid(x) .* (1 - sigmoid(x));

end