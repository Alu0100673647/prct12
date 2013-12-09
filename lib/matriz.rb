# = matriz.rb
#
# Etsii ull grado informática
# Lenguajes y Paradigmas de la programacion
# Autor::Pedro Javier Núñez Rodríguez y Constanza Leon Baritussio
#
# == Matrices
# - Programar las principales operaciones con matrices
# - Requiere de la clase fraccion, para operar con matrices con fraccionarios
#
# === Clase Matriz 
# Definicion de la clase Matriz con los siguientes metodos:
# * initialize: constructor por defecto
# * to_s: devuelve una matriz en formato string
# * to_f: devuelve una matriz en formato flotante
# * -: negacion, devuelve una matriz negada
# * Sobrecarga de operadores: +, -, *
#  Devuelve una matriz nueva como resultado de las operaciones anteriores, se le pasa como parametro dos matrices, ej
#  matrizResultado = matriz1 * matriz2
# * min y max de los valores de una matriz

require 'fraccion'

class Matriz 
 
   include Comparable 		#Modulo comparable
   
   attr_accessor :filas, :columnas, :matriz
   
   def initialize(m)
       @filas = m.size
       @columnas = m[0].size
       @matriz = m;
   end
 
   def [](fila, columna)
		@matriz[fila][columna]
   end

   def []=(fila, columna, valor)
       @matriz[fila][columna] = valor
   end
     
   def to_s			#Método encargado de mostrar por consola la matriz de forma matriz[i][j]		
	   s = ""
	   s += "{"
       for i in (0...filas)
           s += "{"
           for j in (0...columnas)
               if j == 0
                   s += "#{matriz[i][j]}"
               else
                   s += ","
                   s += "#{matriz[i][j]}"
               end
           end
           s += "}"
       end
       s += "}"
       s
   end
  
   def to_f			# Método encargado de mostrar por  la consola la matriz en formato flotante
       s = ""
	   s = "{"
       for i in (0...filas)
           s += "{"
           for j in (0...columnas)
               if j == 0
                   s += "#{matriz[i][j].to_f}"
               else
                   s += ","
                   s += "#{matriz[i][j].to_f}"
               end
           end
           s += "}"
       end
       s += "}"
       s
   end
   
   def -@			# Sobrecarga del operador - para calcular el opuesto de una matriz
	   mat = Matriz.new(self.matriz)
       for i in (0...filas) 
           for j in (0...columnas)
               if matriz[i][j] != 0
                  mat.matriz[i][j] = (matriz[i][j] * -1)
               end
           end
       end
       mat
   end
   
   def * num			#Método que multiplica un número por una matriz
       mat = Matriz.new(self.matriz)
       for i in (0...filas)
           for j in (0...columnas)
               mat.matriz[i][j] = (matriz[i][j] * num)
           end
       end
       mat
   end
   
   def + matAux   #Método para hacer la suma de de matrices
      mat = Matriz.new(matAux.matriz)
#      for i in (0...filas)
#          for j in (0...columnas)
      0.upto(matAux.matriz.size - 1) do |i|
          0.upto(matAux.matriz.size - 1) do |j|
              mat.matriz[i][j] = (matriz[i][j] + matAux.matriz[i][j])
          end
      end
      mat
   end
   
   def - matAux   #Método para hacer la resta de  matrices
      mat = Matriz.new(matAux.matriz)
      (matAux.matriz.size).times do |i|
        (matAux.matriz.size).times do |j|
            mat.matriz[i][j] = (matriz[i][j] - matAux.matriz[i][j])
          end
      end
      mat
   end
  
def * matAux   #Método para hacer la multiplicacion de matrices

   prod = Array.new(matriz.size - 1,0)
   (matriz[0].size).times do |i|
 
      prod[i] = Array.new(matAux.matriz.size,0)
      0.upto(matAux.matriz.size - 1) do |j|  
         pos = 0
         (0...(matriz.size)).collect {
            prod[i][j] = prod[i][j] + (matriz[i][pos] * matAux.matriz[pos][j])
            pos += 1             
         }
      end
   end
   Matriz.new(prod)
end

 def max
     maximo = 0.to_f
     for i in 0...matriz.size
         for j in 0...matriz[i].size
             if matriz[i][j].to_f > maximo
                 maximo = matriz[i][j].to_f
             end
         end
     end
     maximo
 end
   
 def min
     minimo = 1000
     for i in 0...matriz.size
         for j in 0...matriz[i].size
             if matriz[i][j].to_f < minimo
                 minimo = matriz[i][j].to_f
             end
         end
     end
     minimo
 end  

end


