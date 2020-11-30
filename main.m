bankData = getBankData();
% featuresTable = bankData(1:end, 1:16);
% labelsTable = bankData(: , 17);
% features = featuresTable{:,:};
% labels = labelsTable{:,:};
tableData = DataProcessing.convertToStructure_Class(bankData);
% iterate attributes tableData{attributes}.data

children = ID3Helpers.splitData(tableData{4}.data, tableData{4}.labels);
DecisionTreeMaths.calculateEntropy(children{1});
disp("ljlobndslojnsdgojnsf")