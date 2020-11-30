bankData = getBankData();
% featuresTable = bankData(1:end, 1:16);
% labelsTable = bankData(: , 17);
% features = featuresTable{:,:};
% labels = labelsTable{:,:};
tableData = DataProcessing.convertToStructure_Class(bankData);
% DecisionTreeMaths.calculateEntropy(tableData{1}.labels);
children = ID3Helpers.splitData(tableData{2}.data, tableData{2}.labels);
disp("ljlobndslojnsdgojnsf")