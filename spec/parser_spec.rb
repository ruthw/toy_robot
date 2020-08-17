require 'spec_helper'
require_relative '../lib/parser'

describe Parser do
  describe 'initialize' do
    context 'with wrong number of arguments' do
      it 'raises ArgumentError' do
        expect{Parser.new('test')}.to raise_error(ArgumentError)
      end
    end

    context 'without arguments' do
      it 'does not raise ArgumentError' do
        expect{Parser.new}.to_not raise_error
      end
    end
  end

  describe 'parse' do
    let(:parser) { Parser.new }

    context 'pass in place cmd' do
      let(:raw_cmd) { 'PLACE 0,0,NORTH' }
      let(:expected) { ["PLACE", ["0", "0", "NORTH"]] }

      it 'return cmd and params' do
        expect(parser.parse(raw_cmd)).to eql(expected)
      end
    end

    context 'pass in move cmd' do
      let(:raw_cmd) { 'MOVE' }
      let(:expected) { ["MOVE", nil] }

      it 'return cmd and params' do
        expect(parser.parse(raw_cmd)).to eql(expected)
      end
    end
  end
end