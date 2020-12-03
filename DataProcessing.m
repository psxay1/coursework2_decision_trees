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
            %data.job = DataProcessing.labelEncoding(data.job,{'admin.','blue-collar','entrepreneur','housemaid','management','retired','self-employed','services','student','technician','unemployed','unknown'},[0 1 2 3 4 5 6 7 8 9 10 11]);
            data.job = DataProcessing.matrixEncoding(data.job);
            data.marital = DataProcessing.matrixEncoding(data.marital);
            data.education = DataProcessing.matrixEncoding(data.education);
            data.default = DataProcessing.matrixEncoding(data.default);
            data.housing = DataProcessing.matrixEncoding(data.housing);
            data.loan = DataProcessing.matrixEncoding(data.loan);
            data.contact = DataProcessing.matrixEncoding(data.contact);
            data.month = DataProcessing.matrixEncoding(data.month);
            data.poutcome = DataProcessing.matrixEncoding(data.poutcome);
            data.y = DataProcessing.labelEncoding(data.y,{'no','yes'},[0 1]);
        end
        
%         function tree = convertToStructure(table)
%            
%             tree.op = 
%             
%         end
    end
end
