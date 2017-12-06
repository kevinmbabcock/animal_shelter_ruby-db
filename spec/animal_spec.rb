require('spec_helper')

describe(Animal) do

  describe(".all") do
    it("is empty at first") do
      new_animal = Animal.new({:name => "Toby", :gender => "male", :date_admitted => "2017-12-01 00:00:00", :type => "dog", :breed => "golden retreiver"})
      expect(Animal.all).to(eq([]))
    end
  end

  describe("#save") do
    it("adds new animal to list of all animals") do
      new_animal = Animal.new({:name => "Toby", :gender => "male", :date_admitted => "2017-12-01 00:00:00", :type => "dog", :breed => "golden retreiver"})
      new_animal.save
      expect(Animal.all).to(eq([new_animal]))
    end
  end

  describe("#sort_by_breed") do
    it("re-order the list of animals alphabetically according to breed") do
      new_animal = Animal.new({:name => "Max", :gender => "male", :date_admitted => "2017-12-01 00:00:10", :type => "dog", :breed => "weiner"})
      new_animal.save
      new_animal2 = Animal.new({:name => "Toby", :gender => "male", :date_admitted => "2017-12-01 00:00:00", :type => "dog", :breed => "golden retreiver"})
      new_animal2.save
      expect(Animal.sort_by_breed).to(eq([new_animal2, new_animal]))
    end
  end

  describe("#sort_by_type") do
    it("re-order the list of animals alphabetically according to breed") do
      new_animal = Animal.new({:name => "Max", :gender => "male", :date_admitted => "2017-12-01 00:00:10", :type => "dog", :breed => "weiner"})
      new_animal.save
      new_animal2 = Animal.new({:name => "Toby", :gender => "male", :date_admitted => "2017-12-01 00:00:00", :type => "cat", :breed => "golden retreiver"})
      new_animal2.save
      expect(Animal.sort_by_type).to(eq([new_animal2, new_animal]))
    end
  end

  describe("#sort_by_name") do
    it("re-order the list of animals alphabetically according to breed") do
      new_animal = Animal.new({:name => "Toby", :gender => "male", :date_admitted => "2017-12-01 00:00:00", :type => "cat", :breed => "golden retreiver"})
      new_animal.save
      new_animal2 = Animal.new({:name => "Max", :gender => "male", :date_admitted => "2017-12-01 00:00:10", :type => "dog", :breed => "weiner"})
      new_animal2.save
      expect(Animal.sort_by_name).to(eq([new_animal2, new_animal]))
    end
  end

  describe('#sort_by_date') do
    it('re-order the list based on the date the animal was admitted') do
      new_animal = Animal.new({:name => "Toby", :gender => "male", :date_admitted => "2017-12-01 00:00:30", :type => "dog", :breed => "golden retreiver"})
      new_animal.save
      new_animal2 = Animal.new({:name => "Max", :gender => "male", :date_admitted => "2017-12-01 00:00:10", :type => "dog", :breed => "wiener"})
      new_animal2.save
      expect(Animal.sort_by_date).to(eq([new_animal2, new_animal]))
    end
  end

end
