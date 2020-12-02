function data = getBankData()
    bankData = loadBankData('bank-full.csv');
    testBankData = bankData(83:92, :);
    data = DataProcessing.bankFeatureProcessing_Class(testBankData);
%     data = DataProcessing.bankFeatureProcessing_Class(bankData);
end