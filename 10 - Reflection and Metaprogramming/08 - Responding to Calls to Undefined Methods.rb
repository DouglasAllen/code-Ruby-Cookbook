class MyClass
  def defined_method
    'This method is defined.'
  end

  def method_missing(m, *args)
    "Sorry, I don't know about any #{m} method."
  end
end

o = MyClass.new
p o.defined_method                         # => "This method is defined."
p o.undefined_method
# => "Sorry, I don't know about any undefined_method method."
#---
class Fixnum
  def method_missing(m, *args)
    if args.size > 0
      raise ArgumentError.new("wrong number of arguments (#{args.size} for 0)")
    end

    match = /^plus_([0-9]+)$/.match(m.to_s)
    if match
      self + match.captures[0].to_i
    else
      raise NoMethodError.
	new("undefined method `#{m}' for #{inspect}:#{self.class}")
    end
  end
end

p 4.plus_5                                          # => 9
p 10.plus_0                                         # => 10
p -1.plus_2                                         # => 1
p 100.plus_10000                                    # => 10100
p 20.send(:plus_25)                                 # => 45

#p 100.minus_3
# NoMethodError: undefined method `minus_3' for 100:Fixnum
#p 100.plus_5(105)
# ArgumentError: wrong number of arguments (1 for 0)
#---
class BackwardsString
  def initialize(s)
   @s = s
  end
  
  def method_missing(m, *args, &block)
    result = @s.send(m, *args, &block)
    result.respond_to?(:to_str) ? BackwardsString.new(result) : result
  end

  def to_s
    @s.reverse
  end

  def inspect
    to_s
  end
end
#---
p s = BackwardsString.new("I'm backwards.")             # => .sdrawkcab m'I
p s.size                                                # => 14
p s.upcase                                              # => .SDRAWKCAB M'I
p s.reverse                                             # => I'm backwards.
#p s.no_such_method
# NoMethodError: undefined method `no_such_method' for "I'm backwards.":String
#---
class Library < Array
  
  def add_book(author, title)
    self << [author, title]
  end
  
  def search_by_author(key)
    reject { |b| !match(b, 0, key) }
  end

  def search_by_author_or_title(key)
    reject { |b| !match(b, 0, key) && !match(b, 1, key) }
  end  
  
  :private

  def match(b, index, key)
    b[index].index(key) != nil
  end
end

l = Library.new
p l.add_book("James Joyce", "Ulysses")
p l.add_book("James Joyce", "Finnegans Wake")
p l.add_book("John le Carre", "The Little Drummer Boy")
p l.add_book("John Rawls", "A Theory of Justice")

p l.search_by_author("John")
# => [["John le Carre", "The Little Drummer Boy"], 
#     ["John Rawls", "A Theory of Justice"]]

p l.search_by_author_or_title("oy")
# => [["James Joyce", "Ulysses"], ["James Joyce", "Finnegans Wake"], 
#     ["John le Carre", "The Little Drummer Boy"]]
#---
class Library
  def method_missing(m, *args)
    search_by_author_or_title(m.to_s)
  end
end

p l.oy
# => [["James Joyce", "Ulysses"], ["James Joyce", "Finnegans Wake"], 
#     ["John le Carre", "The Little Drummer Boy"]]

p l.Fin
# => [["James Joyce", "Finnegans Wake"]]

p l.Jo
# => [["James Joyce", "Ulysses"], ["James Joyce", "Finnegans Wake"], 
#     ["John le Carre", "The Little Drummer Boy"],
#     ["John Rawls", "A Theory of Justice"]]
#---
class StringFactory
  def StringFactory.method_missing(m, *args)
    return String.new(m.to_s, *args)
  end
end

p StringFactory.a_string                      # => "a_string"
p StringFactory.another_string                # => "another_string"
#---
p StringFactory.superclass                    # => Object
#---
p 25.respond_to?(:plus_20)                     # => false
#---
class Fixnum
  def respond_to?(m)
    super or (m.to_s =~ /^plus_([0-9]+)$/) != nil
  end
end

p 25.respond_to?(:plus_20)                    # => true
p 25.respond_to?(:succ)                        # => true
p 25.respond_to?(:minus_20)                   # => false
#---
