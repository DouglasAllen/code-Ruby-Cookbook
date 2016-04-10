#--- page 15

p :a_symbol.to_s                  # => "a_symbol"
p :AnotherSymbol.id2name          # => "AnotherSymbol"
p :"Yet another symbol!".to_s     # => "Yet another symbol!"

p :dodecahedron.object_id          # => 4565262
symbol_name = "dodecahedron"
p symbol_name.intern               # => :dodecahedron
p symbol_name.intern.object_id     # => 4565262

p "string".object_id     # => 1503030
p "string".object_id     # => 1500330
p :symbol.object_id      # => 4569358
p :symbol.object_id      # => 4569358

p "string1" == "string2"        # => false
p :symbol1 == :symbol2          # => false
