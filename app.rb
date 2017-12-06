require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/animal')
require('./lib/customer')
require('pg')
require('pry')

DB = PG.connect({:dbname => "animal_shelter_test"})

get ('/') do
  erb(:index)
end

# get('/animals') do
#   @all_animals = Animal.all
#   erb(:animals)
# end

get('/add-animal') do
  erb(:add_animal)
end

post('/animals') do
  name = params.fetch("animalName")
  gender = params.fetch("gender")
  type = params.fetch("animalType")
  breed = params.fetch("animalBreed")
  date_admitted = params.fetch("date_admitted")
  new_animal = Animal.new({:name => name, :gender => gender, :type => type, :breed => breed, :date_admitted => date_admitted})
  new_animal.save
  erb(:success)
end

get('/animal-breed') do
  @animals = Animal.sort_by_breed
  erb(:animal_breed)
end

get('/animal-name') do
  @animals = Animal.sort_by_name
  erb(:animal_name)
end

get('/animal-type') do
  @animals = Animal.sort_by_type
  erb(:animal_type)
end

get('/date-admitted') do
  @animals = Animal.sort_by_date
  erb(:date_admitted)
end

get('/add-customer') do
  erb(:add_customer)
end

get('/customers') do
  @customers = Customer.sort_by_breed_preference
  erb(:customers)
end

post('/customers') do
  name = params.fetch("customerName")
  phone = params.fetch("customerPhone")
  type = params.fetch("customerType")
  breed = params.fetch("customerBreed")
  new_customer = Customer.new({:name => name, :phone => phone, :animal_preference => type, :breed_preference => breed})
  new_customer.save
  erb(:success)
end
