def time_of_day(input)
  if input > 1441 || input < - 1441
    hour = input / 60 % 24
  else
    hour = input / 60
  end
  minute = input % 60
  hour = 24 + hour if hour.negative?
  if input.positive?
    time = "#{format('%02d', hour)}:#{format('%02d', minute)}"
  else
    time = "#{format('%02d', hour)}:#{format('%02d', minute)}"
  end
  time
end


p time_of_day(0)# == "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35)# == "00:35"
p time_of_day(-1437)# == "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800)# == "13:20"
p time_of_day(-4231) #== "01:29"


# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# P: 
# input: signed integer 
# time == minutes before or after midnight. 
# + == before midnight 
# - == after midnight
# Method converting integer to 24hr (hh:mm) 

# E: 
# modulo 
# 123 == 02:00
# 60 == 01:00 

# D: 
# save time as integer
# ouput time using interpolation


