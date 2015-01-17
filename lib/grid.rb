class Grid
  def initialize str
    @grid = str.split("\n").map{|row| row.split(" ").map(&:to_i) }
  end

  def best_path
    directions = [:n,:nw,:sw,:s,:se,:e,:ne]
    global_max = 0
    @grid.each_with_index do |row,r|
      row.each_with_index do |col,c|
        paths = directions.map do |direction|
          collect_direction direction, r, c, 3
        end
        local_max = paths.select(&:not_nil?).map {|p|p.inject(:*)}.max
        if local_max > global_max
          global_max = local_max
        end
      end
    end
    global_max
  end

  def collect_direction d,r,c,n
    res = []

    if d == :n
      transformation = lambda { |r,c,i| [r-i,c] }
    elsif d == :ne
      transformation = lambda { |r,c,i| [r-i,c+i] }
    elsif d == :e
      transformation = lambda { |r,c,i| [r,c+i] }
    elsif d == :se
      transformation = lambda { |r,c,i| [r+i,c+i] }
    elsif d == :s
      transformation = lambda { |r,c,i| [r+i,c] }
    elsif d == :sw
      transformation = lambda { |r,c,i| [r+i,c-i] }
    elsif d == :w
      transformation = lambda { |r,c,i| [r,c-i] }
    elsif d == :nw
      transformation = lambda { |r,c,i| [r-i,c-i] }
    end

    (0..n).each do |i|
      nr,nc = transformation[r,c,i]
      row = @grid[nr]
      return nil if row.nil?
      val = row[nc]
      return nil if val.nil? #if the value is nil? this path cant be taken
      res << val
    end
    res
  end
end
