function [ zero_indices ] = zero_crossings( signal )
%zero_crossing Finds the indices where the signal crosses 0

zero_indices = find(diff(signal > 0));

end

