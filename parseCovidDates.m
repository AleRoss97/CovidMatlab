function [date_province, date_regioni] = parseCovidDates(date_province, date_regioni)

    % Province
    date_new_province = [];

    for i = 1:length(date_province)
        
        date_province(i) = strrep(date_province(i), 'T', ' ');
        date_new_province = [ date_new_province datetime(date_province(i), 'InputFormat', 'yyyy-MM-dd HH:mm:ss') ];
        
    end
    
    date_province = date_new_province;

    % Regioni
    date_new_regioni = [];

    for i = 1:length(date_regioni)
        
        date_regioni(i) = strrep(date_regioni(i), 'T', ' ');
        date_new_regioni = [ date_new_regioni datetime(date_regioni(i), 'InputFormat', 'yyyy-MM-dd HH:mm:ss') ];
        
    end
    
    date_regioni = date_new_regioni;

    
end

