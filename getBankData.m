function data = getBankData()
    % wine data set(regression)
%     data = loadBankData('winequality-red.csv');
%     data = data(1:100, :);

    % bank data set (classification)
%     bankData = loadBankData('bank-full.csv');
    bankData = loadBankData('bank_new.csv');
    data = DataProcessing.bankFeatureProcessing_Class(bankData);
end