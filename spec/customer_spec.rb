require('spec_helper')

describe(Customer) do

  describe('.all') do
    it('is empty at first') do
      new_customer = Customer.new({:name => "Kevin", :phone => "2069099317", :animal_preference => "dog", :breed_preference => "golden retreiver"})
      expect(Customer.all).to(eq([]))
    end
  end

  describe("#save") do
    it('add new customer to list of all customers') do
      new_customer = Customer.new({:name => "Kevin", :phone => "2069099317", :animal_preference => "dog", :breed_preference => "golden retreiver"})
      new_customer.save
      expect(Customer.all).to(eq([new_customer]))
    end
  end

  describe("#sort_by_breed_preference") do
    it("re-order customers based on their preferred breed") do
      new_customer = Customer.new({:name => "Erik", :phone => "1234567890", :animal_preference => "dog", :breed_preference => "weiner"})
      new_customer.save
      new_customer2 = Customer.new({:name => "Kevin", :phone => "2069099317", :animal_preference => "dog", :breed_preference => "golden retreiver"})
      new_customer2.save
      expect(Customer.sort_by_breed_preference).to(eq([new_customer2, new_customer]))
    end
  end

end
