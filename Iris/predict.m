% returns predicted class using one-for-all classification

function [indices] = predict(X, Theta)

predictions = X * Theta;
[vals, indices] = max(predictions, [], 2);

end