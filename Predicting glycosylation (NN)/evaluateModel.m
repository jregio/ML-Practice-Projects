% evaluates accuracy of model

function accuracy = evaluateModel(X, y, theta, h)

[m, n] = size(X);

[theta1, theta2, theta3] = getTheta(theta, 12, h, 3);

% activation of last layer is used to make predictions
[~, ~, ~, ~, ~, a4] = fwdProp(X, theta1, theta2, theta3);

% predictions and y are turned into stereochemical outcomes
predictions = oneHotDec(a4);
yClass = oneHotDec(y);

% accuracy is the fraction of correct predictions
accuracy = sum(predictions == yClass) / m;

% displays answer vs. predictions
disp([yClass predictions])

end