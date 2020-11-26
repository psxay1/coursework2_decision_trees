function data=bankLabelProcessing(data)
    %unique(data.job)
    data.job = labelEncoding(data.job,{'admin.','blue-collar','entrepreneur','housemaid','management','retired','self-employed','services','student','technician','unemployed','unknown'},[0 1 2 3 4 5 6 7 8 9 10 11]);
    %unique(data.marital)
    data.marital = labelEncoding(data.marital,{'single','married','divorced'},[0 1 2]);
    %unique(data.education)
    data.education = labelEncoding(data.education,{'unknown','primary','secondary','tertiary'},[0 1 2 3]);
    %unique(data.default)
    data.default = labelEncoding(data.default,{'no','yes'},[0 1]);
    %unique(data.housing)
    data.housing = labelEncoding(data.housing,{'no','yes'},[0 1]);
    %unique(data.loan)
    data.loan = labelEncoding(data.loan,{'no','yes'},[0 1]);
    %unique(data.contact)
    data.contact = labelEncoding(data.contact,{'unknown','cellular','telephone'},[0 1 2]);
    %unique(data.month)
    data.month = labelEncoding(data.month,{'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec'},[0 1 2 3 4 5 6 7 8 9 10 11]);
    %unique(data.poutcome)
    data.poutcome = labelEncoding(data.poutcome,{'unknown','success','failure','other'},[0 1 2 3]);
    %unique(data.y)
    data.y = labelEncoding(data.y,{'no','yes'},[0 1]);
end