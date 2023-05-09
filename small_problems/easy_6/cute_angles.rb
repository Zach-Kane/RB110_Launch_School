DEGREE = "\xC2\xB0"
def dms(number)
  hours = number.to_i
  minutes = ((number - hours) * 60).to_i
  seconds = ((((number - hours) * 60) - minutes) * 60).to_i
  "#{hours}#{DEGREE}#{format("%.2i", minutes)}'#{format("%.2i", seconds)}\""
end

puts dms(30)# == %(30°00'00")
puts dms(76.73)# == %(76°43'48")
puts dms(254.6)# == %(254°36'00")
puts dms(93.034773)# == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
