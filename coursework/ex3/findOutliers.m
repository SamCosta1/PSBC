function outlierIndexes = findOutliers(rawData)    % First calculate the quartiles in the data  q2 = median(rawData);  q1 = median(rawData(find(rawData < q2)));  q3 = median(rawData(find(rawData > q2)));    % Interquartile range  iqr = q3 - q1;    outlierIndexes = union(find(rawData < q1 - (iqr * 1.5)), ...                         find(rawData > q3 + (iqr * 1.5)));  
end
