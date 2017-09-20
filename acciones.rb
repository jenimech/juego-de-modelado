class Batalla
  
  def initialize(ejercito1, ejercito2)
    @ejercito1 = ejercito1
    @ejercito2 = ejercito2
  end

  def perform
    ejercito1_puntos = @ejercito1.puntos #TOMO LOS PUNTOS DE CADA EJERCITO PARA COMPARAR
    ejercito2_puntos = @ejercito2.puntos    
    if ejercito1_puntos > ejercito2_puntos
      puts "** Gana ejercito 1"
      @ejercito1.gana!
      @ejercito2.pierde!
    elsif ejercito2_puntos > ejercito1_puntos
      puts "** Gana ejercito 2"
      @ejercito2.gana!
      @ejercito1.pierde!
    else #empate
      puts "** Empate"
      @ejercito1.empate!
      @ejercito2.empate!
    end
  end

end

class Transformacion

  def initialize(ejercito, unidad)
    @ejercito = ejercito
    @unidad   = unidad
  end

  def perform
    return if @unidad.tipo == :caballero
    if @unidad.tipo == :piquero
      @ejercito.monedas -= 30
      @unidad.tipo = :arquero
    else #es un arquero
      @ejercito.monedas -= 40
      @unidad.tipo = :caballero
    end
  end
end

class Entrenamiento

  def initialize(ejercito, unidad)
    @ejercito = ejercito
    @unidad   = unidad
  end

  def perform
    pt = 0
    monedas = 0
    case @unidad.tipo
    when :piquero
      pt = 3
      monedas = 10
    when :arquero
      pt = 7
      monedas = 20
    when :caballero
      pt = 10
      monedas = 30
    end
    @unidad.puntos += pt
    @ejercito.monedas -= monedas
  end
end
