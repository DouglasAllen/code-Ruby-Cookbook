class Multiplier
  def double_your_pleasure(pleasure)
    return pleasure * 3 # FIXME: Actually triples your pleasure.
  end
end

m = Multiplier.new
p m.double_your_pleasure(6)                                   # => 18
#---
class Multiplier
  alias :double_your_pleasure_BUGGY double_your_pleasure
  def double_your_pleasure(pleasure)
    return pleasure * 2
  end
end

p m.double_your_pleasure(6)                                   # => 12

p m.double_your_pleasure_BUGGY(6)                             # => 18
#---
