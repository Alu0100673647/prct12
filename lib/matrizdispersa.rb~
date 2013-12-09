require './matriz.rb'

class Vectordisperso
  attr_reader :vector

  def initialize(h = {})
    @vector = Hash.new(0)
    @vector = @vector.merge!(h)
  end

  def [](i)
    @vector[i] 
  end

  def to_s
    @vector.to_s
  end
end

class Matrixdispersa

  attr_reader :matrix

  def initialize(h = {})
    @matrix = Hash.new({})
    for k in h.keys do 
      @matrix[k] = if h[k].is_a? Vectordisperso
                     h[k]
                   else 
                     @matrix[k] = Vectordisperso.new(h[k])
                   end
    end
  end

  def [](i)
    @matrix[i]
  end

  def col(j)
    c = {}
    for r in @matrix.keys do
      c[r] = @matrix[r].vector[j] if @matrix[r].vector.keys.include? j
    end
    Vectordisperso.new c
  end
end
