function data = getBankData()
    bankData = loadBankData('bank-new.csv');
%     testBankData = bankData(1:300, :);
%     data = DataProcessing.bankFeatureProcessing_Class(testBankData);
    data = DataProcessing.bankFeatureProcessing_Class(bankData);
end