class Unidad

  attr_accessor :tipo, :puntos
  
  def initialize(tipo)
    @tipo = tipo
    @puntos = puntos_por_defecto
  end

  def puntos_por_defecto
    case tipo
    when :piquero
      puntos = 5
    when :arquero
      puntos = 10
    when :caballero
      puntos = 20
    end
  end

  def delete
    @puntos = 0  #no quito la unidad simplemente la inicio con 0 puntos
  end

end
