function figs = readSalesFigures()  fid = fopen('salesfig.csv', 'r'); % open the file  data = textscan ( fid , '%s,%f,%f,%f,%f,%f', -1,'Delimiter',',');  fclose (fid);  figs = struct();    figs.MaxTemp = cell2mat(data(2));  figs.MinTemp = cell2mat(data(3));  figs.Bread =   cell2mat(data(4));  figs.Salad =   cell2mat(data(5));  figs.Lettuce = cell2mat(data(6));  figs.Days = [1:length(figs.Lettuce)];  
end
