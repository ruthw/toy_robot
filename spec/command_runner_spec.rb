require 'spec_helper'
require_relative '../lib/command_runner'

describe CommandRunner do
  let(:command_runner) { CommandRunner.new }

  describe 'initialize' do
    context 'with wrong number of arguments' do
      it 'raises ArgumentError' do
        expect{CommandRunner.new('test')}.to raise_error(ArgumentError)
      end
    end

    context 'without arguments' do
      it 'does not raise ArgumentError' do
        expect{CommandRunner.new}.to_not raise_error
      end
    end
  end

  describe 'run' do
    context 'with command exit' do
      before do
        allow(STDIN).to receive(:gets).and_return('exit')
      end

      it 'only call gets once' do
        expect(STDIN).to receive(:gets).once
        command_runner.run
      end
    end
  end
end