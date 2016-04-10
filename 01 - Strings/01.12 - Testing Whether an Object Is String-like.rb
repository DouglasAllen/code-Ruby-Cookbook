#--- page 22 

p 'A string'.respond_to?(:to_str)              # => true
p Exception.new.respond_to?(:to_str)           # => true
p 4.respond_to?(:to_str)                       # => false

def join_to_successor(s)
  raise ArgumentError, 'No successor method!' unless s.respond_to? :succ
  return "#{s}#{s.succ}"
end

p join_to_successor('a')                # => "ab"
p join_to_successor(4)                  # => "45"

#--- page 23

p join_to_successor(4.01)
# ArgumentError: No successor method!
