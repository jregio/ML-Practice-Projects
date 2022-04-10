% --------------- Import & pre-process data ---------------

trainData = importfile("Training dataset.xlsx", "Sheet1", [2, 269]);
valData = importfile("Validation dataset.xlsx", "Sheet1", [2, 49]);
testData = importfile("Test dataset.xlsx", "Sheet1", [2, 27]);

[Xtrain, ytrain] = separate(trainData);
[Xval, yval] = separate(valData);
[Xtest, ytest] = separate(testData);

% --------------- Train model ---------------

% combine validation and test sets into a larger evaluation set
Xeval = [Xval; Xtest];
yeval = [yval; ytest];

% train and evaluate model
theta = trainTheta(Xtrain, ytrain);
Jtrain = cost(Xtrain, ytrain, theta);
Jeval = cost(Xeval, yeval, theta);

% display cost of train & evaluation sets to diagnose bias/variance
fprintf("Train cost: %f\n", Jtrain);
fprintf("Eval cost: %f\n", Jeval);
