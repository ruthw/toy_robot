require 'spec_helper'
require_relative '../lib/robot_mover'
require_relative '../lib/robot'
require_relative '../lib/table'
require_relative '../lib/validator'

describe RobotMover do
  let(:robot) { Robot.new }
  let(:table) { Table.new([5, 5]) }
  let(:validator) { Validator.new(robot, table) }
  let(:robot_mover) { RobotMover.new(robot, validator) }

  before do
    robot.x = 1
    robot.y = 1
    robot.orientation = 'NORTH'
    robot.placed = true
  end

  describe 'initialize' do
    context 'without arguments' do
      it 'raises ArgumentError' do
        expect{RobotMover.new}.to raise_error(ArgumentError)
      end
    end

    context 'with wrong number of arguments' do
      it 'raises ArgumentError' do
        expect{RobotMover.new(robot)}.to raise_error(ArgumentError)
      end
    end

    context 'with correct number of arguments' do
      it 'does not raise error' do
        expect{RobotMover.new(robot, validator)}.to_not raise_error
      end
    end
  end

  describe 'place' do
    let(:x) { 1 }
    let(:y) { 1 }
    let(:facing) { 'NORTH' }
    let(:expected) { "1,1,NORTH\n" }

    it 'place the robot on the table' do
      robot_mover.place(x, y, facing)
      expect(robot.placed).to eql(true)
      expect(robot.x).to eql(x)
      expect(robot.y).to eql(y)
      expect(robot.orientation).to eql(facing)
    end
  end

  describe 'move' do
    it 'move robot one step to the orientation it is facing' do
      robot_mover.move
      expect(robot.x).to eql(1)
      expect(robot.y).to eql(2)
      expect(robot.orientation).to eql('NORTH')
    end
  end

  describe 'left' do
    it 'turn the robot left' do
      robot_mover.left
      expect(robot.x).to eql(1)
      expect(robot.y).to eql(1)
      expect(robot.orientation).to eql('WEST')
    end
  end

  describe 'right' do
    it 'turn the robot right' do
      robot_mover.right
      expect(robot.x).to eql(1)
      expect(robot.y).to eql(1)
      expect(robot.orientation).to eql('EAST')
    end
  end
end