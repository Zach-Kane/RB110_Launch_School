arr = ["9", "8", "7", "10", "11"]
x = arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
p x

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 