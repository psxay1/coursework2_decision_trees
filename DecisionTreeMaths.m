classdef DecisionTreeMaths
    
    properties
    end
    methods (Static)
        
        function entropy=calculateEntropy(labels)
            % Dion: does labels === [0 1] or [1 0] now?
            n_positive = nnz(labels == 1);
            n_negative = size(labels, 1) - n_positive;
            totalSize = n_positive + n_negative;
            p_positive = n_positive/totalSize;
            p_negative = n_negative/totalSize;
            entropy = -(p_positive*log2(p_positive) + p_negative*log2(p_negative));
            disp(entropy)
        end
        
        % calculates weighted gain
        function weightedGain = calculateWeightedEntropy(childNodes)
            % E Sv/S[H(Sv)]
        end
        
        function gain = calculateGain()
           % Information Gain H(S) - weighted gain
        end
        
    end
    
    function chooseAttribute()
           % This would give the column with best gain
    end
end