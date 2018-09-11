# rspec_issue

This demonstrates an issue with stubbing the method of a base class where the following are true:
 * The child method has overriden the base method
 * The methods accept blocks
 * The child method passed the block to the base method
 * The child method passes a block, where that block also calls the child method
 
 ## Actual and correct output:
 ```
$ irb -r ./program.rb
2.4.4 :001 > Program.new.run
child foo
base foo
running
 => nil
2.4.4 :002 > Program.new.run_nested
child foo
base foo
child foo
base foo
running nested
 => nil
 ```
 ## Failing test that should be succeeding
 ```
 $ rspec example_spec.rb
.F

Failures:

  1) Program should only stub the base in nested calls
     Failure/Error: expect(STDOUT).to receive(:puts).with('child foo').twice

       (#<IO:<STDOUT>>).puts("child foo")
           expected: 2 times with arguments: ("child foo")
           received: 1 time with arguments: ("child foo")
     # ./example_spec.rb:25:in `block (2 levels) in <top (required)>'

Finished in 0.00756 seconds (files took 0.07761 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./example_spec.rb:19 # Program should only stub the base in nested calls
 ```
 
