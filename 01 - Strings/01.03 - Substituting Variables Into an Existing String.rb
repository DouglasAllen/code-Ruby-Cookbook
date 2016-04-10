#-- page 8

template = 'Oceania has always been at war with %s.'
p template % 'Eurasia'
# => "Oceania has always been at war with Eurasia."
p template % 'Eastasia'
# => "Oceania has always been at war with Eastasia."

p 'To 2 decimal places: %.2f' % Math::PI      # => "To 2 decimal places: 3.14"
p 'Zero-padded: %.5d' % Math::PI              # => "Zero-padded: 00003"

require 'erb'

template = ERB.new %q{Chunky <%= food %>!}
food = "bacon"
p template.result(binding)                       # => "Chunky bacon!"
food = "peanut butter"
p template.result(binding)                       # => "Chunky peanut butter!"

puts template.result
# Chunky peanut butter!

#--- page 9

template = %q{
<% if problems.empty? %>
  Looks like your code is clean!
<% else %>
  I found the following possible problems with your code:
  <% problems.each do |problem, line| %>
    * <%= problem %> on line <%= line %>
  <% end %>
<% end %>}.gsub(/^\s+/, '')
template = ERB.new(template, nil, '<>')

problems = [["Use of is_a? instead of duck typing", 23],
	    ["eval() is usually dangerous", 44]]
p template.run(binding)
# I found the following possible problems with your code:
# * Use of is_a? instead of duck typing on line 23
# * eval() is usually dangerous on line 44

problems = []
p template.run(binding)
# Looks like your code is clean!

class String
  def substitute(binding=TOPLEVEL_BINDING)
    eval(%{"#{self}"}, binding)
  end
end

p template = %q{Chunky #{food}!}                     # => "Chunky \#{food}!"

food = 'bacon'
p template.substitute(binding)                       # => "Chunky bacon!"
food = 'peanut butter'
p template.substitute(binding)                       # => "Chunky peanut butter!"

#--- page 10

food = '#{system("dir")}'
puts template.substitute(binding)
# Chunky #{system("dir")}!
