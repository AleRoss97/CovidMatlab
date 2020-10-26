
function [uscita] = differenziaData(ingresso)

    uscita = zeros(1, length(ingresso));

    uscita(1) = 0;
    
    for i=2:length(ingresso)
        
        uscita(i) = ingresso(i)-ingresso(i-1);
        
    end 

end

