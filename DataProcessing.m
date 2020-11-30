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