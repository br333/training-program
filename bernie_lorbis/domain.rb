class Domain

attr_accessor :name, :registration_date, :expiration_date
REGISTERED_DOMAINS = []


def initialize(name, registration_date, expiration_date)
	self.name              = name
	self.registration_date = registration_date
	self.expiration_date   = expiration_date
end

def self.is_available?(name)
	!REGISTERED_DOMAINS.map(&:name).include?(name)
end

def search(domain)
	if self.class.is_available?(domain)
	  	# REGISTERED_DOMAINS.push(self)
	  	'Domain is available'
	else
	  	# REGISTERED_DOMAINS.map(&:name).select{ |domain| domain == name }
	  	REGISTERED_DOMAINS.each do |domain_object|
	    	break domain_object.expiration_date if domain_object.name == name
	  	end
	end
end

end


registered = [
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

registered.each do |registered_domain|
	domain = Domain.new(registered_domain, Time.new(2020,06,22), Time.new(2021,06,22))
	domain.register
end


puts "Search Domain name"
name = gets





