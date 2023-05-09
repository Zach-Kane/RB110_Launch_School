

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

x = "hello world"
p x.object_id
y = spin_me(x) # "olleh dlrow"
p y.object_id

# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

# P: Given a method named spin_me 
# spin_me takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. 