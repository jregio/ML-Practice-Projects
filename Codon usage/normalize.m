% apply mean normalization and feature scaling on dataset

function X_normalized = normalize(X)

mu = mean(X);
sigma = std(X);

% if the standard devation of a feature is 0, then set to 1
% this avoids dividing by zero when applying feature scaling
sigma = sigma + (sigma == 0);

X_normalized = rdivide(X - mu, sigma);

end