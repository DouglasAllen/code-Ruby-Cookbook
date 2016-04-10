#--- page 23

s = 'My kingdom for a string!'
p s.slice(3,7)                        # => "kingdom"

#--- page 24

p s[3,7]                              # => "kingdom"
p s[0,3]                              # => "My "
p s[11, 5]                            # => "for a"
p s[11, 17]                           # => "for a string!"

p s[/.ing/]                           # => "king"
p s[/str.*/]                          # => "string!"

p s.slice(3)                         # => 107
p s[3]                               # => 107
p 107.chr                            # => "k"
p s.slice(3,1)                       # => "k"
p s[3,1]                             # => "k"

p s.slice(-7,3)                      # => "str"
p s[-7,6]                            # => "string"

p s[15...s.length]                   # => "a string!"
