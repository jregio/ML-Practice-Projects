% remove rows containing NaN in a table

function T_new = removeNan(T)

T_new = T(~any(ismissing(T), 2), :);

end