function data=normalizeData(data)
     data.age = zscore(data.age);
     data.balance = zscore(data.balance);
     data.duration = zscore(data.duration);
     data.previous = zscore(data.previous);
     data.pdays = zscore(data.pdays);
     data.campaign = zscore(data.campaign);
end
