p Object.methods
# => ["name", "private_class_method", "object_id", "new", 
#     "singleton_methods", "method_defined?", "equal?", ... ]
#---
p Object.singleton_methods                       # => []
p Fixnum.singleton_methods                       # => ["induced_from"]

class MyClass
  def MyClass.my_singleton_method
 end

  def my_instance_method
  end
end
p MyClass.singleton_methods                      # => ["my_singleton_method"]
#---
p ''.methods == String.instance_methods          # => true
#---
p Object.methods.sort
# => ["<", "<=", "<=>", "==", "===", "=~", ">", ">=",
#     "__id__", "__send__", "allocate", "ancestors", ... ]
#---
p MyClass.method_defined?(:my_instance_method)   # => true
p MyClass.new.respond_to?(:my_instance_method)   # => true
p MyClass.respond_to?(:my_instance_method)       # => false

p MyClass.respond_to?(:my_singleton_method)     # => true
#---
require 'irb/completion'
#Depending on your system, you may also have to add the following line:
# IRB.conf[:use_readline] = true
#---
p String.private_instance_methods.sort
# => ["Array", "Float", "Integer", "String", "`", "abort", "at_exit",
#     "autoload","autoload?", "binding", "block_given?", "callcc", ... ]
p String.new.respond_to?(:autoload?)                   # => false

#String.new.autoload?

# NoMethodError: private method `autoload?' called for "":String
#---
