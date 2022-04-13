% reshape vector into theta 1, 2, and 3

function [theta1, theta2, theta3] = getTheta(theta, input, h, output)

[r1, r2, r3] = calcRanges(input, h, output);

theta1 = reshape(theta(r1), h, input);
theta2 = reshape(theta(r2), h, h + 1);
theta3 = reshape(theta(r3), output, h + 1);


