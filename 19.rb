require 'date'

class Date
  def dayname
    DAYNAMES[self.wday]
  end

  def abbr_dayname
    ABBR_DAYNAMES[self.wday]
  end
end

d = Date.new 1901, 01, 01

results = []

while d < Date.new(2000,12,31)
  if d.dayname == "Sunday"
    puts "found a sunday"
    if d.day == 1
      results << d
    else
      puts "sunday was on #{d.day}"
    end
  end
  d = d.next
end

puts results.length
