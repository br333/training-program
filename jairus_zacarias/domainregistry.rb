domains = [
    "google.com.ph",
    "google.ph",
    "watercup.net.ph",
    "watr.com.ph",
    "water.ph",
    "water.com.ph",
    "googlemask.ph",
    "go0gl3mask.ph",
    "goglemaske.com.ph",
    "wheninrome.com.ph",
    "wheninrone.com.ph",
    "iotechnologies.com.ph",
    "itlog.ph",
    "i0tehnologies.com.ph",
    "waiter.com.ph",
    "lenvovo.org.ph",
    "orgnanization.org.ph",
    "organization.org.ph",
]

domains.each do |domain|
    Domain.new(domain, Time.new(2020,05,22), Time.new(2021,05,22), nil)
    domain.register
end


class Domain
    attr_accessor :name, :registration_date, :expiration_date, :user
    REGISTERED_DOMAINS = []
  
    def initialize(name, registration_date, expiration_date, user)
      if(count(name) < 3) 
        self.name              = name
      else
        puts 'domain name must be greater than 3'
      end 
      self.registration_date = registration_date
      self.expiration_date   = expiration_date
      self.user              = user
    end
  
    def self.is_available?(name)
      !REGISTERED_DOMAINS.map(&:name).include?(name)
    end
  
    def register
      if self.class.is_available?(name)
        REGISTERED_DOMAINS.push(self)
      else
        # 'Domain is not available'
        # Activity
        # self.expiration_date
        REGISTERED_DOMAINS.select{|domain| domain == name}.first.expiration_date
        REGISTERED_DOMAINS.each do |domain_object|
            break domain_object.expiration_date if domain_object.name == name
            puts "#{domain_object.name} already exists. This will expire on #{domain_object.expiration_date}"
        end
      end
    end
  
    def registration_date_and_expiration_date
      hash = {}
      hash['registration_date'] = registration_date
      hash['expiration_date']   = expiration_date
      hash
    end
  
end

puts 'Enter domain name'
name = gets
puts 'Enter registration date Format: YYYY-MM-DD'
registration_date = gets
puts 'Enter expiration date Format: YYYY-MM-DD'
expiration_date = gets
puts 'Enter your name'
user = gets

newDomain = Domain.new(name, Time.new(registration_date), Time.new(expiration_date), user)
newDomain.register


### Intermediate (Domain Validation) 20 mins
2. Domain names must have at least 3 characters (not including the extension) and a maximum of 63 (excluding the extension). Characters allowed are [a-z], [0-9] and [-]. Domains must not start or end with a dash [-] or have simultaneous dashes, and must not contain embedded spaces. Names with only numeric characters will not be accepted. Valid extensions are ph, com.ph, net.ph, and org.ph.

  