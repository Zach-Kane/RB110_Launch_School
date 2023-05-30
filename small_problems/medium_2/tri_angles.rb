def triangle(a1, a2, a3)
  angles = [a1, a2, a3].sort
  case
  when angles.any?(90) & angles.all? {|angle| angle > 0 }
  :right
  when angles.all? {|angle| angle < 90} && angles.all? {|angle| angle > 0 } && angles.sum == 180
  :acute
  when angles[2] > 90 && angles[0] < 90 && angles[1] < 90
    :obtuse
  else
    :invalid
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50)# == :invalid