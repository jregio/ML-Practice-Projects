% removes weights of bias nodes

function newTheta = regTheta(theta)

[m, n] = size(theta);
newTheta = [zeros(m, 1) theta(:, 2:end)];

end