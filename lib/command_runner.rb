require_relative './robot'
require_relative './table'
require_relative './parser'
require_relative './validator'
require_relative './robot_mover'
require_relative './reporter'

# The CommandRunner class is main class that provide basic CLI for input
# command to move robot around also repoting postion
class CommandRunner
  def initialize
    @robot = Robot.new()
    @table = Table.new([5, 5])
    @parser = Parser.new()
    @validator = Validator.new(@robot, @table)
    @robot_mover = RobotMover.new(@robot, @validator)
    @reporter = Reporter.new(@robot)
  end

  # Simple loop to keep getting input for command, exit when getting exit command
  def run()
    msg_with_prompt("Please enter commands, enter 'exit' to exit the program.")

    begin
      while user_input = STDIN.gets.chomp
        break if user_input == 'exit'

        cmd, params = @parser.parse(user_input)
        unless @validator.valid?(cmd, params)
          msg_with_prompt("invalid command, please try again.")
          next
        end

        if RobotMover::VALID_MOVE_CMDS.include?(cmd)
          @robot_mover.send(cmd.downcase, *params)
        elsif Reporter::VALID_OUTPUT_CMDS.include?(cmd)
          @reporter.send(cmd.downcase)
        end

        msg_with_prompt()
      end
    rescue => e
      puts "Error: #{e.message}"
    end
  end

  private

  def msg_with_prompt(msg=nil, print_prompt=true)
    prompt = "> "
    puts msg if msg
    print prompt if print_prompt
  end
end