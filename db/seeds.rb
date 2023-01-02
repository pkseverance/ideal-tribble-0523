# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@studio1 = Studio.create!(name: 'New Line Cinema', location: 'Burbank, California')
@actor1 = Actor.create!(name: 'Viggo Mortensen', age: 64)
@actor2 = Actor.create!(name: 'Orlando Bloom', age: 45)
@movie1 = @studio1.movies.create!(title: 'The Fellowship of The Ring', creation_year: '2001', genre: 'Fantasy')

@movie1.actors << @actor1
@movie1.actors << @actor2
@actor1.movies << @movie1
@actor2.movies << @movie1