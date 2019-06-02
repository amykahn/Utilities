function cleanData(dataFile, threshold)
% CleanData(dataFile, threshold (optional))
%
% Takes a mat file and loads the date field. All entries that are nan or 
% below a threshold are removed and saved in a new file with the name
% of the original mat file postfixed with cleaned.
%
% The threshold argument is optional and will default to a sensible value
% if not specified.
%

if nargin < 2
    threshold = 10;
end
values = load(dataFile);
data = values.data;
data(isnan(data)) = [];
data(data < threshold) = [];

[~,fileName] = fileparts(dataFile);

newFileName = fileName + "cleaned";

save(newFileName, 'data');

foo;

end