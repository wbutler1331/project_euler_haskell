def npaths n
  bound = n*2+1
  rows = [[0],[1,1]]
  (2..bound).each do |nrow|
    previous_row = rows[nrow-1]
    previous_row_len = previous_row.length-1
    new_row_len = previous_row_len + 1
    rows << (0..new_row_len).map do |ncol|
      if ncol == 0 or ncol == new_row_len
        1
      else
        previous_row[ncol-1]+previous_row[ncol]
      end
    end
  end
  print_rows rows
  rows[bound-1].max
end

def print_rows rows
  rows.each do |row|
    row.each do |col|
      print col.to_s + ","
    end
    puts " "
  end
end

puts (npaths 20)
