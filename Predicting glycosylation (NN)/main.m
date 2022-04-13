% --------------- Import & pre-process data ---------------

trainData = importfile("Training dataset.xlsx", "Sheet1", [2, 269]);
valData = importfile("Validation dataset.xlsx", "Sheet1", [2, 49]);
testData = importfile("Test dataset.xlsx", "Sheet1", [2, 27]);

[Xtrain, ytrain] = separate(trainData);
[Xval, yval] = separate(valData);
[Xtest, ytest] = separate(testData);

% --------------- Train model ---------------

% list possible values for hyperparameters lambda and h
% lambda controls regularization
% h controls height of hidden layers
lambdaVal = [0; 0.0001; 0.0003; 0.001; 0.003; 0.01; 0.03; 0.1; 0.3; 1; 3; 
    10; 30; 100; 300; 1000; 3000; 10000; 30000; 100000];
hVal = [3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14];

lambdaSize = size(lambdaVal, 1);
hSize = size(hVal, 1);

% store validation cost for each combination
costMatrix = zeros(lambdaSize, hSize);

% tune lambda and h
bestLambda = 0;
bestH = 6;
bestTheta = trainTheta(Xtrain, ytrain, bestLambda, bestH);
bestCost = cost(Xval, yval, 0, bestH, bestTheta);
for lambdaIdx = 1:lambdaSize
    for hIdx = 1:hSize
        lambda = lambdaVal(lambdaIdx);
        h = hVal(hIdx);

        theta = trainTheta(Xtrain, ytrain, lambda, h);
        
        % validation cost is calculated without regularization
        currentCost = cost(Xval, yval, 0, h, theta);
        
        if currentCost < bestCost
            bestLambda = lambda;
            bestH = h;
            bestTheta = theta;
            bestCost = currentCost;
        end

        costMatrix(lambdaIdx, hIdx) = currentCost;
    end
end

% display results
fprintf("Test accuracy: %f\n", evaluateModel(Xtest, ytest, bestTheta, bestH));





