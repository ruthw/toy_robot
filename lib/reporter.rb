# The Reporter class will report on robot current position
class Reporter
  VALID_OUTPUT_CMDS = %w(REPORT)
  
  def initialize(robot)
    @robot = robot
  end

  def report
    puts "#{@robot.x},#{@robot.y},#{@robot.orientation}"
  end
end