% turn alpha selectivity into a one-hot encoding of the three outcomes

function encoding = oneHotEnc(y)

bdominant = y < 40; % beta-product is dominant if alpha selectivity < 40
adominant = y >= 60; % alpha-product is dominant if alpha selectivity > 60
competition = (y >= 40) & (y < 60); % products are in competition

encoding = [bdominant competition adominant];

end