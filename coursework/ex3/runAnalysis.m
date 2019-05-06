function [slope, coef] = runAnalysis(data, salesData)    % Turn data into matricies who's rows are periods  [datesPeriods, salesPeriods, maxTempPeriods] = preprocessData(data, salesData);  periodSlopes = computePeriodSlopes(datesPeriods, salesPeriods);  % Remove periods who's slopes are outliers  outlierIndexes = findOutliers(periodSlopes);  datesPeriods(outlierIndexes, :) = [];  salesPeriods(outlierIndexes, :) = [];  maxTempPeriods(outlierIndexes, :) = [];  periodSlopes(outlierIndexes) = [];  slope = mean(periodSlopes);  coef = computeCorrelationCoef(datesPeriods, salesPeriods, maxTempPeriods, slope);
endfunction
