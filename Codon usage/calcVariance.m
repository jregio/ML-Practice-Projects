% calculates retained variance of a given dimension

function variance = calcVariance(S, dim)

variance = trace(S(1:dim, 1:dim)) / trace(S);

end