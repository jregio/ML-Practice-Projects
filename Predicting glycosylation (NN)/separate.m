% separate table into design matrix (X) and target variable (y)

function [X, y] = separate(dataset)

[m, n] = size(dataset);

% skip normalization for the x_0 feature
X = [ones(m, 1) normalize(table2array(dataset(:, 2:end)))];

% alpha selectivity is turned into one-hot encoded stereochemical outcome
y = oneHotEnc(dataset.a);

end