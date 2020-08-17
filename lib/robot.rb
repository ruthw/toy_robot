# The Robot class define robot with it's position on a table
class Robot
  attr_accessor :x, :y, :orientation, :placed

  def initialize
    @x = 0
    @y = 0
    @orientation = nil
    @placed = false
  end
end
