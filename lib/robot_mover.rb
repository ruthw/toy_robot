# The RobotMover class define how robot can move on table
class RobotMover
  ALL_DIRECTIONS = [:NORTH, :EAST, :SOUTH, :WEST]
  VALID_MOVE_CMDS = %w(PLACE MOVE LEFT RIGHT)

  def initialize(robot, validator)
    @robot = robot
    @validator = validator
  end

  def place(x, y, facing)
    @robot.placed = true
    @robot.x = x.to_i
    @robot.y = y.to_i
    @robot.orientation = facing
  end

  def move
    case @robot.orientation.to_sym
    when ALL_DIRECTIONS[0]
      @robot.y += 1 if @validator.within_boundary?(@robot.x, (@robot.y + 1))
    when ALL_DIRECTIONS[1]
      @robot.x += 1 if @validator.within_boundary?((@robot.x + 1), @robot.y)
    when ALL_DIRECTIONS[2]
      @robot.y -= 1 if @validator.within_boundary?(@robot.x, (@robot.y - 1))
    when ALL_DIRECTIONS[3]
      @robot.x -= 1 if @validator.within_boundary?((@robot.x - 1), @robot.y)
    end
  end

  def left
    index = orientation_index
    @robot.orientation = ALL_DIRECTIONS[(index -= 1)].to_s
  end

  def right
    index = orientation_index
    @robot.orientation = ALL_DIRECTIONS[(index += 1)%4].to_s
  end

  private

  def orientation_index
    ALL_DIRECTIONS.index(@robot.orientation.to_sym)
  end
end