
City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all


dogs = []
dogsitters = []
cities = []
cities_array = ["Bordeaux", "Barcelone", "Nime", "Madrid"]
cities_array.each do |city|
  cities << City.create(city_name: city)
end

10.times do |index|
  dogs << Dog.create(name: Faker::Superhero.name, city: cities.sample)
end

10.times do |index|
  dogsitters << Dogsitter.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: cities.sample)
end

20.times do |index|
  the_dog = dogs.sample
  the_dogsitter = dogsitters.select{ |dogsitter| dogsitter.city == the_dog.city }.sample
 
  Stroll.create(dog: the_dog, dogsitter: the_dogsitter)
end
