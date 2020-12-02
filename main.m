bankData = getBankData();

% iterate attributes tableData{attributes}.data
% DecisionTreeMaths.calculateEntropy(tableData{1}.labels);

% iterate attributes tableData{attributes}.data so that we can eventually
% split on the best one by selecting the best information gain/ lowest
% entropy/ purest subset

[children, gain] = DecisionTreeMaths.chooseAttribute(bankData);
totalSize = 0;
for i=1: length(children)
    totalSize = totalSize + height(children{i});
end
disp(totalSize);
% ID3.Tree(tableData)