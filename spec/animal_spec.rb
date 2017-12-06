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

end
