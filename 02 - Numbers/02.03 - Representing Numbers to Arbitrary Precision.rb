#--- page 45

require 'bigdecimal'

p BigDecimal("10").to_s                              # => "0.1E2"
p BigDecimal("1000").to_s                            # => "0.1E4"
p BigDecimal("1000").to_s("F")                       # => "1000.0"

p BigDecimal("0.123456789").to_s                     # => "0.123456789E0"

nm = "0.123456789012345678901234567890123456789"
p nm.to_f                                            # => 0.123456789012346

#--- page 46

p BigDecimal(nm).to_s
# => "0.123456789012345678901234567890123456789E0"

p BigDecimal("105000").split
# => [1, "105", 10, 6]
# That is, 0.105*(10**6)

p BigDecimal("-0.005").split
# => [-1, "5", 10, -2]
# That is, -1 * (0.5*(10**-2))

p (BigDecimal("2") / BigDecimal("3")).to_s
# => "0.6666666666666667E0"

p 2.0/3
# => 0.666666666666667

def two_thirds(precision)
  (BigDecimal("2", precision) / BigDecimal("3")).to_s  
end

p two_thirds(1)                           # => "0.6666666666666667E0"
p two_thirds(4)                           # => "0.6666666666666667E0"
p two_thirds(5)                           # => "0.66666666666666666667E0"
p two_thirds(9)                           # => "0.666666666666666666666667E0"
p two_thirds(13)                          # => "0.6666666666666666666666666667E0"

#--- page 47

p BigDecimal("2").precs                        # => [4, 8]
p BigDecimal("2.000000000000").precs           # => [4, 20]
p BigDecimal("2.000000000001").precs           # => [16, 20]

p (a = BigDecimal("2.01")).precs               # => [8, 8]
p (b = BigDecimal("3.01")).precs               # => [8, 8]

p (product = a * b).to_s("F")                  # => "6.0501"
p product.precs                                # => [8, 24]

p two_thirds = (BigDecimal("2", 13) / 3)
p two_thirds.to_s
# => "0.666666666666666666666666666666666667E0"

p (two_thirds + 1).to_s
# => "0.1666666666666666666666666666666666667E1"

p two_thirds.add(1, 1).to_s                  # => "0.2E1"
p two_thirds.add(1, 4).to_s                  # => "0.1667E1"

require 'bigdecimal/math'
include BigMath

#--- page 48

two = BigDecimal("2")
p BigMath::sqrt(two, 10).to_s("F")
# => "1.4142135623730950488016883515"

p BigMath::sqrt(two, 10).round(10).to_s("F")
# => "1.4142135624"

p BigMath::sqrt(two, 28).round(28).to_s("F")
# => "1.4142135623730950488016887242"

p Math::PI                                    # => 3.14159265358979
p Math::PI.class                              # => Float
p BigMath::PI(1).to_s
# => "0.31415926535897932364198143965603E1"
p BigMath::PI(20).to_s
# => "0.3141592653589793238462643383279502883919859293521427E1"
