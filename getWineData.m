function data = getWineData()
    wineData = loadWineData('winequality-red.csv');
    data = DataProcessing.wineFeatureProcessing_Reg(wineData);
end
