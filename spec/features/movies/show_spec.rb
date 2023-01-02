require 'rails_helper'

RSpec.describe Movie do
    before(:each) do
        @studio1 = Studio.create!(name: 'New Line Cinema', location: 'Burbank, California')
        @actor1 = Actor.create!(name: 'Viggo Mortensen', age: 64)
        @actor2 = Actor.create!(name: 'Orlando Bloom', age: 45)
        @movie1 = @studio1.movies.create!(title: 'The Fellowship of The Ring', creation_year: '2001', genre: 'Fantasy')
    end

    describe '#show' do
        it 'should have movie title, creation year, and genre' do
            visit "/movies/#{@movie1.id}"

            expect(page).to have_content(@movie1.title)
            expect(page).to have_content(@movie1.genre)
            expect(page).to have_content(@movie1.creation_year)
        end

        it 'should have a list of actors sorted from youngest to oldest' do
            visit "/movies/#{@movie1.id}"

            expect(page).to have_content(@actor1.name)
            expect(page).to have_content(@actor1.age)

            expect(page).to have_content(@actor2.name)
            expect(page).to have_content(@actor2.age)
        end
    end
end