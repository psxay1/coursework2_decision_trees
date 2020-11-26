bankData = getBankData();
featuresTable = bankData(1:end, 1:16);
labelsTable = bankData(: , 17);
features = featuresTable{:,:};
labels = labelsTable{:,:};

DecisionTreeMaths.calculateEntropy(features, labels)