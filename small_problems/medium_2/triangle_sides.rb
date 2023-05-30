def triangle(s1, s2, s3)
  lengths = [s1.to_f, s2.to_f, s3.to_f]
  lengths = lengths.sort
  case
  when lengths.any?(0.0)
    :invalid 
  when lengths[0] + lengths[1] < lengths[2]
    :invalid
  when lengths[0] == lengths[1] && lengths[0] == lengths[2]
    :equilateral
  when lengths[0] == lengths[1] && lengths[0] != lengths[2]
    :isosceles
  when lengths[1] == lengths[2] && lengths[0] != lengths[2]
    :isosceles
  else
    :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid