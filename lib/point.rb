class Point
  attr_accessor :x,:y
  def initialize x,y
    @x = x
    @y = y
  end

  def +(b)
    Point.new(self.x+b.x,self.y+b.y)
  end

  def -(b)
    Point.new(self.x-b.x,self.y-b.y)
  end

  def north
    self + Point.new(0,1)
  end

  def south
    self - Point.new(0,1)
  end

  def east
    self + Point.new(1,0)
  end

  def west
    self - Point.new(1,0)
  end
end
