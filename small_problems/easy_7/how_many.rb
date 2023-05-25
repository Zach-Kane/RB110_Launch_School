def count_occurrences(vehicles)
  autos = Hash.new(0)
  vehicles.each do |each|
    autos[each] += 1
  end
  autos.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2