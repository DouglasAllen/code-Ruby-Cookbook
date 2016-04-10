#--- page 34
test_addresses = [ #The following are valid addresses according to RFC822.
                   'joe@example.com', 'joe.bloggs@mail.example.com',
                   'joe+ruby-mail@example.com', 'joe(and-mary)@example.museum',
                   'joe@localhost', 


                   'joe', 'joe@', '@example.com',
                   'joe@example@example.com',
                   'joe and mary@example.com' ]

valid = '[^ @]+' # Exclude characters always invalid in email addresses
username_and_machine = /^#{valid}@#{valid}$/


p test_addresses.collect { |i| i =~ username_and_machine }
# => [0, 0, 0, 0, 0, nil, nil, nil, nil, nil]
#---
username_and_machine_with_tld = /^#{valid}@#{valid}\.#{valid}$/

p test_addresses.collect { |i| i =~ username_and_machine_with_tld }
# => [0, 0, 0, 0, nil, nil, nil, nil, nil, nil]

#--- page 35
  
def probably_valid?(email)
 valid = '[A-Za-z\d.+-]+' #Commonly encountered email address characters
 (email =~ /#{valid}@#{valid}\.#{valid}/) == 0
end

#These give the correct result.
p probably_valid?('joe@example.com')                # => true
p probably_valid?('joe+ruby-mail@example.com')      # => true
p probably_valid?('joe.bloggs@mail.example.com')    # => true
p probably_valid?('joe@examplecom')                 # => false
p probably_valid?('joe+ruby-mail@example.com')      # => true
p probably_valid?('joe@localhost')                  # => false

#--- page 36

# This address is valid, but probably_valid thinks it's not.
p probably_valid?('joe(and-mary)@example.museum')   # => false

# This address is valid, but certainly wrong.
p probably_valid?('joe@example.cpm')                # => true

require 'resolv'
def valid_email_host?(email)
  hostname = email[(email =~ /@/)+1..email.length]
  valid = true
  begin
    Resolv::DNS.new.getresource(hostname, Resolv::DNS::Resource::IN::MX)
  rescue Resolv::ResolvError
    valid = false
  end
  return valid
end

#example.com is a real domain, but it won't accept mail
p valid_email_host?('joe@example.com')          # => false

#lcqkxjvoem.mil is not a real domain.
p valid_email_host?('joe@lcqkxjvoem.mil')       # => false

#oreilly.com exists and accepts mail, though there might not be a 'joe' there.
p valid_email_host?('joe@oreilly.com')          # => true

