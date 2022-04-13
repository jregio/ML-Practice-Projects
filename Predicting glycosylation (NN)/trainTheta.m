% trains neural network with 2 hidden layers of height h

function theta = trainTheta(X, y, lambda, h)

fprintf("Training model with\n");
fprintf("\tlambda: %f\n", lambda);
fprintf("\theight: %f\n", h);

options = optimoptions("fminunc", "Algorithm", "trust-region", ...
    "SpecifyObjectiveGradient", true, "Display","iter");

% calculates how many parameters will be needed
[r1, r2, r3] = calcRanges(12, h, 3);
thetaLength = size(r1, 2) + size(r2, 2) + size(r3, 2);

% randomly initialize parameters for symmetry breaking
initialTheta = initializeTheta(thetaLength, 1);

% optimize parameters
theta = fminunc(@(t)(cost(X, y, lambda, h, t)), initialTheta, options);

end