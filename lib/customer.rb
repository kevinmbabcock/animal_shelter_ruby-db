class Customer
  @@all_customers = []
  attr_accessor(:name, :phone, :animal_preference, :breed_preference)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @animal_preference = attributes.fetch(:animal_preference)
    @breed_preference = attributes.fetch(:breed_preference)
  end

  def self.all
    @@all_customers
  end

  def save
    @@all_customers.push(self)
  end
end
