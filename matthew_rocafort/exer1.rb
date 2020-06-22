class Domain
  require 'Date'
  attr_accessor :dom_name, :registration_date, :expiration_date, :user

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

  REGISTERED_DOMAINS = [
  ]

  AVAILABLE_PRODUCTS = [
    'Gsuite',
    'cPanel',
    'Web Design'
  ]

  def initialize(dom_name, registration_date, expiration_date, user)
    self.dom_name = dom_name
    self.registration_date = registration_date
    self.expiration_date = expiration_date
    self.user = user
  end

  def check_search
    !RESTRICTED_DOMAINS.include?(dom_name)
  end

  def check_minimum
    self.dom_name.length >= 3
  end

  def check_double_dash
    !self.dom_name.include?("--")
  end

  def check_spaces
    !self.dom_name.include?(" ")
  end

  def check_pure_numbers
    if /\A[-+]?\d+\z/ === self.dom_name
      'Pure integers not allowed'
    else
      'Domain is not purely integers'
    end
  end

  def check_start_and_end
    if self.dom_name.start_with?("-") && self.dom_name.end_with?("-")
      puts 'Cannot start and end with -.'
    elsif self.dom_name.start_with?("-")
      puts 'Cannot start with -.'
    elsif self.dom_name.end_with?("-")
      puts 'Cannot end with -.'
    else
      puts 'Domain does not start or end with -.'
    end
  end

  def check_date_difference(registration_date, expiration_date)
    date_diff = Date.strptime(expiration_date, "%m/%d/%Y") - Date.strptime(registration_date, "%m/%d/%Y")
    diff = (date_diff.to_i/30.417).round

    if diff == 3 || diff == 12 || diff == 24 || diff == 60 || diff == 120
      puts 'valid months'
    else
      puts diff.to_s + " months is invalid"
    end
  end

  def valid_domain
    self.check_minimum && self.check_double_dash && self.check_spaces
  end
end



#puts 'Enter a registration date.'
#registration_date_temp = gets.chomp

#puts 'Enter an expiration date.'
#expiration_date_temp = gets.chomp

#puts "domain:" + dom_name_temp
#dom = Domain.new(dom_name_temp, registration_date_temp, expiration_date_temp)
#puts dom.search


puts "Enter a domain name."
dom_name_temp = gets.chomp

dom = Domain.new(dom_name_temp, nil, nil, nil)

if dom.check_search
  puts 'available'
  if dom.valid_domain
    puts 'valid'
    #provide valid dates

    puts 'Enter a registration date.'
    registration_date_temp = gets.chomp

    puts 'Enter an expiration date.'
    expiration_date_temp = gets.chomp

    dom.check_date_difference(registration_date_temp, expiration_date_temp)

  else
    puts 'invalid'
  end
else
  puts 'unavailable'
end
