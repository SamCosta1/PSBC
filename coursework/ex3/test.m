data = readSalesFigures();[datesPeriods, salesPeriods, tempPeriods] = preprocessData(data, data.Bread);periodSlopes = [];##plot(data.Days, data.Salad, "*");##hold on;  for periodIndex = 1:size(datesPeriods, 1)    datesPeriod = datesPeriods(periodIndex, :);    salesPeriod = salesPeriods(periodIndex, :);        % Ignore the zero sales data    validIndexes = find(salesPeriod > 0);        [slope, intercept] = slopeAndIntercept(datesPeriod(validIndexes), ...                                           salesPeriod(validIndexes));                                               periodSlopes(periodIndex) = slope;    ##      plot(datesPeriod, datesPeriod .* slope + intercept, "r");##      hold on;  end  ####  ##set(gca,'FontSize',15)##xlim([7*50, 7*51]);##ylim([600, 800]);##xlabel("Days since 31/12/2014");##ylabel("Bread Sales Data");##print -depsc report/slopes.eps  hold off;% Remove periods who's slopes are outliersoutlierIndexes = findOutliers(periodSlopes);####figure(2)####plot([1: length(periodSlopes)], periodSlopes, "gd"); hold on;##plot(outlierIndexes, periodSlopes(outlierIndexes), "rd");####set(gca,'FontSize',15)##xlim([0, 160]);##ylim([-30, 57]);####xlabel("Period index");##ylabel("Period Slope");##legend("Ordinary slopes", "Outliers", 'Location', 'NorthWest');####print -depsc report/slopeoutliers.epsdatesPeriods(outlierIndexes, :) = [];salesPeriods(outlierIndexes, :) = [];tempPeriods(outlierIndexes, :) = [];periodSlopes(outlierIndexes) = [];slopeAvg = mean(periodSlopes);% Each sales data point transformed based on the slope and the average of% its periodfilteredTemps = [];filteredDates = [];transformedSales = [];for periodIndex = 1:size(datesPeriods, 1)    % Get data for current period  salesPeriod = salesPeriods(periodIndex, :);  tempPeriod = tempPeriods(periodIndex, :);  validIndexes = intersect(find(salesPeriod > 0), find(tempPeriod >= 10));   % Nothing to do if none of the data is valid  if length(validIndexes) == 0    continue;  end    % Filter invalid data  datesPeriod = datesPeriods(periodIndex, :)(validIndexes);  salesPeriod = salesPeriod(validIndexes);  tempPeriod = tempPeriod(validIndexes);    deltaSalesPlusMean = salesPeriod - slopeAvg .* (datesPeriod - mean(datesPeriod));  filteredDates = [filteredDates datesPeriod];  filteredTemps = [filteredTemps tempPeriod];  transformedSales = [transformedSales deltaSalesPlusMean];  end% Analyse the last year seperatelyfirstDayOfYr3 = 732;% The 1st year data excluding outliersindexesYr1 = find(filteredDates <= 365);[dates1, sales1, temp1] = removeOutliers(indexesYr1, filteredDates, transformedSales, filteredTemps);  % The 2rd year data excluding outliersindexesYr2 = intersect(find(filteredDates > 365), find(filteredDates < firstDayOfYr3));[dates2, sales2, temp2] = removeOutliers(indexesYr2, filteredDates, transformedSales, filteredTemps);% The 3rd year data excluding outliersindexesYr3 = find(filteredDates >= firstDayOfYr3);[dates3, sales3, temp3] = removeOutliers(indexesYr3, filteredDates, transformedSales, filteredTemps);   % Normalise the data before putting it back togethernormalise = @(data) (data - min(data)) / (max(data) - min(data));sales1 = normalise(sales1);sales2 = normalise(sales2);sales3 = normalise(sales3);% Compute coefficientcoef = corrcoef([temp1, temp2, temp3], [sales1, sales2, sales3])(1,2)  ##figure(4);####plot(data.Days, data.Bread, "*");##hold on;##plot(filteredDates, transformedSales, "r-*");##set(gca,'FontSize',15)##xlim([570, 640]);##ylim([600, 800] + 50);##xlabel("Days since 31/12/2014");##ylabel("Bread Sales Data");##legend("Raw sales data", "Transformed data");##print -depsc report/transformed.epsxlabel("Days since 31/12/2014");ylabel("Transformed Bread Sales Data"); print -depsc report/tempbyproducts.eps