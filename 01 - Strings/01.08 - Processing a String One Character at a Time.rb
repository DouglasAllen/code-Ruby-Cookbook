#--- page 16

'foobar'.each_byte { |x| puts "#{x} = #{x.chr}" }
# 102 = f
# 111 = o
# 111 = o
# 98 = b
# 97 = a
# 114 = r

'foobar'.scan( /./ ) { |c| puts c }
# f
# o
# o
# b
# a
# r

#"foo\nbar".each { |x| puts x }
#undefined method `each' for "foo\nbar":String (NoMethodError)
## foo
## bar
  
#--- 17
  
french = "\xc3\xa7a va"

french.scan(/./) { |c| puts c }
# �
# �
# a
# 
# v
# a

french.scan(/./u) { |c| puts c }
# ç
# a
# 
# v
# a

# warning: variable $KCODE is no longer effective; ignored
$KCODE = 'u'
french.scan(/./) { |c| puts c }
# ç
# a
# 
# v
# a

