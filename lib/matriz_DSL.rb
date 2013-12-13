#= Clase de Matriz DSL
require './matriz.rb'

class MatrizDSL < Matriz

	#== Inicialización
	def initialize(op, opc)

		@op = op					
		@clase = opc
                @mat1 = nil
                @mat2 = nil

	end

	attr_reader :matriz1, :matriz2

	#== Definimos el operando
	def operando(other)
                
		                
                if(@mat1 == nil)
                        @mat1 = other
                else
                        @mat2 = other
                end
                             
		# Realizamos la operación
                if @mat1 != nil and @mat2 != nil
	                ejecucion
		end
                
        end
	
	#== Definimos la función de ejecución de la operación
        def ejecucion
                
		@matriz1 = "Matriz" + @clase.to_s + ".new(@mat1)"
                puts "Matriz 1: #{@mat1}"

                @matriz2 = "Matriz" + @clase.to_s + ".new(@mat2)"
                puts "Matriz 2: #{@mat2}"                

                resultado = @matriz1.to_s + "." + @op.to_s + "(" + @matriz2.to_s + ")"
		puts "Resultado: #{resultado}"

        end

end


# ------------------------------------------------------SUMA DENSA-------------------------------------------
x = MatrizDSL.new("+","Densa")
x.operando [[1,2],[3,4]]
x.operando [[5,6],[7,9]]

# ---------------------------------------------------------RESTA DENSA---------------------------------------
x = MatrizDSL.new("-","Densa")
x.operando [[1,2],[3,4]]
x.operando [[5,6],[7,9]]

# -------------------------------------------------------PRODUCTO DENSA-------------------------------------
x = MatrizDSL.new("*","Densa")
x.operando [[1,2],[3,4]]
x.operando [[5,6],[7,9]]

# ----------------------------------------------------SUMA DISPERSA----------------------------------------
x = MatrizDSL.new("+","Dispersa")
x.operando [[1,2],[3,4]]
x.operando [[5,6],[7,9]]

