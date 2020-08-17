# The Parser class help define command parsing logic
class Parser
  def parse(raw_cmd)
    raw_cmd_array = raw_cmd.split
    cmd = raw_cmd_array[0]
    params = raw_cmd_array[1] ? raw_cmd_array[1].split(',') : nil

    return cmd, params
  end
end