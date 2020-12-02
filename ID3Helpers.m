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
        
        function bucketHolder = splitData(data)
            labels = array2table(data.labels);
            featureColumn = array2table(data.data);
            values = unique(featureColumn);
            
            for i=1:height(values)
                indices = ismember(featureColumn, values(i, :));
                featureBucket = featureColumn(indices, :);
                labelBucket = labels(indices, :);
                filteredStruct(i) = struct('data', table2array(featureBucket), 'dataType', data.dataType, 'labels', table2array(labelBucket));
                bucketHolder{i} = horzcat(filteredStruct(i));
            end
        end
        
        function bucketHolder = splitNumericData(features, labels, splitIndex)
            leftFeatures = features(1:splitIndex);
            leftLabels = labels(1:splitIndex);
            leftFeatures = leftFeatures.';
            bucketHolder{1} = struct('data', leftFeatures, 'dataType', 'numeric', 'labels', leftLabels);
            
            rightFeatures = features(splitIndex+1:end);
            rightLabels = labels(splitIndex+1:end);
            rightFeatures = rightFeatures.';
            bucketHolder{2} = struct('data', rightFeatures, 'dataType', 'numeric', 'labels', rightLabels);
        end
        
        function entropy=calculateEntropy(subset)
            n_positive = height(subset.labels(subset.labels==1));
            n_negative = size(subset.labels, 1) - n_positive;
            totalSize = n_positive + n_negative;
            p_positive = n_positive/totalSize;
            p_negative = n_negative/totalSize;
            entropy = -(p_positive*log2(p_positive) + p_negative*log2(p_negative));
            if isnan(entropy)
                entropy = 0;
            end
        end
        
        function entropy = calculateEntropyNumeric(labels)
            n_positive = height(labels(labels==1));
            n_negative = size(labels,1) - n_positive;
            totalSize = n_positive + n_negative;
            p_positive = n_positive/totalSize;
            p_negative = n_negative/totalSize;
            entropy = -(p_positive*log2(p_positive) + p_negative*log2(p_negative));
            if isnan(entropy)
                entropy = 0;
            end
        end
    end
end