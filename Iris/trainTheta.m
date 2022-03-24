% trains parameters for each class (one-for-all classification)

function [Theta] = trainTheta(X, y, classes, lambda)

nClasses = size(classes, 1);
nFeatures = size(X, 2);
Theta = zeros(nFeatures, nClasses);

options = optimoptions('fminunc', 'Algorithm', 'trust-region', 'SpecifyObjectiveGradient', true, 'Display', 'none');
for i = 1:nClasses
    Theta(:, i) = fminunc(@(t)(cost(X, y==classes(i), t, lambda)), Theta(:, i), options);
end