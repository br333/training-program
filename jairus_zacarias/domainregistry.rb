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
      self.name              = name
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




  