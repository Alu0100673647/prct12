# = matrizdispersascp.rb
#
# Etsii ull grado informática
# Lenguajes y Paradigmas de la programacion
# Autor::Pedro Javier Núñez Rodríguez y Constanza Leon Baritussio
#
# == Matrices Dispersas y Densas
# - Librería para el control y operaciones de matrices dispersas y densas
# - Incluye un fichero rspec para expectativas
#
# === Clase Matriz Densa
# Definicion de la clase MatrizDensa que hereda de la Clase Matriz con los metodos:
# * initialize: constructor por defecto
# * to_s: devuelve una matriz en formato string
# * to_f: devuelve una matriz en formato flotante
# * -: negacion, devuelve una matriz negada
# * Sobrecarga de operadores: +, -, *
#  Devuelve una matriz nueva como resultado de las operaciones anteriores, se le pasa como parametro dos matrices, ej
#  matrizResultado = matriz1 * matriz2
# * min y max de los valores de una matriz

# === Clase Matriz Dispersa
# Definicion de la clase MatrizDispersa que hereda de la Clase Matriz con los metodosS:
# * initialize: constructor por defecto
# * to_s: devuelve una matriz en formato string
# * to_f: devuelve una matriz en formato flotante
# * -: negacion, devuelve una matriz negada
# * Sobrecarga de operadores: +, -, *
#  Devuelve una matriz nueva como resultado de las operaciones anteriores, se le pasa como parametro dos matrices, ej
#  matrizResultado = matriz1 * matriz2
# * min y max de los valores de una matriz

#require 'matrizdispersascp/version'
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
	
	def encontrar
	s = "["
	for i in 0...matriz.size
	  for j in 0...matriz[0].size
	     if (yield(matriz[i][j]))  # Comprobamos que el cuadrado de esa posicion no sea maor que el parametro e
	       s += "[#{i},#{j}]"
	     end
	  end
       end
       s += "]"
       s
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
#            for i in 0...matriz.size
	     0.upto(matriz.size - 1) do |i|
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
#            for i in 0...matriz.size
	     0.upto(matriz.size - 1) do |i|
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
#     			 for i in 0...self.row
#      			  for j in 0...o.col
#        		   for k in 0...self.col

			 i = 0
     			 (0..(self.row - 1)).collect {
      			  0.upto(o.col - 1) do |j|
			   k = 0
        		   (self.col - 1).times {
            			matres[i,j] += self[i,k] * o[k,j]
			   k += 1
			   }
			  end
#          		    end
#                          end
#                        end

			i += 1
			}
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
      
    
	def coerce(matriz)
	  return self, MatrizDispersa.new(matriz)
      end
    end
end
