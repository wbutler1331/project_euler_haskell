tri = %Q{
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
}.split("\n").map { |row| row.split(" ").map(&:to_i) } #convert from string to array of array or int

$running_total = [tri[-1]] #the first running total row will just be the bottom

tri.reverse.each_with_index do |row,r|
  next if r == 0 #skip first row

  row.each_with_index do |col, c|
    $running_total << [] #add a new row to the running totla
    left, right, = $running_total[r-1][c], $running_total[r-1][c+1]
    larger = left >= right ? left : right #figure out which item in the running total is larger
    $running_total[r][c] = col + larger #in the new row of the running total, add the sum of the current item and the larger of the two in the running total
  end
end

#the last thing printed should be the largest
puts $running_total
