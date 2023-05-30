  def letter_percentages(letters)
    count = {}
    total = letters.length
    count[:lowercase] = (((letters.count ('a-z')).to_f / total.to_f) * 100).round(1)
    count[:uppercase] = (((letters.count ('A-Z')).to_f / total.to_f) * 100).round(1)
    count[:neither] = (((letters.count ('^A-Za-z')).to_f / total.to_f) * 100).round(1)
    count
  end

p letter_percentages('abcdefGHI') == {:lowercase=>66.7, :uppercase=>33.3, :neither=>0.0}
 p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
 p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
 p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }