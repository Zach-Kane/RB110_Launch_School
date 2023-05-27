def greetings(name, title)
  "Hello, #{name.join(' ')}! Nice to have a #{title[:title]} #{title[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."