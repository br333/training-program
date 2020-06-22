




class Domain
    attr_accessor :name, :reg_date, :exp_date

    REGISTERED_DOMAINS = []

    def initialize(name, reg_date, exp_date)
        self.name = name
        self.reg_date = reg_date
        self.exp_date = exp_date
    end
    
    # def self.is_available(name)
    #     !REGISTERED_DOMAINS.map(&:name).include?(name)
    # end

    def register
        if !REGISTERED_DOMAINS.map(&:name).include?(name)
            REGISTERED_DOMAINS.push(self)
        else
            REGISTERED_DOMAINS.each do |domain_object|
                break domain_object.expiration_date if domain_object.name == name
            end
        end
    end


    def search(name)
        if !REGISTERED_DOMAINS.map(&:name).include?(name)
            puts "That domain name is available"
        else
            puts "That domain name is unavailable"
        end
    end 

end

domain1 = Domain.new('google.com.ph', Time.new(2020,1,1), Time.new(2021,1,1))
domain1.register
# domain2 = ('google.ph', 2020,1,1, 2021,1,1)
# domain3 = ('watercup.net.ph', 2020,1,1, 2021,1,1)
# domain4 = ('watr.com.ph', 2020,1,1, 2021,1,1)
# domain5 = ('water.ph', 2020,1,1, 2021,1,1)
# domain6 = ('water.com.ph', 2020,1,1, 2021,1,1)
# domain7 = ('googlemask.ph', 2020,1,1, 2021,1,1)
# domain8 = ('go0gl3mask.ph', 2020,1,1, 2021,1,1)
# domain9 = ('goglemaske.com.ph', 2020,1,1, 2021,1,1)
# domain10 = ('wheninrome.com.ph', 2020,1,1, 2021,1,1)
# domain11 = ('wheninrone.com.ph', 2020,1,1, 2021,1,1)
# domain12 = ('iotechnologies.com.ph', 2020,1,1, 2021,1,1)
# domain13 = ('itlog.ph', 2020,1,1, 2021,1,1)
# domain14 = ('i0tehnologies.com.ph', 2020,1,1, 2021,1,1)
# domain15 = ('waiter.com.ph', 2020,1,1, 2021,1,1)
# domain16 = ('lenvovo.org.ph', 2020,1,1, 2021,1,1)
# domain17 = ('orgnanization.org.ph', 2020,1,1, 2021,1,1)
# domain18 = ('organization.org.ph', 2020,1,1, 2021,1,1)
puts "Please input a domain name: "
name = gets.chomp()
name.search