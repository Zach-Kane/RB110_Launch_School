def get_grade(g1, g2, g3)
  average = (g1 + g2 + g3) / 3
  case average
  when 90..100
    'A'
  when 80..90
    'B'
  when 70..80
    'C'
  when 60..70
    'D'
  when 0..60
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"