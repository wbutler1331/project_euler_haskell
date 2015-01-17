require './core'

def legal_moves point,end_point
  moves = []
  east = point.east
  south = point.south
  moves << east if east.x <= end_point.x
  moves << south if south.y >= 0
  moves
end

$paths = 0

def compute start,end_point
  moves = legal_moves start, end_point
  if moves.length == 0
    $paths += 1
  else
    return moves.each { |move| compute move, end_point }
  end
end

compute (Point.new 0,3),(Point.new 3,0)
puts $paths
