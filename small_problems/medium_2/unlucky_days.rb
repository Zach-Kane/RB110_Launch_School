def friday_13th(year)
  count = 0
  1.upto(12) do |i|
    if Time.new(year, i, 13).friday?
      count += 1
    end
  end
  count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2