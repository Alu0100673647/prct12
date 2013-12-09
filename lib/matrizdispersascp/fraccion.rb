# Etsii ull grado informática
# Lenguajes y Paradigmas de la programacion
# Pedro Javier Núñez Rodríguez
# Constanza Leon Baritussio
# Clase matriz

require 'mcd'

class Fraccion
	
	attr_accessor :numerador
	attr_accessor :denominador
	@numerador
	@denominador
	
	def initialize(a, b)	# Constructor de la clase que inicializa la fracción con los valores que se le pasan por parametros
	   @numerador = a;
	   @denominador = b;
	   self.reduce()	# LLamamos a la función que simplifica la fracción al mínimo
	end

	def reduce()		# Método encargado de la simplificación del objeto fracción que lo llama
	   div = Mcd(@numerador, @denominador)
	   @numerador = @numerador / div
	   @denominador = @denominador / div
	end
	
	def num()		# Método encargado de devolver el valor del numerador
	   return @numerador
	end
	
	def denom()		# Método encargado de devolver el valor del denominador
	   return @denominador
	end
	
	def to_s		# Método encargado de mostrar por consola la fraccion de forma a/b , donde a es el numerador y b es el denominador
	   "#{@numerador}/#{@denominador}"
	end

	def to_f  		# Método encargado de mostrar por  la consola la fraccion en formato flotante
	   @numerador.to_f / @denominador.to_f
	end
            
	def ==(frac)		# Sobrecarga del metodo == para la comparación de fracciones
	   if ((@numerador == frac.numerador) && (@denominador == frac.denominador))
		  return true
	   end
	   return false
	end   
	    
	def abs			# Metodo que nos devuelve una fracción en valor absoluto
	   Fraccion.new(numerador.abs, denominador.abs)
	end
	
	def reciprocal		# Metodo que devuelve una fraccion con el numerador y el denominador invertidos
	   Fraccion.new(denominador, numerador)
	end
	
	def -@			# Sobrecarga del operador - para calcular el opuesto de una fracción
	   Fraccion.new(@numerador *-1,@denominador)
	end
	
	def +(frac)    		 #Método suma dos fracciones con + y dar el resultado de forma reducida
	   if (frac.is_a? Integer)
			frac = Fraccion.new(frac,1)
		end
                return Fraccion.new((frac.den * @num) + (@den * frac.num), @den * frac.den)
	end
	
	def -(frac)    		 #Método resta dos fracciones con - y dar el resultado de forma reducida
	   Fraccion.new(@numerador*frac.denominador - frac.numerador*denominador, @denominador*frac.denominador)
	end
	
	def *(frac)     	#Método multiplca dos fracciones con * y dar el resultado de forma reducida
		if (frac.is_a? Integer)
			frac = Fraccion.new(frac,1)
		end
                return Fraccion.new(@numerador * frac.num, @denominador * frac.den)
	 
	end

				#Método divide dos fracciones con / y dar el resultado de forma reducida
	def /(frac)     
	   Fraccion.new(@numerador*frac.denominador,@denominador*frac.numerador)
	end
	
	def %(frac)   		# Método que  calcula el resto dos fracciones con % y dar el resultado de forma reducida
	   Fraccion.new(@numerador % @denominador, frac.numerador % frac.denominador)
	end

				#Método se debe de poder comprobar si una fracion es menor que otra
			
 	def <(frac)
	   
	    (@numerador.to_f / @denominador) < (frac.numerador.to_f / frac.denominador)
	end			
				#se debe de poder comprobar si una fracion es mayor que otra
	def >(frac)
	 
	    (@numerador.to_f / @denominador) > (frac.numerador.to_f / frac.denominador)
	end
				#se debe de poder comprobar si una fracion es menor o igual que otra
	
	  def <=(frac)
	   
	    (@numerador.to_f / @denominador) <= (frac.numerador.to_f / frac.denominador)
	end
				#se debe de poder comprobar si una fracion es mayor o igual que otra
	def >=(frac)
	  
	    (@numerador.to_f / @denominador) >= (frac.numerador.to_f / frac.denominador)
	end

	def coerce(frac)
		return self, Fraccion.new(frac,1)
	end

end
	
