% evaluates sigmoid function on input x

function y = sigmoid(x)

y = 1 ./ (1 + exp(-x));

end