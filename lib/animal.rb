class Animal
  attr_accessor(:name, :gender, :date_admitted, :type, :breed)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @date_admitted = attributes.fetch(:date_admitted)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
  end

  def self.all
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      date_admitted = animal.fetch("date_admitted")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      animals.push(Animal.new({:name => name, :gender => gender, :date_admitted => date_admitted, :type => type, :breed => breed}))
    end
    animals
  end

  def save
    DB.exec("INSERT INTO animals (name, gender, date_admitted, type, breed) VALUES ('#{@name}', '#{@gender}', '#{@date_admitted}', '#{@type}', '#{@breed}');")
  end

  def ==(other_animal)
    (self.name.==(other_animal.name)).&(self.gender.==(other_animal.gender)).&(self.date_admitted.==(other_animal.date_admitted)).&(self.type.==(other_animal.type)).&(self.breed.==(other_animal.breed))
  end
end
