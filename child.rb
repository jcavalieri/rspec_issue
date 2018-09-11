require './base.rb'

class Child < Base
  def foo(&block)
    puts 'child foo'
    super(&block)
  end
end
