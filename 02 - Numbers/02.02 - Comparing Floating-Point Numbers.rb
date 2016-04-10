#--- page 43

p 1.8 + 0.1                                  # => 1.9
p 1.8 + 0.1 == 1.9                           # => false
p 1.8 + 0.1 > 1.9                            # => true

class Float
  def approx(other, relative_epsilon=Float::EPSILON, epsilon=Float::EPSILON)
    difference = other - self
    return true if difference.abs <= epsilon
#--- page 44    
    relative_error = (difference / (self > other ? self : other)).abs
    return relative_error <= relative_epsilon
  end
end

p 100.2.approx(100.1 + 0.1)               # => true
p 10e10.approx(10e10+1e-5)                # => true
p 100.0.approx(100+1e-5)                  # => false

printf("%.55f", 1.9)
# 1.8999999999999999111821580299874767661094665527343750000
puts
printf("%.55f", 1.8 + 0.1)
# 1.9000000000000001332267629550187848508358001708984375000
puts
p Float::EPSILON                            # => 2.22044604925031e-16
p (1.8 + 0.1) - 1.9                         # => 2.22044604925031e-16

class Float
  def absolute_approx(other, epsilon=Float::EPSILON)
    puts((other-self).abs)
    return (other-self).abs <= epsilon
  end
end

(1.8 + 0.1).absolute_approx(1.9)               # => true
10e10.absolute_approx(10e10+1e-5)              # => false

#--- page 45
98.6.approx(98.66)                           # => false
98.6.approx(98.66, 0.001)                    # => true
#---
