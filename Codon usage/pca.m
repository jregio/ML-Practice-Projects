% runs principal component analysis on dataset

function [X_reduced, retVar] = pca(X, dim)

% calculate covariance matrix
sigma = X.' * X;

% U contains principal components
% S is used for calculating retained variance
[U, S, ~] = svd(sigma);

% if dimension is not specified, automatically find best dimension
if nargin < 2
    dim = findDim(S);
end

% reduce dataset into lower dimension
X_reduced = X * U(:, 1:dim);

% calculate retained variance
retVar = calcVariance(S, dim);

end