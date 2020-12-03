function data = getBankData()
%     bankData = loadBankData('bank-full.csv');
    bankData = loadBankData('bank_new.csv');
%     testBankData = bankData(1:end/20, :);
%     data = DataProcessing.bankFeatureProcessing_Class(testBankData);
    data = DataProcessing.bankFeatureProcessing_Class(bankData);
end