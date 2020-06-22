class Register
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

     
      def register
        print "Please enter your choice: \n"
        print "Press 1 if valid for 3 months \n"
        print "Press 2 if valid for 1 year \n"
        print "Press 3 if valid for 2 years \n"
        print "Press 4 if valid for 3 years \n"
        choice = gets

        integer = choice.to_i
        if integer == 1
          expiration_date + 3.months
          DOMAINS.push(self)
        elsif integer == 2
          expiration_date + 12.months
           DOMAINS.push(self)
        elsif integer == 3
          expiration_date + 24.months
          DOMAINS.push(self)
        elsif integer == 4
          expiration_date + 36.months
          DOMAINS.push(self)
        end

      end
end