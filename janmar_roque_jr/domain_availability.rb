REGISTERED_DOMAINS = []

class Domain
    attr_accessor :name, :reg_date, :exp_date

    def initialize(name, reg_date, exp_date)
        self.name = name
        self.reg_date = reg_date
        self.exp_date = exp_date
    end

    def register
        REGISTERED_DOMAINS.push(self)
    end
end


is_available = false
def search(search)
    if !REGISTERED_DOMAINS.map(&:name).include?(search)
        puts "That domain name is available"
        is_available = true
        reg(search)
    else
        puts "That domain name is unavailable"
    end
end 

def reg(name)
    puts "Enter registration period: "
    puts "a. 3 months"
    puts "b. 1 year"
    puts "c. 2 years"
    puts "d. 5 years"
    puts "e. 10 years"
    period = gets.chomp()
    reg_date = Time.now()

    if period == 'a'
        domain = Domain.new(name, reg_date, (reg_date + 7889238))
        puts "Registered #{name} successfully! Hosting ends in #{reg_date + 7889238}"
    elsif period == 'b'
        domain = Domain.new(name, reg_date, (reg_date + 31556952))
        puts "Registered #{name} successfully! Hosting ends in #{reg_date + 31556952}"
    elsif period == 'c'
        domain = Domain.new(name, reg_date, (reg_date + 63113904))
        puts "Registered #{name} successfully! Hosting ends in #{reg_date + 63113904}"
    elsif period == 'd'
        domain = Domain.new(name, reg_date, (reg_date + 157784760))
        puts "Registered #{name} successfully! Hosting ends in #{reg_date + 157784760}"
    elsif period == 'e'
        domain = Domain.new(name, reg_date, (reg_date + 315569520))
        puts "Registered #{name} successfully! Hosting ends in #{reg_date + 315569520}"
    end

    domain.register

    puts "Register another domain? y/n"
    bool = gets.chomp()

    if bool == 'y' or bool == 'Y'
        input
    elsif bool == 'n' or bool == 'N'
        exit
    else
        puts "Invalid input!"
    end

end

def input
    puts "Please input a domain name: "
    name = gets.chomp()
    if name.length < 3 and name.length > 63
        puts "Domain name invalid."
    else
        search(name)
    end
end

input




