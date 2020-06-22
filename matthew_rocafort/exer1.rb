@registered_users = []

class User
  attr_accessor :user_name

  def initialize(user_name)
    self.user_name = user_name
  end
end

def register_user(user)
  @registered_users.push(user)
end

user_1 = User.new('user1')
user_2 = User.new('user2')


register_user(user_1)
register_user(user_2)

@registered_domains = []

class Domain
  attr_accessor :domain_name, :registration_date, :expiration_date, :user

  RESTRICTED_DOMAINS = [
    'google.com.ph',
    'google.ph',
    'watercup.net.ph',
    'watr.com.ph',
    'water.ph',
    'water.com.ph',
    'googlemask.ph',
    'go0gl3mask.ph',
    'goglemaske.com.ph',
    'wheninrome.com.ph',
    'wheninrone.com.ph',
    'iotechnologies.com.ph',
    'itlog.ph',
    'i0tehnologies.com.ph',
    'waiter.com.ph',
    'lenvovo.org.ph',
    'orgnanization.org.ph',
    'organization.org.ph'
  ]

  AVAILABLE_PRODUCTS = [
    'Gsuite',
    'cPanel',
    'Web Design'
  ]

  def initialize(domain_name, registration_date, expiration_date, user)
    self.domain_name = domain_name
    self.registration_date = registration_date
    self.expiration_date = expiration_date
    self.user = user
  end

  def is_available
    !RESTRICTED_DOMAINS.include?(domain_name)
  end

  def check_minimum
    self.domain_name.length >= 3
  end

  def check_double_dash
    !self.domain_name.include?("--")
  end

  def check_spaces
    !self.domain_name.include?(" ")
  end

  def check_pure_numbers
    if /\A[-+]?\d+\z/ === self.domain_name
      'Pure integers not allowed'
    else
      'Domain is not purely integers'
    end
  end

  def check_start_and_end
    if self.domain_name.start_with?("-") && self.domain_name.end_with?("-")
      puts 'Cannot start and end with -.'
    elsif self.domain_name.start_with?("-")
      puts 'Cannot start with -.'
    elsif self.domain_name.end_with?("-")
      puts 'Cannot end with -.'
    else
      puts 'Domain does not start or end with -.'
    end
  end

  def check_date_difference(registration_date, expiration_date)
    date_diff = Date.strptime(expiration_date, "%m/%d/%Y") - Date.strptime(registration_date, "%m/%d/%Y")
    diff = (date_diff.to_i/30.417).round

    diff == 3 || diff == 12 || diff == 24 || diff == 60 || diff == 120
  end

  def valid_domain
    self.check_minimum && self.check_double_dash && self.check_spaces
  end
end

#puts 'Enter a registration date.'
#registration_date_temp = gets.chomp

#puts 'Enter an expiration date.'
#expiration_date_temp = gets.chomp

#puts "domain:" + domain_name_temp
#dom = Domain.new(domain_name_temp, registration_date_temp, expiration_date_temp)
#puts dom.search

puts 'Please enter your name.'
user_name_temp = gets.chomp

#check if user is registered
if @registered_users.map(&:user_name).include?(user_name_temp)
  #prompt user to enter a domain name to be searched or registered
  puts 'Enter a domain name.'
  domain_name_temp = gets.chomp

  dom = Domain.new(domain_name_temp, nil, nil, user_name_temp)

  #check if domain input is valid
  if dom.valid_domain
    #if domain input is valid, proceed with search
    if dom.is_available
      #prompt user to input registration and expiration dates
      puts 'Domain ' + dom.domain_name.to_s + ' is available. Please enter a registration date in this format MM/DD/YYYY.'
      registration_date_temp = gets.chomp

      puts 'Enter an expiration date in this format MM/DD/YYYY.'
      expiration_date_temp = gets.chomp

      #check if dates entered are valid
      if dom.check_date_difference(registration_date_temp, expiration_date_temp)
        puts 'valid diff'
      else
        puts 'invalid diff'
      end

      #ask what product to register
    else
      puts 'Domain is already taken.'
      #renew if already registered to the user
    end
  else
    #if domain input is invalid, prompt error message and
    #go back to search menu
    puts 'Incorrect domain'
  end

else
  #ask user to register
  puts 'User not found. Do you want to register an account? (y/n)'

  if gets.chomp == 'y'
    User.new(user_name_temp)
    puts 'Successfully registered.'
  else
    puts 'Exit...'
  end
end

