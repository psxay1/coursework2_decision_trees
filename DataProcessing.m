classdef DataProcessing
    
    properties
    end
    methods (Static)
        
% Base Methods        
        function new_variable = labelEncoding(variable,values_set,numbers)
            [rows,col] = size(variable);
            new_variable = zeros(rows,1);
            
            for i=1:length(values_set)
                indices = ismember(variable,values_set{i});
                new_variable(indices) = numbers(i);
            end
        end
        
% Classification

        function data=bankLabelProcessing_Class(data)
            %unique(data.job)
            data.job = DataProcessing.labelEncoding(data.job,{'admin.','blue-collar','entrepreneur','housemaid','management','retired','self-employed','services','student','technician','unemployed','unknown'},[0 1 2 3 4 5 6 7 8 9 10 11]);
            %unique(data.marital)
            data.marital = DataProcessing.labelEncoding(data.marital,{'single','married','divorced'},[0 1 2]);
            %unique(data.education)
            data.education = DataProcessing.labelEncoding(data.education,{'unknown','primary','secondary','tertiary'},[0 1 2 3]);
            %unique(data.default)
            data.default = DataProcessing.labelEncoding(data.default,{'no','yes'},[0 1]);
            %unique(data.housing)
            data.housing = DataProcessing.labelEncoding(data.housing,{'no','yes'},[0 1]);
            %unique(data.loan)
            data.loan = DataProcessing.labelEncoding(data.loan,{'no','yes'},[0 1]);
            %unique(data.contact)
            data.contact = DataProcessing.labelEncoding(data.contact,{'unknown','cellular','telephone'},[0 1 2]);
            %unique(data.month)
            data.month = DataProcessing.labelEncoding(data.month,{'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec'},[0 1 2 3 4 5 6 7 8 9 10 11]);
            %unique(data.poutcome)
            data.poutcome = DataProcessing.labelEncoding(data.poutcome,{'unknown','success','failure','other'},[0 1 2 3]);
            %unique(data.y)
            data.y = DataProcessing.labelEncoding(data.y,{'no','yes'},[0 1]);
        end
        
        function data=normalizeData_Class(data)
            data.age = zscore(data.age);
            data.balance = zscore(data.balance);
            data.duration = zscore(data.duration);
            data.previous = zscore(data.previous);
            data.pdays = zscore(data.pdays);
            data.campaign = zscore(data.campaign);
        end
        
        function column=ConvertToStructure()
            
        end

% Regression        
        function data=bankLabelProcessing_Reg(data)
            % Similar to bankLabelProcessing_Class but for the regression
        end
        
        function data=normalizeData_Reg_DICK(data)
            % Similar to normalizeData_Class but for the regression
        end
    end
end