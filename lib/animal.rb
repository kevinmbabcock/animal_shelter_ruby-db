class Animal
  @@all_animals = []
  attr_accessor(:name, :gender, :date_admitted, :type, :breed)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @date_admitted = attributes.fetch(:date_admitted)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
  end

  def self.all
    @@all_animals
  end

  def save
    @@all_animals.push(self)
  end
end
