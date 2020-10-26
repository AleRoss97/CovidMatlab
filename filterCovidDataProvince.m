function [date, totali_casi] = filterCovidDataProvince(data, SiglaProvincia)

    date = [];
    totali_casi = [];

    for i=1:length(data)

        if length(data(i).sigla_provincia) ~= 2 
            continue
        end

        if data(i).sigla_provincia == SiglaProvincia

            % Get the date of the record
            date = [ date, convertCharsToStrings(data(i).data) ];
            % Get the amount of the record
            totali_casi = [ totali_casi, data(i).totale_casi ];
            
        end

    end

end

