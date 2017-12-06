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

get('/animals') do
  @all_animals = Animal.all

  erb(:animals)
end

get('/add_animal') do
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
