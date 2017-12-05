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

end
