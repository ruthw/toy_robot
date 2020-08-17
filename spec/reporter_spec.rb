require 'spec_helper'
require_relative '../lib/reporter'
require_relative '../lib/robot'

describe Reporter do
  let(:robot) { Robot.new }
  let(:reporter) { Reporter.new(robot) }

  describe 'initialize' do
    context 'without arguments' do
      it 'raises ArgumentError' do
        expect{Reporter.new}.to raise_error(ArgumentError)
      end
    end

    context 'with wrong number of arguments' do
      it 'raises ArgumentError' do
        expect{Reporter.new(robot, robot)}.to raise_error(ArgumentError)
      end
    end

    context 'with correct number of arguments' do
      it 'does not raise error' do
        expect{Reporter.new(robot)}.to_not raise_error
      end
    end
  end

  describe 'report' do
    let(:expected) { "1,1,NORTH\n" }

    before do
      robot.x = 1
      robot.y = 1
      robot.orientation = 'NORTH'
      robot.placed = true
    end

    it 'report the position and orientation of robot' do
      expect { reporter.report }.to output(expected).to_stdout
    end
  end
end