# Practica 6 Lenguajes y Paradigmas de la Programación
# Desarrollo Dirigido por el Comportamiento (Behavior Driven Development - BDD)
# Autores: Pedro Javier Núñez Rodríguez
#          Constanza Leon Baritussio
# Fichero que contiene la clase mcd (Máximo Comun Divisor) que nos es necesaria para la clase Fracción

def Mcd(u,v)
   u = u.abs  				# Ponemos en valor absoluto ambos valores
   v = v.abs
   k = 1
   max = 1	  
   while k <= u and k <= v 		# Iteramos mientras que k no sea mayor que ninguno de los dos números
      if ((u % k) == 0) and ((v % k) == 0)
         max = k 			# Cuando encontramos un k que es divisor de los dos numeros lo guardamos
      end
      k += 1
   end
   return max 				# Retornamos el valor encontrado
end
