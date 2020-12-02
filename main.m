bankData = getBankData();

% iterate attributes tableData{attributes}.data
% DecisionTreeMaths.calculateEntropy(tableData{1}.labels);

% iterate attributes tableData{attributes}.data so that we can eventually
% split on the best one by selecting the best information gain/ lowest
% entropy/ purest subset

% [children, gain] = DecisionTreeMaths.chooseAttribute(bankData);
ID3.Tree(bankData);