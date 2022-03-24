function [X, y] = separate(data)

[m, n] = size(data);

X = [ones(m, 1) data.sepalLength, data.sepalWidth, data.petalLength, data.petalWidth];
y = data.class;

end