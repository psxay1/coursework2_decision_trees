classdef DataProcessing
    
    properties
    end
    methods (Static)
        
        % Base Methods
        function new_variable = labelEncoding(variable,values_set,numbers)
            [rows,~] = size(variable);
            new_variable = zeros(rows,1);
            
            for i=1:length(values_set)
                indices = ismember(variable,values_set{i});
                new_variable(indices) = numbers(i);
            end
        end
        
        % One hot encoding: https://uk.mathworks.com/help/deeplearning/ref/onehotencode.html
        function data = matrixEncoding(column)
            data = categorical(column);
            data = table(data);
            data = onehotencode(data);
        end
        
        function data=bankFeatureProcessing_Class(data)
            %unique(data.job)
            data.job = DataProcessing.labelEncoding(data.job,{'admin.','blue-collar','entrepreneur','housemaid','management','retired','self-employed','services','student','technician','unemployed','unknown'},[0 1 2 3 4 5 6 7 8 9 10 11]);
            
            data.marital = DataProcessing.labelEncoding(data.marital,{'single','married','divorced'},[0 1 2]);
            data.education = DataProcessing.labelEncoding(data.education,{'unknown','primary','secondary','tertiary'},[0 1 2 3]);
            data.default = DataProcessing.labelEncoding(data.default,{'no','yes'},[0 1]);
            data.housing = DataProcessing.labelEncoding(data.housing,{'no','yes'},[0 1]);
            data.loan = DataProcessing.labelEncoding(data.loan,{'no','yes'},[0 1]);
            data.contact = DataProcessing.labelEncoding(data.contact,{'unknown','cellular','telephone'},[0 1 2]);
            data.month = DataProcessing.labelEncoding(data.month,{'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec'},[0 1 2 3 4 5 6 7 8 9 10 11]);
            data.poutcome = DataProcessing.labelEncoding(data.poutcome,{'unknown','success','failure','other'},[0 1 2 3]);
            data.y = DataProcessing.labelEncoding(data.y,{'no','yes'},[0 1]);
            
%             data.job = DataProcessing.matrixEncoding(data.job);
%             data.marital = DataProcessing.matrixEncoding(data.marital);
%             data.education = DataProcessing.matrixEncoding(data.education);
%             data.default = DataProcessing.matrixEncoding(data.default);
%             data.housing = DataProcessing.matrixEncoding(data.housing);
%             data.loan = DataProcessing.matrixEncoding(data.loan);
%             data.contact = DataProcessing.matrixEncoding(data.contact);
%             data.month = DataProcessing.matrixEncoding(data.month);
%             data.poutcome = DataProcessing.matrixEncoding(data.poutcome);
        end
        
        function splitObj = convertToStruct(op, kids, attribute, threshold, blacklist)
            splitObj.op = op;
            splitObj.kids = kids;
            splitObj.attribute = attribute;
            splitObj.threshold = threshold;
            splitObj.blacklist = blacklist;
        end
    end
end
