function [slopes] = computePeriodSlopes(datesPeriods, salesPeriods)
  
  for periodIndex = 1:size(datesPeriods, 1)
    datesPeriod = datesPeriods(periodIndex, :);
    salesPeriod = salesPeriods(periodIndex, :);
    
    % Ignore the zero sales data
    validIndexes = find(salesPeriod > 0);
    
    [slope, ~] = slopeAndIntercept(datesPeriod(validIndexes), ...
                                           salesPeriod(validIndexes));
                                           
    slopes(periodIndex) = slope;
  end

end
