class InventoryItem
  attr_accessor :name, :unit_price
 
  def initialize(name, unit_price)  
    @name, @unit_price = name, unit_price
  end

  def price(quantity=1)
    @unit_price * quantity
  end

  #Make InventoryItem#cost an alias for InventoryItem#price
  alias :cost :price

  #The attr_accessor decorator created two methods called "unit_price" and
  #"unit_price=". I'll create aliases for those methods as well.
  alias :unit_cost :unit_price
  alias :unit_cost= :unit_price=
end

p bacon = InventoryItem.new("Chunky Bacon", 3.95)
p bacon.price(100)                                   # => 395.0
p bacon.cost(100)                                    # => 395.0

p bacon.unit_price                                   # => 3.95
p bacon.unit_cost                                    # => 3.95
p bacon.unit_cost = 3.99
p bacon.cost(100)                                    # => 399.0

#---
class Array
  alias :len :length
end

p [1, 2, 3, 4].len                                    # => 4

#---
class Array
  alias :length_old :length
  def length
    return length_old / 2
  end  
end

#---
p array = [1, 2, 3, 4]
p array.length                                       # => 2
p array.size                                         # => 4
p array.length_old                                   # => 4

#---
class Array
  alias :length :length_old
end

p array.length                                       # => 4

#---
class InventoryItem
  def cost(*args)
    price(*args)
  end
end

#---
p bacon.cost(100)                                    # => 399.0

require 'bigdecimal'
require 'bigdecimal/util'
class InventoryItem
  def price(quantity=1, sales_tax=BigDecimal.new("0.0725"))
    base_price = (unit_price * quantity).to_d
    price = (base_price + (base_price * sales_tax).round(2)).to_f
  end
end

p bacon.price(100)                                   # => 427.93
p bacon.cost(100)                                    # => 427.93

#---
p bacon.cost(100, BigDecimal.new("0.05"))            # => 418.95
#---
