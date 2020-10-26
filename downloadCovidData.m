function [data_regioni, data_province] = downloadCovidData()

    %Data source
    covid_province_url = "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/legacy/dati-json/dpc-covid19-ita-province.json";
    coivid_regioni_url = "https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-json/dpc-covid19-ita-regioni.json";

    %Province
    data_province = webread(covid_province_url);
    data_province = jsondecode(data_province);
    
    %Regioni    
    data_regioni = webread(coivid_regioni_url);
    data_regioni = jsondecode(data_regioni);
    
end

