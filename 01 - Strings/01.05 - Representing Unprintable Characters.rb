#--- page 11

octal = "\000\001\010\020"
octal.each_byte { |x| puts x }
# 0
# 1
# 8
# 16

hexadecimal = "\x00\x01\x10\x20"
hexadecimal.each_byte { |x| puts x }
# 0
# 1
# 16
# 32
  
#--- page 12
  
open('smiley.html', 'wb') do |f|
  f << '<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">'
  f << "\xe2\x98\xBA"
end

p "\a" == "\x07"  # => true  #ASCII 0x07 = BEL (Sound system bell)
p "\b" == "\x08"  # => true  #ASCII 0x08 = BS (Backspace)
p "\e" == "\x1b"  # => true  #ASCII 0x1B = ESC (Escape)
p "\f" == "\x0c"  # => true  #ASCII 0x0C = FF (Form feed)
p "\n" == "\x0a"  # => true  #ASCII 0x0A = LF (Newline/line feed)
p "\r" == "\x0d"  # => true  #ASCII 0x0D = CR (Carriage return)
p "\t" == "\x09"  # => true  #ASCII 0x09 = HT (Tab/horizontal tab)
p "\v" == "\x0b"  # => true  #ASCII 0x0B = VT (Vertical tab)

p "\x10\x11\xfe\xff"                 # => "\020\021\376\377"
p "\x48\145\x6c\x6c\157\x0a"         # => "Hello\n"

p "\\".size                          # => 1
p "\\" == "\x5c"                     # => true
p "\\n"[0] == ?\\                    # => true
p "\\n"[1] == ?n                     # => true
p "\\n" =~ /\n/                      # => nil

p "\C-a\C-b\C-c"                     # => "\001\002\003"
p "\M-a\M-b\M-c"                     # => "\341\342\343"

#--- page 13

p ?\C-a                              # => 1
?\M-z                                # => 250

contains_control_chars = /[\C-a-\C-^]/
p 'Foobar' =~ contains_control_chars        # => nil
p "Foo\C-zbar" =~ contains_control_chars    # => 3

#contains_upper_chars = /[\x80-\xff]/
#p 'Foobar' =~ contains_upper_chars          # => nil
#p "Foo\212bar" =~ contains_upper_chars      # => 3

def snoop_on_keylog(input)
  input.each_byte  do |b|
    case b
      when ?\C-c; puts 'Control-C: stopped a process?'
      when ?\C-z; puts 'Control-Z: suspended a process?'
      when ?\n;   puts 'Newline.'
      when ?\M-x; puts 'Meta-x: using Emacs?'
    end
  end
end

snoop_on_keylog("ls -ltR\003emacsHello\012\370rot13-other-window\012\032")
# Control-C: stopped a process?
# Newline.
# Meta-x: using Emacs?
# Newline.
# Control-Z: suspended a process?

puts "foo\tbar"
# foo     bar
puts %{foo\tbar}
# foo     bar
puts %Q{foo\tbar}
# foo     bar

puts 'foo\tbar'
# foo\tbar
puts %q{foo\tbar}
# foo\tbar
