#--- page 14

p ?a                       # => 97
p ?!                       # => 33
p ?\n                      # => 10
p 'a'[0]                   # => 97
p 'bad sound'[1]           # => 97

p 97.chr                   # => "a"
p 33.chr                   # => "!"
p 10.chr                   # => "\n"
p 0.chr                    # => "\000"
p 256.chr
# RangeError: 256 out of char range
