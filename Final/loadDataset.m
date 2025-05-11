function data = loadDataset(filename)
    % Load the dataset from a CSV file
    data = readtable(filename);
    
    % Preprocess the data (if needed)
    % Example: Convert time to seconds, normalize values, etc.
    data.time = data.time - min(data.time); % Normalize time to start from 0
end