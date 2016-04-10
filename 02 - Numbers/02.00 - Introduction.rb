#--- page 39

p 1000.class                                # => Fixnum
p 10000000000.class                         # => Bignum
p (2**30 - 1).class                         # => Fixnum
p (2**30).class                             # => Bignum

small = 1000
big = small ** 5                          # => 1000000000000000

#--- page 40

p big.class                                 # => Bignum
p smaller = big / big                       # => 1
p smaller.class                             # => Fixnum

p 0.01.class                                # => Float
p 1.0.class                                 # => Float
p 10000000000.00000000001.class             # => Float
