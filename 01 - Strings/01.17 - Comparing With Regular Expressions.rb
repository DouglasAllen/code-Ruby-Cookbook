#--- page 30

string = 'This is a 30-character string.'

if string =~ /([0-9]+)-character/ and $1.to_i == string.length
  "Yes, there are #$1 characters in that string."
end
# => "Yes, there are 30 characters in that string."

match = Regexp.compile('([0-9]+)-character').match(string)
if match && match[1].to_i == string.length
  "Yes, there are #{match[1]} characters in that string."
end
# => "Yes, there are 30 characters in that string."

#--- page 31

string = "123"

case string
when /^[a-zA-Z]+$/
  "Letters"
when /^[0-9]+$/
  "Numbers"
else
  "Mixed"
end
# => "Numbers"

/something/
Regexp.new("something")
Regexp.compile("something")
%r{something}

/something/mxi
Regexp.new('something', 
           Regexp::EXTENDED + Regexp::IGNORECASE + Regexp::MULTILINE)
%r{something}mxi

case_insensitive = /mangy/i
p case_insensitive =~ "I'm mangy!"                    # => 4
p case_insensitive =~ "Mangy Jones, at your service." # => 0

multiline = /a.b/m
p multiline =~ "banana\nbanana"                       # => 5
p /a.b/ =~ "banana\nbanana"                           # => nil
# But note:
p /a\nb/ =~ "banana\nbanana"                          # => 5

#--- page 32

extended = %r{ \ was # Match " was"
               \s    # Match one whitespace character
                a    # Match "a" }xi
p extended =~ "What was Alfred doing here?"           # => 4
p extended =~ "My, that was a yummy mango."           # => 8
p extended =~ "It was\n\n\na fool's errand"           # => nil
