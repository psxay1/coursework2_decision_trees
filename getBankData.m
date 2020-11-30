function data = getBankData()
    bankData = loadBankData('bank-full.csv');
    data = DataProcessing.bankFeatureProcessing_Class(bankData);
%     data = DataProcessing.normalizeData_Class(encodedBankData);
end