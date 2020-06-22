
list = ["google.com.ph","google.ph","watercup.net.ph","watr.com.ph","w
ter.ph","water.com.ph","googlemask.ph","go0gl3mask.ph","goglemaske.com.ph","wheninr
me.com.ph","wheninrone.com.ph","iotechnologies.com.ph","itlog.ph","i0tehnologies.co
.ph","waiter.com.ph","lenvovo.org.ph","orgnanization.org.ph","organization.org.ph"]

list.each do |content| 
  Domain.new(content,Time.new("2020-1-1"),Time.new("2021-1-1")).register
end


class Domain

  attr_accessor :name, :registration_date, :expiration_date

  LIST_DOMAINS = []

  def initialize(name,registration_date,expiration_date)
    self.name = name
    self.registration_date = registration_date
    self.expiration_date = expiration_date
  end

  def self.is_available?(name)
    !LIST_DOMAINS.map(&:name).include?(name)
  end
  
  def register
    if self.class.is_available?(name)
      LIST_DOMAINS.push(self)
    else
      LIST_DOMAINS.each do |domain_object|
        break domain_object.expiration_date if domain_object.name == name
      end
    end
  end

  def search(name)
    
  end

end



puts LIST_DOMAINS = []