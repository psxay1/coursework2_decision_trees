bankData = getBankData();
wineData = getWineData();

% featuresTable = bankData(1:end, 1:16);
% labelsTable = bankData(: , 17);
% features = featuresTable{:,:};
% labels = labelsTable{:,:};
tableData = DataProcessing.convertToStructure_Class(bankData);

% iterate attributes tableData{attributes}.data
% DecisionTreeMaths.calculateEntropy(tableData{1}.labels);

% iterate attributes tableData{attributes}.data so that we can eventually
% split on the best one by selecting the best information gain/ lowest
% entropy/ purest subset

% children = ID3Helpers.splitData(tableData{5}.data, tableData{5}.labels);
children = ID3Helpers.splitData(tableData{2});
ID3Helpers.calculateEntropy(children{1});
disp("ljlobndslojnsdgojnsf")