require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/animal')
require('./lib/customer')
require('pg')

DB = PG.connect({:dbname => "animal_shelter_test"})

get ('/') do
  erb(:index)
end

get('/animals') do
  @all_animals = Animal.all

  erb(:animals)
end
