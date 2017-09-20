class Civilizacion

  attr_accessor :ejercitos, :nombre

  def initialize(nombre)
    @nombre = nombre
    @ejercitos = []
  end
end
