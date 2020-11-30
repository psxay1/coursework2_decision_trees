classdef ID3Helpers
    
    properties
    end
    % inputs
        %featureColumn: all the data rows for some given feature of the
        %'bank-full.csv' data e.g. age, job, marital status...
        %labels: the labels for the same data set above. Each row corresponds to featureColumn's rows. 
    % Output
        %Bucketholder: a cell array that is structured like [{table1}, {table2}, ...,{tablen}]
        % where each {table} is a subset of featureColumn and labels where
        % all the elements of the {table} are data points such that they
        % have the same feature value. e.g say the feature data passed in
        % was 'marital status' which has the four possible values 'single',
        % 'married', 'divorced' and 'unknown'; the data structure would
        % look like [{single table}, {married table}, {divorced table}, {unknown table}]
    % Why?
        %we need data grouped like this to do the calculation for
        %'information gain' which helps us pick the best attribute to split
        %on at each node
            %information gain = entropy(parent) - [average entropy(children)]
            
    %{
         example tree

        marital status               <--Parent (feature)
         /  |       |   \ 
        /   |       |    \
       /    |       |     \
      /     |       |      \
     dvcd single  married  unknown   <--Children (feature values) -- we
     calculate average entropy of these
    %}
            
    methods (Static)
        
        function bucketHolder = splitData(featureColumn, labels)
            values = unique(featureColumn);
            disp(featureColumn)
            for i=1:height(values) 
                indices = ismember(featureColumn, values(i, :));
                featureBucket = featureColumn(indices, :);
                labelBucket = labels(indices, :);
                filteredTable = [featureBucket, labelBucket];
                bucketHolder{i} = filteredTable;

            end
        end
    end
end