#--- page 24

$KCODE='u'
# require 'jcode'

#--- page 25

#$ ruby -Ku -rjcode

#!/usr/bin/ruby -Ku -rjcode


string = "\xef\xbc\xa1" + "\xef\xbc\xa2" + "\xef\xbc\xa3" +
         "\xef\xbc\xa4" + "\xef\xbc\xa5" + "\xef\xbc\xa6"

p string.size                                            # => 18
# p string.jsize                                           # => 6

p string.count("\xef\xbc\xa2")                            # => 13
# p string.jcount("\xef\xbc\xa2")                           # => 1

p "\xef\xbc\xa2".length                                  # => 3
# p "\xef\xbc\xa2".jlength                                 # => 1

