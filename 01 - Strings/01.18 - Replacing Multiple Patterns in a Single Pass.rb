#--- page 32
class String
  def mgsub(key_value_pairs=[].freeze)
    regexp_fragments = key_value_pairs.collect { |k,v| k }
    gsub(Regexp.union(*regexp_fragments)) do |match|
      key_value_pairs.detect{|k,v| k =~ match}[1]
    end	
  end
end

p "GO HOME!".mgsub([[/.*GO/i, 'Home'], [/home/i, 'is where the heart is']])
# => "Home is where the heart is!"

#--- page 33
  
p "Here is number #123".mgsub([[/[a-z]/i, '#'], [/#/, 'P']])
# => "#### ## ###### P123"

p "FOO bar".gsub(/foo/i, "The bar").gsub(/bar/m, "result")
# => "The result result"

p "Here is number #123".gsub(/[a-z]/i, "#").gsub(/#/, "P")
# => "PPPP PP PPPPPP P123"

p "between".mgsub(/ee/ => 'AA', /e/ => 'E')        # Bad code
# => "bEtwEEn"

p "between".mgsub([[/ee/, 'AA'], [/e/, 'E']])      # Good code
# => "bEtwAAn"
