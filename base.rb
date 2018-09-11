class Base
  def foo(&block)
    puts 'base foo'
    block.call
  end
end
