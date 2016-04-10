#--- page 21

p " \tWhitespace at beginning and end. \t\n\n".strip
# => "Whitespace at beginning and end."

s = "Some text."
p s.center(15)                    # => "  Some text.   "
p s.ljust(15)                     # => "Some text.     "
p s.rjust(15)                     # => "     Some text."

#Normalize Ruby source code by replacing tabs with spaces
# yourString.gsub("\t", "  ")

#Transform Windows-style newlines to Unix-style newlines
p "Line one\n\rLine two\n\r".gsub("\n\r", "\n")
# => "Line one\nLine two\n"

#Transform all runs of whitespace into a single space character
p "\n\rThis string\t\t\tuses\n all\tsorts\nof whitespace.".gsub(/\s+/, " ")
# => " This string uses all sorts of whitespace."

p " \bIt's whitespace, Jim,\vbut not as we know it.\n".gsub(/[\s\b\v]+/, " ")
# => " It's whitespace, Jim, but not as we know it. "

#--- page 22

s = "   Whitespace madness! "
p s.lstrip                              # => "Whitespace madness! "
p s.rstrip                              # => "   Whitespace madness!"

p "four".center(5)                      # => "four "
p "four".center(6)                      # => " four "

