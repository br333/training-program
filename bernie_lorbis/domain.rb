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

def register
	if self.class.is_available?(name)
	  	REGISTERED_DOMAINS.push(self)
	else
	  	# REGISTERED_DOMAINS.map(&:name).select{ |domain| domain == name }
	  	REGISTERED_DOMAINS.each do |domain_object|
	    	break domain_object.expiration_date if domain_object.name == name
	  	end
	end
end

def show
	REGISTERED_DOMAINS
end

end

domain = Domain.new('google.com', '2020-01-01', '2021-01-01')

unavailable_domains = [
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

unavailable_domains.each do |domains|
	today = Time.now();
	domain = Domain.new(domains, Time.now(), Time.now())
	domain.register
end


puts "Search Domain name"
name = gets.chomp

if name.length < 3
	puts "Please enter atleast 3 characters"
else
	puts "How long do you want to register your domain?"
	puts "[1] 3 months, [2] 1 year, [3] 2 years, [4] 5 years, [5] 10 years"
	date = gets.chomp
	
	durations = [+ 3.months, + 1.year, + 2.year, + 5.year, + 10.year]


	domain = Domain.new(name, Time.new(2020,06,22), Time.new(2021,06,22))
	domain.register
end



 	







