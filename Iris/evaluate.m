% evaluates accuracy of model

function [accuracy] = evaluate(X, y, classes, Theta)

accuracy = sum(y==classes(predict(X, Theta))) / size(X, 1);

end