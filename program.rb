require './child.rb'

class Program
  def run
    Child.new.foo { puts 'running' }
  end

  def run_nested
    c = Child.new
    c.foo { c.foo { puts 'running nested' } }
  end
end
