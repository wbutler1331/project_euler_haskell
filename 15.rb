require './core'

class Point
  attr_accessor :x, :y
  def initialize x,y
    @x = x
    @y = y

  end

  def to_s
    "Point: #{x},#{y}"
  end

  def +(p)
    Point.new (@x + p.x), (@y + p.y)
  end

  def -(p)
    Point.new (@x - p.x), (@y - p.y)
  end

  def move direction
    directions = {
      :north => (Point.new(0,1)),
      :south => (Point.new(0,-1)),
      :west =>  (Point.new(-1,0)),
      :east =>  (Point.new(1,0))
    }
    if direction.to_s.include? "_"
      parts = direction.to_s.split "_"
      dir1 = directions[parts[0].to_sym]
      dir2 = directions[parts[1].to_sym]
      delta = dir1 + dir2
    else
      delta = directions[direction]
    end

    self + delta
  end
end

class Grid
  def initialize nrows, ncols
    @nrows = nrows
    @ncols = ncols
    @n = 0
  end

  def move point
    moves = legal_moves point
    if moves.length > 0
      moves.each do |direction|
        move (point.move direction)
      end
    else
      @n += 1
    end
    @n
  end


  def legal_moves point
    directions = {
      :north => (Point.new(0,1)),
      #:south => (Point.new(0,-1)),
      :west =>  (Point.new(-1,0)),
      #:east =>  (Point.new(1,0))
    }
    directions.map do |direction, delta|
      new_point = point + delta
      ((new_point.x <= 0) and (new_point.y >= 0) and (new_point.x >= (@ncols-1)*-1) and (new_point.y <= (@nrows-1))) ? direction : nil
    end.select(&:not_nil?)
  end
end



puts (Grid.new(20,20).move(Point.new 0,0))
