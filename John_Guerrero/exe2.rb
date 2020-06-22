
class Domain

  attr_accessor :name

  LIST_DOMAINS = ["google.com.ph","google.ph","watercup.net.ph","watr.com.ph","w
    ter.ph","water.com.ph","googlemask.ph","go0gl3mask.ph","goglemaske.com.ph","wheninr
    me.com.ph","wheninrone.com.ph","iotechnologies.com.ph","itlog.ph","i0tehnologies.co
    .ph","waiter.com.ph","lenvovo.org.ph","orgnanization.org.ph","organization.org.ph"]

  def initialize(name)
    self.name = name

  end

  # def self.is_available?(name)
  #   !LIST_DOMAINS.map(&:name).include?(name)
  # end
  
  # def register

  #   if self.class.is_available?(name)
  #     LIST_DOMAINS.push(self)
  #   else
  #     LIST_DOMAINS.each do |domain_object|
  #       break domain_object.expiration_date if domain_object.name == name
  #     end
  #   end
  # end

  def search

    if LIST_DOMAINS.include?(self.name)
      'is available.'
    else
      'is not unavailable.'
    end
  end

end




class Val

  attr_accessor :text

  def initialize(name)
    self.name = name
  end

  def validation



    self.gsub(/[^0-9A-Za-z]/,'')

    if self.length < 3 
      'domain too short'
    elsif self.length > 63
      'domain length too much'
    end

  end
  
end

puts "Enter a domain"

name = gets.chomp

Val.validation
