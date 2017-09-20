class Ejercito
  attr_accessor :unidades, :monedas
  
  def initialize(params_unidades = {})
    @monedas = 1000
    @unidades = []
    initialize_unidades(params_unidades)
  end

  def puntos
    p = 0
    unidades.map {|unidad| p += unidad.puntos }
    p
  end

  def gana!
    @monedas += 100
  end

  def pierde!
    unidades_con_mayor_puntaje.map(&:delete)  #pierde 2 unidades
  end

  def empate!
    unidad_con_menor_valor.delete  #pierde la unidad con menor valor
  end

  private

  def initialize_unidades(params = {})
    params.each do |tipo, cantidad|
      cantidad.times do
        unidades << Unidad.new(tipo)
      end
    end
  end

  def unidades_con_mayor_puntaje
    unidades.sort {|unidad| unidad.puntos }[unidades.size-1..unidades.size]
  end

  def unidad_con_menor_valor
    unidades.sort {|unidad| unidad.puntos }.first
  end
end
