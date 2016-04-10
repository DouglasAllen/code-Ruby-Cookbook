p 'a string'.class                                  # => String
p 'a string'.class.name                             # => "String"
p 'a string'.class.superclass                       # => Object
p String.superclass                                 # => Object
p String.class                                      # => Class
p String.class.superclass                           # => Module
p 'a string'.class.new                              # => ""
#---
class Class
  def hierarchy
    (superclass ? superclass.hierarchy : []) << self
  end
end

p Array.hierarchy        # => [Object, Array]

class MyArray < Array
end
p MyArray.hierarchy      # => [Object, Array, MyArray]
#---
p String.superclass         # => Object
p String.ancestors          # => [String, Enumerable, Comparable, Object, Kernel]
p Array.ancestors           # => [Array, Enumerable, Object, Kernel]
p MyArray.ancestors         # => [MyArray, Array, Enumerable, Object, Kernel]

p Object.ancestors          # => [Object, Kernel]

class MyClass
end
p MyClass.ancestors         # => [MyClass, Object, Kernel]
#---
