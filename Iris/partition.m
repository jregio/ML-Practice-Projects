function [train, validate, test] = partition(data, mTrain, mVal, mTest)

if mTrain + mVal + mTest > size(data, 1)
    error("Invalid partition.")
end

i = 1;
train = data(i:mTrain, :);

i = i + mTrain;
validate = data(i:i + mVal - 1, :);

i = i + mVal;
test = data(i:i + mTest - 1, :);

end