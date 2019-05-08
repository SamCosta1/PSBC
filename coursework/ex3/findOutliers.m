function outlierIndexes = findOutliers(rawData)    % First calculate the quartiles in the data  q1 = quantile(rawData, 0.25);  q3 = quantile(rawData, 0.75);    % Interquartile range  iqr = q3 - q1;    outlierIndexes = union(find(rawData < q1 - (iqr * 1.5)), ...                         find(rawData > q3 + (iqr * 1.5)));  
end
