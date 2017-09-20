require "./unidad"
require "./ejercito"
require "./civilizacion"
require "./acciones"


data = {chinos:    {piquero: 2, arquero: 25, caballero: 2},
        ingleses:  {piquero: 10, arquero: 10, caballero: 10},
        bizatinos: {piquero: 5, arquero: 8, caballero: 15}
       }
## uso este data con menos datos para testear los resultados ##
# data = {chinos:    {piquero: 2, arquero: 2, caballero: 2},
#         ingleses:  {piquero: 2, arquero: 2, caballero: 2},
#         bizatinos: {piquero: 2, arquero: 2, caballero: 2}
#        }
civilizaciones = [] 

data.each do |civilizacion, ejercito|
  civilizacion = Civilizacion.new(civilizacion)
  ejercito     = Ejercito.new(ejercito)
  civilizacion.ejercitos.push ejercito 
  civilizaciones << civilizacion
end

puts "--- start ---"

civilizaciones.each do |civilizacion|
  ejercito = civilizacion.ejercitos.first
  if civilizacion.nombre == :chinos
    #entreno solo a los chinos para que ganen, si no entreno a ninguno deberian empatar
    ejercito.unidades.map {|unidad| Entrenamiento.new(ejercito, unidad).perform}
  end
  #transformacion
  ejercito.unidades.map {|unidad| Transformacion.new(ejercito, unidad).perform}
end

#Batalla
ejercito1 = civilizaciones.first.ejercitos.first
ejercito2 = civilizaciones.last.ejercitos.first
puts "before: \n\n#{ejercito1.inspect}\n\n #{ejercito2.inspect}"
Batalla.new(ejercito1, ejercito2).perform
puts "after: \n\n#{ejercito1.inspect}\n\n #{ejercito2.inspect}"
puts "--- end ---"
