require 'spec_helper'
require_relative '../lib/validator'
require_relative '../lib/robot'
require_relative '../lib/table'

describe Validator do
  let(:robot) { Robot.new() }
  let(:table) { Table.new([5, 5]) }
  let(:validator) { Validator.new(robot, table) }

  describe 'initialize' do
    context 'without arguments' do
      it 'raises ArgumentError' do
        expect{Validator.new}.to raise_error(ArgumentError)
      end
    end

    context 'with wrong number of arguments' do
      it 'raises ArgumentError' do
        expect{Validator.new(robot)}.to raise_error(ArgumentError)
      end
    end

    context 'with correct number of arguments' do
      it 'does not raise error' do
        expect{Validator.new(robot, table)}.to_not raise_error
      end
    end
  end

  describe 'valid?' do
    context 'pass in not supported cmd' do
      let(:cmd) { 'test' }
      let(:params) { nil }

      it 'return not valid' do
        expect(validator.valid?(cmd, params)).to eql(false)
      end
    end

    context 'pass in supported cmd, but not valid first command' do
      let(:cmd) { 'MOVE' }
      let(:params) { nil }

      it 'return not valid' do
        expect(validator.valid?(cmd, params)).to eql(false)
      end
    end

    context 'pass in invalid place cmd' do
      let(:cmd) { 'PLACE' }
      let(:params) { ['9', '9', 'N'] }

      it 'return not valid' do
        expect(validator.valid?(cmd, params)).to eql(false)
      end
    end

    context 'pass in valid first non-place cmd' do
      let(:cmd) { 'MOVE' }
      let(:params) { nil }

      before do
        robot.placed = true
      end

      it 'return valid' do
        expect(validator.valid?(cmd, params)).to eql(true)
      end
    end

    context 'pass in valid place cmd' do
      let(:cmd) { 'PLACE' }
      let(:params) { ['1', '2', 'NORTH'] }

      it 'return valid' do
        expect(validator.valid?(cmd, params)).to eql(true)
      end
    end

    context 'pass in valid place cmd after robot already been placed before' do
      let(:cmd) { 'PLACE' }
      let(:params) { ['1', '2', 'NORTH'] }

      before do
        robot.placed = true
      end

      it 'return valid' do
        expect(validator.valid?(cmd, params)).to eql(true)
      end
    end
  end

  describe 'within_boundary?' do
    context 'with x, y inside table' do
      let(:x) { 1 }
      let(:y) { 1 }

      it 'return true' do
        expect(validator.within_boundary?(x, y)).to eql(true)
      end
    end

    context 'with x, y outside table' do
      let(:x) { 10 }
      let(:y) { 1 }

      it 'return false' do
        expect(validator.within_boundary?(x, y)).to eql(false)
      end
    end
  end
end