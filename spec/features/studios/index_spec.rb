require 'rails_helper'

RSpec.describe Studio do
    describe 'Studio Index' do
        before(:each) do
            studio1 = Studio.create!(name: 'New Line Cinema', location: 'Burbank, California')
            movie1 = studio1.movies.create!(title: 'The Fellowship of The Ring', creation_year: '2001', genre: 'Fantasy')
        end

        it 'lists studios by name and location' do
            visit '/studios'

            expect(page).to have_content(studio1.name)
            expect(page).to have_content(studio1.location)
        end
    end
end