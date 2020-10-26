
new_computation = 0;
smooth_amount = 10;

if new_computation == 1

disp('Downloading...');
[ myregioni,myprovince ] = downloadCovidData();
disp('Filtering province...');
[date_province, totali_casi] = filterCovidDataProvince(myprovince, 'MI');
disp('Filtering regioni...');
[date_regioni, ricoverati_con_sintomi, terapia_intensiva, isolamento_domiciliare, nuovi_positivi, dimessi_guariti, deceduti, casi_testati] = filterCovidDataRegioni(myregioni, 'Lombardia');
disp('Parsing dates...');
[date_province, date_regioni] = parseCovidDates(date_province, date_regioni);
disp('Differenziali...');
nuovi_casi_lom = differenziaData(totali_casi);
nuovi_dimessi_guariti = differenziaData(dimessi_guariti);
nuovi_deceduti = differenziaData(deceduti);
nuovi_casi_testati = differenziaData(casi_testati);

end

disp('Plotting figure 1...');

figure(1);

subplot(4,2,1); plot(date_province, nuovi_casi_lom);        title("nuovi casi LOM");        

subplot(4,2,2); plot(date_regioni, ricoverati_con_sintomi); title("ricoverati con sintomi"); 
subplot(4,2,3); plot(date_regioni, terapia_intensiva);      title("terapia intensiva");      
subplot(4,2,4); plot(date_regioni, isolamento_domiciliare); title("isolamento domiciliare"); 

subplot(4,2,5); plot(date_regioni, nuovi_positivi);         title("nuovi positivi");         

subplot(4,2,6); plot(date_regioni, nuovi_dimessi_guariti);  title("nuovi dimessi guariti");        
subplot(4,2,7); plot(date_regioni, nuovi_deceduti);         title("nuovi deceduti");               
subplot(4,2,8); plot(date_regioni, nuovi_casi_testati);     title("nuovi casi testati");           


disp('Plotting figure 1...');

figure(2);

subplot(3,1,1); plot(date_regioni, nuovi_dimessi_guariti ./ nuovi_positivi); title("nuovi dimessi guariti / nuovi positivi"); 
subplot(3,1,2); plot(date_regioni, nuovi_deceduti ./ nuovi_positivi);      title("nuovi deceduti / nuovi positivi");      
subplot(3,1,3); plot(date_regioni, nuovi_positivi ./ nuovi_casi_testati); title("nuovi positivi / nuovi casi_testati "); 

disp('Plotting figure 3...');
figure(3);
plot(date_regioni, nuovi_positivi);         
hold on;
plot(date_regioni, nuovi_dimessi_guariti);  
plot(date_regioni, nuovi_deceduti);         
plot(date_regioni, nuovi_casi_testati);     
legend('nuovi positivi', 'nuovi dimessi guariti', 'nuovi deceduti', 'nuovi casi testati');
hold off;

disp('Plotting figure 4...');
figure(4);
plot(date_regioni, smooth(nuovi_positivi,smooth_amount));         
hold on;
plot(date_regioni, smooth(nuovi_dimessi_guariti,smooth_amount));  
plot(date_regioni, smooth(nuovi_deceduti,smooth_amount));         
plot(date_regioni, smooth(nuovi_casi_testati,smooth_amount));     
legend('nuovi positivi', 'nuovi dimessi guariti', 'nuovi deceduti', 'nuovi casi testati');
hold off;


