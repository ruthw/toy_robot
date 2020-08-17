require 'spec_helper'
require_relative '../lib/table'

describe Table do
  describe 'initialize' do
    let(:size) { [5, 5] }

    context 'without arguments' do
      it 'raises ArgumentError' do
        expect{Table.new}.to raise_error(ArgumentError)
      end
    end

    context 'with wrong number of arguments' do
      it 'raises ArgumentError' do
        expect{Table.new(size, size)}.to raise_error(ArgumentError)
      end
    end

    context 'with correct number of arguments' do
      it 'does not raise error' do
        expect{Table.new(size)}.to_not raise_error
      end
    end
  end
end