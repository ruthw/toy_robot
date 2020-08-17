require 'spec_helper'
require_relative '../lib/robot'

describe Robot do

  describe 'initialize' do
    context 'with arguments' do
      it 'raises ArgumentError' do
        expect{Robot.new('test')}.to raise_error(ArgumentError)
      end
    end
    
    context 'without arguments' do
      it 'raises ArgumentError' do
        expect{Robot.new}.to_not raise_error
      end
    end
  end
end