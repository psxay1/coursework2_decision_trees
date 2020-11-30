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
        
        % One hot encoding: https://uk.mathworks.com/help/deeplearning/ref/onehotencode.html
        function data = matrixEncoding(column)
            data = categorical(column);
            data = table(data);
            data = onehotencode(data);
        end
        
        function tableData = convertToStructure_Class(data)
            columnNames = data.Properties.VariableNames;
             for i=1:length(columnNames)-1
                 column_data = table2array(data(:, i));
%                  dataType = "";
                 if class(column_data) == "table"
                    dataType = "categorical";
                 else
                     dataType = "numeric";
                 end
                 S(i) = struct('data', column_data, 'dataType', dataType, 'labels', table2array(data(:, 17)));
                 tableData{i} = horzcat(S(i));
             end
        end
        
% Classification

        function data=bankFeatureProcessing_Class(data)
            %unique(data.job)
%             data.job = DataProcessing.labelEncoding(data.job,{'admin.','blue-collar','entrepreneur','housemaid','management','retired','self-employed','services','student','technician','unemployed','unknown'},[0 1 2 3 4 5 6 7 8 9 10 11]);
            data.job = DataProcessing.matrixEncoding(data.job);
            %unique(data.marital)
%             data.marital = DataProcessing.labelEncoding(data.marital,{'single','married','divorced'},[0 1 2]);
            data.marital = DataProcessing.matrixEncoding(data.marital);
            %unique(data.education)
%             data.education = DataProcessing.labelEncoding(data.education,{'unknown','primary','secondary','tertiary'},[0 1 2 3]);
            data.education = DataProcessing.matrixEncoding(data.education);
            %unique(data.default)
%             data.default = DataProcessing.labelEncoding(data.default,{'no','yes'},[0 1]);
            data.default = DataProcessing.matrixEncoding(data.default);
            %unique(data.housing)
%             data.housing = DataProcessing.labelEncoding(data.housing,{'no','yes'},[0 1]);
            data.housing = DataProcessing.matrixEncoding(data.housing);
            %unique(data.loan)
%             data.loan = DataProcessing.labelEncoding(data.loan,{'no','yes'},[0 1]);
            data.loan = DataProcessing.matrixEncoding(data.loan);
            %unique(data.contact)
%             data.contact = DataProcessing.labelEncoding(data.contact,{'unknown','cellular','telephone'},[0 1 2]);
            data.contact = DataProcessing.matrixEncoding(data.contact);
            %unique(data.month)
%             data.month = DataProcessing.labelEncoding(data.month,{'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec'},[0 1 2 3 4 5 6 7 8 9 10 11]);
            data.month = DataProcessing.matrixEncoding(data.month);
            %unique(data.poutcome)
%             data.poutcome = DataProcessing.labelEncoding(data.poutcome,{'unknown','success','failure','other'},[0 1 2 3]);
            data.poutcome = DataProcessing.matrixEncoding(data.poutcome);
            %unique(data.y)
%             data.y = DataProcessing.labelEncoding(data.y,{'no','yes'},[0 1]);
            data.y  = DataProcessing.matrixEncoding(data.y);
        end
        
        function data=normalizeData_Class(data)
            data.age = zscore(data.age);
            data.balance = zscore(data.balance);
            data.duration = zscore(data.duration);
            data.previous = zscore(data.previous);
            data.pdays = zscore(data.pdays);
            data.campaign = zscore(data.campaign);
        end

% Regression        
        function data=wineFeatureProcessing_Reg(data)
            % Similar to bankLabelProcessing_Class but for the regression
        end
         
    end
end