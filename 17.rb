require 'humanize'

s = (1..1000).map(&:humanize).map do |word|
  word = word.gsub "-",""
  word = word.gsub " ",""
  word
end.map(&:length).inject(:+)
puts s
