% calculates ranges to reshape vector into thetas 1, 2, and 3

function [r1, r2, r3] = calcRanges(input, h, output)

s1 = h * input;
s2 = h * (h + 1);
s3 = output * (h + 1);

i = 1;
r1 = i:(i + s1 - 1);

i = i + s1;
r2 = i:(i + s2 - 1);

i = i + s2;
r3 = i:(i + s3 - 1);

end