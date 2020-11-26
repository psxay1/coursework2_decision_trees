function data = getBankData()
    bankData = loadBankData('bank-full.csv');
    encodedBankData = bankLabelProcessing(bankData);
    data = normalizeData(encodedBankData);
end