function [ date, ricoverati_con_sintomi, terapia_intensiva, isolamento_domiciliare, nuovi_positivi, dimessi_guariti, deceduti, casi_testati ] = filterCovidDataRegioni(myregioni,nome)

	date = [];

    %Strato positivi
    ricoverati_con_sintomi = [];
    terapia_intensiva = [];
    isolamento_domiciliare = [];
    
    %Andamento positivi
    nuovi_positivi = [];
    dimessi_guariti = [];
    deceduti = [];
    
    %Effort
    casi_testati = [];
    
    for i=1:length(myregioni)
        
        if length(myregioni(i).denominazione_regione) ~= length(nome)
            continue;
        end
        
        if myregioni(i).denominazione_regione == nome
            
            date = [ date convertCharsToStrings(myregioni(i).data) ];
		    ricoverati_con_sintomi = [ ricoverati_con_sintomi myregioni(i).ricoverati_con_sintomi ];
		    terapia_intensiva = [ terapia_intensiva myregioni(i).terapia_intensiva ];
		    isolamento_domiciliare = [ isolamento_domiciliare myregioni(i).isolamento_domiciliare ];
		    nuovi_positivi = [ nuovi_positivi myregioni(i).nuovi_positivi ];
		    dimessi_guariti = [ dimessi_guariti myregioni(i).dimessi_guariti ];
		    deceduti = [ deceduti myregioni(i).deceduti ];
            
            if myregioni(i).casi_testati > 0
                casi_testati = [ casi_testati myregioni(i).casi_testati ];
            else
                casi_testati = [ casi_testati 0 ];
            end
        end
        
    end

end

