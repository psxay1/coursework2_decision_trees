function data = getBankData()
    bankData = loadBankData('bank-full.csv');
    testBankData = bankData(1:end/4, :);
    data = DataProcessing.bankFeatureProcessing_Class(testBankData);
%     data = DataProcessing.bankFeatureProcessing_Class(bankData);
end