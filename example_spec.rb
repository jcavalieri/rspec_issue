require './base.rb'
require './child.rb'
require './program.rb'

describe Program do
  it 'should only stub the base' do
    allow_any_instance_of(Base).to receive(:foo) do |&block|
      block.call
    end

    expect(STDOUT).to receive(:puts).with('base foo').never
    expect(STDOUT).to receive(:puts).with('child foo').once
    expect(STDOUT).to receive(:puts).with('running').once

    Program.new.run
  end


  it 'should only stub the base in nested calls' do
    allow_any_instance_of(Base).to receive(:foo) do |&block|
      block.call
    end

    expect(STDOUT).to receive(:puts).with('base foo').never
    expect(STDOUT).to receive(:puts).with('child foo').twice
    expect(STDOUT).to receive(:puts).with('running nested').once

    Program.new.run_nested
  end

end
