class Customer
  attr_accessor(:name, :phone, :animal_preference, :breed_preference)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @animal_preference = attributes.fetch(:animal_preference)
    @breed_preference = attributes.fetch(:breed_preference)
  end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each do |customer|
      name = customer.fetch("name")
      phone = customer.fetch("phone")
      animal_preference = customer.fetch("animal_preference")
      breed_preference = customer.fetch("breed_preference")
      customers.push(Customer.new({:name => name, :phone => phone, :animal_preference => animal_preference, :breed_preference => breed_preference}))
    end
    customers
  end

  def save
    DB.exec("INSERT INTO customers (name, phone, animal_preference, breed_preference) VALUES ('#{@name}', '#{@phone}', '#{@animal_preference}', '#{@breed_preference}');")
  end

  def ==(other_customer)
    (self.name.==(other_customer.name)).&(self.phone.==(other_customer.phone)).&(self.animal_preference.==(other_customer.animal_preference)).&(self.breed_preference.==(other_customer.breed_preference))
  end

  def self.sort_by_breed_preference
    customers = self.all
    customers.sort_by{|customer| customer.breed_preference}
  end
end
