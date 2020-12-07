bankData = getBankData();

% iterate attributes tableData{attributes}.data
% DecisionTreeMaths.calculateEntropy(tableData{1}.labels);

% iterate attributes tableData{attributes}.data so that we can eventually
% split on the best one by selecting the best information gain/ lowest
% entropy/ purest subset


blacklist = cell(1,16);

% creating root node with initiall
tree = DecisionTree();
tree = tree.setTreeRoot(bankData);

% tree = struct(tree);
ID3.Tree(bankData, blacklist, tree);