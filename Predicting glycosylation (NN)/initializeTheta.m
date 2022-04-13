% randomly initialize parameters

function theta = initializeTheta(length, epsilon)

theta = (rand(length, 1) * 2 * epsilon) - epsilon;

end