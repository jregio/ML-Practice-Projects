% finds lowest dimension that retains 99 percent variance

function dim = findDim(S)

n = size(S, 1);
for dim = 1:n
    if calcVariance(S, dim) >= 0.99
        break
    end
end

end