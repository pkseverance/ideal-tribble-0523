class MoviesController < ApplicationController
    def show
        @movie = Movie.find(params[:id])
        @actors = @movie.actors.order(:age).uniq
        @average_age = Actor.average(:age).round(2).to_f
    end
end