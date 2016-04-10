#--- page 2

string = "My first string"
p string.length
p string.length( )
p string.count('i')
p string.length.next

french_string = "il \xc3\xa9tait une fois"
p french_string.length

#--- page 3

puts "This string\ncontains a newline"
# This string
# contains a newline

puts 'it may look like this string contains a newline\nbut it doesn\'t'
# it may look like this string contains a newline\nbut it doesn't
puts 'Here is a backslash: \\'
# Here is a backslash: \

long_string = <<EOF
Here is a long string
With many paragraphs
EOF
# => "Here is a long string\nWith many paragraphs\n"
puts long_string
# Here is a long string
# With many paragraphs

string # => "My first string"
p string.slice(3, 5)

p string.chr + string.chr + string.chr + string.chr + string.chr
# => "first"

p string[3, 5]

p string.upcase # => "MY FIRST STRING"
p string

#--- page 4

p string.upcase! # => "MY FIRST STRING"
p string

p string.empty? # => false
p string.include?('MY')
