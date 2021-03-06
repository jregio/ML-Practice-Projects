function dataset = importfile(workbookFile, sheetName, dataLines)
%IMPORTFILE Import data from a spreadsheet
%  TRAININGDATASET = IMPORTFILE(FILE) reads data from the first
%  worksheet in the Microsoft Excel spreadsheet file named FILE.
%  Returns the data as a table.
%
%  TRAININGDATASET = IMPORTFILE(FILE, SHEET) reads from the specified
%  worksheet.
%
%  TRAININGDATASET = IMPORTFILE(FILE, SHEET, DATALINES) reads from the
%  specified worksheet for the specified row interval(s). Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  Trainingdataset = importfile("C:\Users\Jose Emilio Regio\ML Practice Projects\Predicting glycosylation\Training dataset.xlsx", "Sheet1", [2, 269]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 24-Mar-2022 15:53:15

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 12);

% Specify sheet and range
opts.Sheet = sheetName;
opts.DataRange = "A" + dataLines(1, 1) + ":L" + dataLines(1, 2);

% Specify column names and types
opts.VariableNames = ["a", "TemperatureC", "DonC1", "C2", "C4", "AccOChemShift", "AccOExposedArea", "AccACExposedArea", "ActCBHOMO", "ActCBExposedArea", "SolE_Min", "SolE_Max"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Import the data
dataset = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = "A" + dataLines(idx, 1) + ":L" + dataLines(idx, 2);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    dataset = [dataset; tb]; %#ok<AGROW>
end

end