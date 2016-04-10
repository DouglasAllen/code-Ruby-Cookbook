#--- page 28

('aa'..'ag').each { |x| puts x }
# aa
# ab
# ac
# ad
# ae
# af
# ag

def endless_string_succession(start)
  while true
    yield start 
    start = start.succ
  end
end

endless_string_succession('fol') do |x|
  puts x
  break if x[-1] == x[-2]    
end
# fol
# fom
# fon
# foo

#--- page 29

p '89999'.succ                           # => "90000"
p 'nzzzz'.succ                           # => "oaaaa"

p 'Zzz'.succ                             # => "AAaa"

p 'z'.succ                               # => "aa"
p 'aa'.succ                              # =>  "ab"
p 'zz'.succ                              # => "aaa"

p 'AA'.succ                              # =>  "AB"
p 'AZ'.succ                              # =>  "BA"
p 'ZZ'.succ                              # => "AAA" 
p 'aZ'.succ                              # =>  "bA"
p 'Zz'.succ                              # => "AAa"

p 'foo19'.succ                           # => "foo20"
p 'foo99'.succ                           # => "fop00"
p '99'.succ                              # => "100"
p '9Z99'.succ                            # => "10A00"

p '10-99'.succ                           # => "11-00"

p 'a-a'.succ                             # => "a-b"
p 'z-z'.succ                             # => "aa-a"
p 'Hello!'.succ                          # => "Hellp!"
p %q{'zz'}.succ                          # => "'aaa'"
p %q{z'zz'}.succ                         # => "aa'aa'"
p '$$$$'.succ                            # => "$$$%"

#--- page 30

s = '!@-'
13.times { puts s = s.succ }
# !@.
# !@/
# !@0
# !@1
# !@2
# ...
# !@8
# !@9
# !@10

("a".."e").to_a.reverse_each { |x| puts x }
# e
# d
# c
# b
# a

