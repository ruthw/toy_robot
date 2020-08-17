require_relative './robot_mover'
require_relative './reporter'

# The Validator class is to check for valid commands
class Validator
  def initialize(robot, table)
    @robot = robot
    @table = table
  end

  def valid?(cmd, params)
    supported_cmd?(cmd) && placed_or_place_cmd?(cmd) && valid_place_or_other_cmd(cmd, params)
  end

  def within_boundary?(x, y)
    x && y && (0..@table.size[0]).include?(x.to_i) && (0..@table.size[1]).include?(y.to_i)
  end

  private

  def placed_or_place_cmd?(cmd)
    @robot.placed || is_place?(cmd)
  end

  def valid_place_or_other_cmd(cmd, params)
    is_place?(cmd) ? valid_place?(cmd, params) : true
  end

  def valid_place?(cmd, params)
    x = params[0]
    y = params[1]
    facing = params[2]

    within_boundary?(x, y) && valid_facing?(facing)
  end

  def is_place?(cmd)
    cmd == 'PLACE'
  end

  def valid_facing?(facing)
    facing && RobotMover::ALL_DIRECTIONS.include?(facing.to_sym)
  end

  def supported_cmd?(cmd)
    RobotMover::VALID_MOVE_CMDS.include?(cmd) || Reporter::VALID_OUTPUT_CMDS.include?(cmd)
  end
end