tri = IO.read("./files/p067_triangle.txt").split("\n").map { |row| row.split(" ").map(&:to_i) } #convert from string to array of array or int

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
