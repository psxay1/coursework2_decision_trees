classdef DecisionTreeMaths
    
    properties
    end
    methods (Static)
        function entropy=calculateEntropy(features, labels)
            n_positive = nnz(labels == 1);
            n_negative = size(labels, 1) - n_positive;
            totalSize = n_positive + n_negative;
            p_positive = n_positive/totalSize;
            p_negative = n_negative/totalSize;
            entropy = -(p_positive*log2(p_positive) + p_negative*log2(p_negative));
            disp(entropy)
        end
        
        function gain=calculateGain(childNodes)
            %calculates gain
            gain = 'dummy gain value';
            disp(gain)
        end
    end
end