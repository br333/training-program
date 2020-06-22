class Domain
  attr_accessor :dom_name

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

  def initialize(dom_name)
    self.dom_name = dom_name
  end

  def search
    if !RESTRICTED_DOMAINS.include?(self.dom_name)
      'Domain available.'
    else
      'Domain unavailable.'
    end
  end

  def check_minimum
  	#self.dom_name.index('.')
    if self.dom_name.length < 3
      'Too short.'
    else
      'Domain has minimum of 3 characters.'
    end
  end

  def check_double_dash
    if self.dom_name.include?("--")
      '-- not allowed'
    else
      'Domain has no --.'
    end
  end

  def check_spaces
    if self.dom_name.include?(" ")
      'Space/s not allowed'
    else
      'Domain has no space/s.'
    end
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
      'Cannot start and end with -.'
    elsif self.dom_name.start_with?("-")
      'Cannot start with -.'
    elsif self.dom_name.end_with?("-")
      'Cannot end with -.'
    else
      'Domain does not start or end with -.'
    end
  end
end

puts "Enter a domain name."
dom_name_temp = gets

#puts "domain:" + dom_name_temp
Domain.new(dom_name_temp).check_pure_numbers