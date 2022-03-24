% -------------------- Import and preprocess data --------------------
% Import data

data = importfile("iris.data");
classes = unique(data.class);

% Shuffle data

data = data(randperm(size(data, 1)), :);

% Partition into train/validate/test (75, 50, 25)

[trainData, valData, testData] = partition(data, 75, 50, 25);

% Separate into features and target variable

[Xtrain, ytrain] = separate(trainData);
[Xval, yval] = separate(valData);
[Xtest, ytest] = separate(testData);

% -------------------- Train model --------------------

% Tune lambda
lambdaVals = [0.0001, 0.0003, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1.0, 3.0, 10.0];
lambdaEval = zeros(size(lambdaVals));
for lambdaIdx = 1:size(lambdaVals, 2)
    % Learn parameters for each class
    Theta = trainTheta(Xtrain, ytrain, classes, lambdaVals(lambdaIdx));

    % Evaluate value of lambda
    lambdaEval(lambdaIdx) = evaluate(Xval, yval, classes, Theta);
end

% Select best lambda
[v, idx] = max(lambdaEval);
lambda = lambdaVals(idx);

% -------------------- Evaluate model --------------------
finalTheta = trainTheta(Xtrain, ytrain, classes, lambda);
disp("Theta:")
disp(Theta)
fprintf("Lambda: %f\n", lambda)
fprintf("Test accuracy: %.2f\n", evaluate(Xtest, ytest, classes, finalTheta))





