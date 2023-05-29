def lights_on_off(lights)
  1.upto(lights.size) do |i|
    index = 0
    lights.map! do |light|
      index += 1
      if index % i == 0 && index >= i
        !light
      else
        light
      end
    end
  end
end

def find_lights(number)
  lights = Array.new(number, false)
  lights_on_off(lights)
  lights_on = []
  lights.each_with_index do |light, indexes|
    lights_on << indexes + 1 if light == true
  end
  lights_on
end


p find_lights(1000)

### LS Version ##

def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000) == find_lights(1000)