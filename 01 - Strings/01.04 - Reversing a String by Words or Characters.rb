#--- page 10

s = ".sdrawkcab si gnirts sihT"
p s.reverse                             # => "This string is backwards."
p s                                     # => ".sdrawkcab si gnirts sihT"

p s.reverse!                            # => "This string is backwards."
p s                                     # => "This string is backwards."

s = "order. wrong the in are words These"
p s.split(/(\s+)/).reverse!.join('')   # => "These words are in the wrong order."
p s.split(/\b/).reverse!.join('')      # => "These words are in the wrong. order"

#--- page 11

p "Three little  words".split(/\s+/)   # => ["Three", "little", "words"]
p "Three little  words".split(/(\s+)/) 
# => ["Three", " ", "little", "  ", "words"]
