% --------------- Import and preprocess data ---------------

dataset = removeNan(importfile("codon_usage.csv"));

meta = dataset(:, 1:2);
codons = normalize(table2array(dataset(:, 3:end)));
[m, n] = size(codons);

% --------------- Run PCA ---------------

% reduce dataset to 3-dimensions for visualization
[codons_reduced, retVar] = pca(codons, 3);

% --------------- Define colors ---------------
colors = [
    255     255     0;      % yellow
    0       0       255;    % blue
    255     0       0;      % red
    0       255     0;      % green
    255     128     0;      % orange
    128     0       128;    % purple
    255     105     180;    % pink
    165     42      42;     % brown
    255     0       255;    % magenta
    0       128     128;    % teal
    255     255     255;    % white
] / 255;

% --------------- Print results and plot ---------------

fprintf("Retained variance: %f\n", retVar);

X = codons_reduced(:, 1);
Y = codons_reduced(:, 2);
Z = codons_reduced(:, 3);
C = colors(dataset.Kingdom, :);
scatter3(X, Y, Z, 10, C);

% set background to black for better visibility
set(gca,'Color','k');
