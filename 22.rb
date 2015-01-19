require './core'
names = IO.read("./files/p022_names.txt").gsub("\"","").split(",").sort
sum = names.each_with_index.map do |name,i|
  name.each_byte.map do |char|
    char - 64
  end.inject(:+) * (i+1)
end.inject(:+)
puts sum
