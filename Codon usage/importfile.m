function codonusage = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  CODONUSAGE = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as a table.
%
%  CODONUSAGE = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  codonusage = importfile("C:\Users\Jose Emilio Regio\Downloads\codon_usage.csv", [1, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 14-Apr-2022 18:45:05

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 69);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Kingdom", "Var2", "Var3", "Var4", "SpeciesName", "UUU", "UUC", "UUA", "UUG", "CUU", "CUC", "CUA", "CUG", "AUU", "AUC", "AUA", "AUG", "GUU", "GUC", "GUA", "GUG", "GCU", "GCC", "GCA", "GCG", "CCU", "CCC", "CCA", "CCG", "UGG", "GGU", "GGC", "GGA", "GGG", "UCU", "UCC", "UCA", "UCG", "AGU", "AGC", "ACU", "ACC", "ACA", "ACG", "UAU", "UAC", "CAA", "CAG", "AAU", "AAC", "UGU", "UGC", "CAU", "CAC", "AAA", "AAG", "CGU", "CGC", "CGA", "CGG", "AGA", "AGG", "GAU", "GAC", "GAA", "GAG", "UAA", "UAG", "UGA"];
opts.SelectedVariableNames = ["Kingdom", "SpeciesName", "UUU", "UUC", "UUA", "UUG", "CUU", "CUC", "CUA", "CUG", "AUU", "AUC", "AUA", "AUG", "GUU", "GUC", "GUA", "GUG", "GCU", "GCC", "GCA", "GCG", "CCU", "CCC", "CCA", "CCG", "UGG", "GGU", "GGC", "GGA", "GGG", "UCU", "UCC", "UCA", "UCG", "AGU", "AGC", "ACU", "ACC", "ACA", "ACG", "UAU", "UAC", "CAA", "CAG", "AAU", "AAC", "UGU", "UGC", "CAU", "CAC", "AAA", "AAG", "CGU", "CGC", "CGA", "CGG", "AGA", "AGG", "GAU", "GAC", "GAA", "GAG", "UAA", "UAG", "UGA"];
opts.VariableTypes = ["categorical", "string", "string", "string", "string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "SpeciesName"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Kingdom", "Var2", "Var3", "Var4", "SpeciesName"], "EmptyFieldRule", "auto");

% Import the data
codonusage = readtable(filename, opts);

end