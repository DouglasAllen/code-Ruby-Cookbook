#--- page 20

s = 'HELLO, I am not here. I WENT to tHe MaRKEt.'
p s.upcase           # => "HELLO, I AM NOT HERE. I WENT TO THE MARKET."
p s.downcase         # => "hello, i am not here. i went to the market."
p s.swapcase         # => "hello, i AM NOT HERE. i went TO ThE mArkeT."
p s.capitalize       # => "Hello, i am not here. i went to the market."

un_banged = 'Hello world.'
p un_banged.upcase	# => "HELLO WORLD."
p un_banged 		# => "Hello world."

banged = 'Hello world.'
p banged.upcase!		# => "HELLO WORLD."
p banged 			# => "HELLO WORLD."

class String
  def capitalize_first_letter
    self[0].chr.capitalize + self[1, size]
  end

  def capitalize_first_letter!
    unless self[0] == (c = self[0,1].upcase[0])
      self[0] = c
      self
    end
    # Return nil if no change was made, like upcase! et al.
  end	
end

s = 'i told Alice. She remembers now.'
p s.capitalize_first_letter	# => "I told Alice. She remembers now."
p s	                        # => "i told Alice. She remembers now."
p s.capitalize_first_letter!
p s                               # => "I told Alice. She remembers now."

#--- page 21

p 'LOWERCASE ALL VOWELS'.tr('AEIOU', 'aeiou')
# => "LoWeRCaSe aLL VoWeLS"

p 'Swap case of ALL VOWELS'.tr('AEIOUaeiou', 'aeiouAEIOU')
# => "SwAp cAsE Of aLL VoWeLS"
#---
