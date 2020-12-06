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
        
        function [tables, values] = splitData(index, tabularData, blacklist)
            
            % get unique types of data in column
            uniqueValues = unique(tabularData{:, index});
            values = uniqueValues(~ismember(uniqueValues, blacklist{index}));
            
            for i=1:height(uniqueValues)
                filteredTable = tabularData(ismember(tabularData{:,index}, uniqueValues(i,:)), :);
                tables{i} = horzcat(filteredTable);
            end
        end
        
        
        function tables = splitNumData(index, tabularData)
            
            bestGain = 0;
            bestLeftChild = array2table(zeros(0,width(tabularData)));
            bestLeftChild.Properties.VariableNames = tabularData.Properties.VariableNames;
            
            bestRightChild = array2table(zeros(0,width(tabularData)));
            bestRightChild.Properties.VariableNames = tabularData.Properties.VariableNames;
            
            %proessing feature data for getting best numeric split
            
            %sort table on feature column
            featureArr = table2array(tabularData(:,index)).';
            [featureArr, ~] = sort(featureArr, 'ascend');
            avgFValues = mean([featureArr(1:end-1);featureArr(2:end)]);
            avgFValues = avgFValues.';
            avgFValues = array2table(avgFValues);

            for i=1:height(avgFValues)
                
                % Get filtered left and right children
                filteredTableLTE = tabularData(tabularData{:,index}<=avgFValues(i,:).Variables, :);
                filteredTableGT = tabularData(tabularData{:,index}>avgFValues(i,:).Variables, :);
                
                % Parent entropy
                S = height(tabularData);
                Hs = ID3Helpers.calculateEntropy(tabularData);
                
                % Left weighted child entropy
                Svl = height(filteredTableLTE);
                Hsvl = ID3Helpers.calculateEntropy(filteredTableLTE);
                % leftWeightedEntropy or lwe =(Sv/S)H(Sv)
                lwe = (Svl/S)*Hsvl;
                
                % Right weighted child entropy
                Svr = height(filteredTableGT);
                Hsvr = ID3Helpers.calculateEntropy(filteredTableGT);
                % rightWeightedEntropy or rwe =(Sv/S)H(Sv)
                rwe = (Svr/S)*Hsvr;
                
                % Information gain
                ig = Hs - (lwe + rwe);
                
                if ig>bestGain
                    bestLeftChild = filteredTableLTE;
                    bestRightChild = filteredTableGT;
                end
            end
            tables{1} = horzcat(bestLeftChild);
            tables{2} = horzcat(bestRightChild);
        end
                
        function [entropy, n_positive, n_negative]=calculateEntropy(subset)
            n_positive = height(subset{:, width(subset)}(subset{:, width(subset)}==ClassificationModel.setPredictionValueForEntropy(subset)));
            n_negative = size(subset, 1) - n_positive;
            entropy = ID3Helpers.entropy(n_positive, n_negative);
        end
        
        function entropy = entropy(n_positive, n_negative)
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