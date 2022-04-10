% train linear regression model

function theta = trainTheta(X, y)

[m, n] = size(X);
theta = zeros(n, 1);

options = optimoptions('fminunc', 'Algorithm', 'trust-region', ...
    'SpecifyObjectiveGradient', true, 'Display','none');    

theta = fminunc(@(t)(cost(X, y, t)), theta, options);

end