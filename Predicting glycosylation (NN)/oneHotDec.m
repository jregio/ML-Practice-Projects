% turns one-hot encoding into stereochemical outcome

function decoding = oneHotDec(y)

classes = ["b-dominant"; "competition"; "a-dominant"];

% largest value is used as the stereochemical outcome
[~, indices] = max(y, [], 2);
decoding = classes(indices);

end