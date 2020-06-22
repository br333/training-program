



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
      REGISTERED_DOMAINS.map{|registered_user| registered_user}
    end
  end

  def registration_date_and_expiration_date
    hash = {}
    hash['registration_date'] = registration_date
    hash['expiration_date']   = expiration_date
    hash
  end

end


@registered_users = []


class User
  attr_accessor :first_name, :last_name, :id, :role

  ARRAY_OF_ROLES = [
    'SUPER ADMIN',
    'CUSTOMER SUPPORT',
    'ADMIN'
  ]

  def initialize(first_name, last_name, id)
    self.first_name = first_name
    self.last_name  = last_name
    self.id         = id
    self.role       = nil
  end

  def set_random_role!
    self.role = ARRAY_OF_ROLES.sample
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end



def register_user(user)
  @registered_users.push(user)
end



# COMMANDS

# user_1 = User.new('first_name_1', 'last_name_1', 1)
# user_2 = User.new('first_name_2', 'last_name_2', 2)

# user_1.set_random_role!
# user_2.set_random_role!

# register_user(user_1)
# register_user(user_2)

# @registered_users


# @registered_users.map{|registered_user| registered_user}


# @registered_users.map(&:first_name)
