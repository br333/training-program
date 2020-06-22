class Search

    DOMAINS = [
        {  "name" => "facelinkedin.com.ph", "registration_date" => Time.new(2021 , 1 , 12), "expiration_date" => Time.new(2022, 1, 12)}, 
        {  "name" => "pinterest.com.ph", "registration_date" =>  Time.new(2021 , 1 , 12), "expiration_date" =>  Time.new(2022, 1, 12)} 
    ]

   attr_accessor :name, :registration_date, :expiration_date

    def initialize(name, registration_date, expiration_date)
        self.name              = name
        self.registration_date = registration_date
        self.expiration_date   = expiration_date
      end


    print "Please enter your choice: \n"
    print "Press 1 to search all \n"
    print "Press 2 to search by domain \n"
    choice = gets
    
    integer = choice.to_i
    search = Search::DOMAINS

    if integer == 1
        puts search
    end
    if integer == 2        
        print "Please enter your domain: \n"
        domain = gets
        
        search = 

        puts DOMAINS.find{[x] x['name'] == }

    end

end