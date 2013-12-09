# Etsii ull grado informática
# Lenguajes y Paradigmas de la programacion
# Pedro Javier Núñez Rodríguez
# Constanza Leon Baritussio
# Clase matriz

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
   
   def + matAux			#Método para hacer la suma de de matrices
      mat = Matriz.new(matAux.matriz)
      for i in (0...filas)
          for j in (0...columnas)
              mat.matriz[i][j] = (matriz[i][j] + matAux.matriz[i][j])
          end
      end
      mat
   end
   
   def - matAux			#Método para hacer la resta de  matrices
      mat = Matriz.new(matAux.matriz)
      for i in (0...filas)
          for j in (0...columnas)
              mat.matriz[i][j] = (matriz[i][j] - matAux.matriz[i][j])
          end
      end
      mat
   end
   
  def * matAux			#Método para hacer la multiplicacion de matrices
      prod = Array.new(matriz.size - 1,0)
      for i in 0...matriz[0].size 
          prod[i] = Array.new(matAux.matriz.size,0)
          for j in 0...matAux.matriz.size
              for pos in 0...matriz.size
                  prod[i][j] = prod[i][j] + (matriz[i][pos] * matAux.matriz[pos][j])
              end
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
   
 #def coerce(something)
 #  [self, Fraccion.new(something)]
 #end

end


