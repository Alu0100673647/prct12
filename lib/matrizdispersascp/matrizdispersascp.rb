# Etsii ull grado informática
# Lenguajes y Paradigmas de la programacion
# Pedro Javier Núñez Rodríguez
# Constanza Leon Baritussio
# Clases MatrizDispersa y MatrizDensa

require 'matrizdispersascp/version'
require 'matriz'
require 'fraccion'

module Matrizdispersascp

    class MatrizDensa < Matriz
		
	    @matrix
	    @n  #filas
	    @m	#columnas
		
	def initialize(m)
	    @filas = m.size
	    @columnas = m[0].size
    	    @matriz = m;
	end
		
    end
	
    class MatrizDispersa < Matriz

        attr_reader :matriz, :filas, :columnas
	
        def initialize(matriz)
	    @matriz = matriz
	    @filas = matriz.size
	    @columnas = matriz.size
            
        end   
	
        def to_s
            fil = 0
	    st = "{"
            while fil < filas
                col = 0
		st += "{"
                while col < columnas
		    if @matriz[fil] != nil 	# Hay datos en la fila
                        if @matriz[fil].has_key?(col)  
                            st += "#{@matriz[fil][col].to_s}"
                        else
                           st += "0"
                        end 
                    else
                        st += "0"
                    end
			if (col + 1) < columnas then 
			    st += ", " 
			end
                    col += 1
                end
                if (fil + 1) < filas then 
		    st += "}" 
		end
		st += "}"
            fil += 1
	    end
            st += "}"
	    st
        end

        def to_f
            flotante = Array.new(matriz.size - 1)
            for i in 0...matriz.size
                # Hay datos en la fila
                if matriz[i] != nil
                    flotante[i] = Hash.new()
                    matriz[i].each do |key, value|
			flotante[i][key] = matriz[i][key].to_f
		        end
		    end
		end
            MatrizDispersa.new(flotante)
        end
	
	 # Suma de matrices
        def +(o)
            suma = Array.new(matriz.size - 1)
            for i in 0...matriz.size
                if (matriz[i] != nil or o.matriz[i] != nil)
		    suma[i] = Hash.new()
                    case true
                         when (matriz[i] != nil and o.matriz[i] != nil)
                             suma[i] = matriz[i]
                             o.matriz[i].each do |key, value|       
                             if suma[i].has_key?(key)
                                 suma[i][key] = suma[i][key] + o.matriz[i][key]
                             else
                                 suma[i][key] = o.matriz[i][key]
                             end
                         end
                         when matriz[i] != nil
                             suma[i] = matriz[i]                                                
                         when o.matriz[i] != nil
                             suma[i] = o.matriz[i]
                    end                
                end
            end
            MatrizDispersa.new(suma)
        end

        # Resta de matrices
	def -(o)
           resta = Array.new(matriz.size - 1)
           for i in 0...matriz.size
                if (matriz[i] != nil or o.matriz[i] != nil)
                    resta[i] = Hash.new()
                        case true
                            when (matriz[i] != nil and o.matriz[i] != nil)
                                resta[i] = matriz[i]
                                o.matriz[i].each do |key, value|
                                if resta[i].has_key?(key)
                                    resta[i][key] = resta[i][key] - o.matriz[i][key]
                                else
                                    resta[i][key] = o.matriz[i][key] * -1
                                end
                            end
                            when matriz[i] != nil
                                resta[i] = matriz[i]
                            when o.matriz[i] != nil
                                resta[i] = o.matriz[i]
                                resta[i].each do |key, value|
                                resta[i][key] = resta[i][key] * -1
                        end
                    end
                end
            end
            MatrizDispersa.new(resta)
        end
	# Metodo que calcula la multiplicacion

	def *(o)
	    if(self.col == o.row)
     		 matres = self.class.new(self.row,self.col)
     			 for i in 0...self.row
      			  for j in 0...o.col
        		   for k in 0...self.col
            			matres[i,j] += self[i,k] * o[k,j]
          		    end
                          end
                        end
                matres
            end
     end
	
	# Meodo que calcula el maximo de una matriz dispersa
	def max
            maximo = 0.to_f
            for i in 0...matriz.size
                if matriz[i] != nil
                    matriz[i].each do |key, value|
                        if matriz[i][key].to_f > maximo
                            maximo = matriz[i][key].to_f
                        end
                    end
                end
            end
            maximo
        end

        # Metodo que calcula el minimo de una mariz dispersa
        def min

         minimo = 0.to_f
            for i in 0...matriz.size                        
                if matriz[i] != nil                                        
                     matriz[i].each do |key, value|
                        if matriz[i][key].to_f < minimo
                            minimo = matriz[i][key].to_f
                        end
                    end
                end                                
            end
            minimo
        end
    end
end
