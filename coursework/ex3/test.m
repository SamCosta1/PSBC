data = readSalesFigures();x = data.Days(4:end-1);y = data.Lettuce(4:end-1);maxTemp = data.MaxTemp(4:end-1);##plot(x, y, '*');hold on;slopes = [];averages = [];averageX = [];averageTemp = [];intercepts = [];ranges = [];for i = [1:7:numel(x)]    xPeriod = x(i:i+6)';  yPeriod = y(i:i+6);    zeroEntries = find(yPeriod <= 0);  xPeriod(zeroEntries) = [];  yPeriod(zeroEntries) = [];    [slope, intercept] = slopeAndIntercept(xPeriod, yPeriod);  slopes = [slopes slope];  intercepts = [intercepts intercept];  averages = [averages mean(yPeriod)];  ranges = [ranges range(maxTemp(i:i+6))];  averageX = [averageX mean(xPeriod)];  averageTemp = [averageTemp mean(maxTemp(i:i+6))];##  plot(x(i:i+6), x(i:i+6) * slope + intercept);  hold on;end##plot(averageX, averages, 'r*');xlim([4 40]);##figure(2);outlierInds = findOutliers(slopes);##plot([1:length(slopes)], slopes);##hold on;##plot(outlierInds, slopes(outlierInds), 'rd');##hold on;xSlopes = [1:length(slopes)];xSlopes(outlierInds) = [];ySlopes = slopes;ySlopes(outlierInds) = [];##plot(xSlopes, ySlopes, 'gs');mean(ySlopes)## Remove slopes corresponding to dates we're not interested intempIndexes = find(averageTemp >= 10);range = range(tempIndexes);corrcoef(averageTemp(tempIndexes), averages(tempIndexes))figure(2);plot(averageTemp(tempIndexes), averages(tempIndexes), "b*");hold on;outs = find(ranges >= 10);plot(averageTemp(outs), averages(outs), "r*");