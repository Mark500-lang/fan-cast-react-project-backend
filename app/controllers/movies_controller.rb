class MoviesController < ApplicationController
    get "/movies" do
        movies = Movie.all
        movies.to_json(include: [:users, :reviews])
    end

    get "/movies/:title" do
        movie = Movie.find_by(title: params[:title])
        movie.to_json(include: :reviews)
    end

    post "/movies" do
        title = params[:mytitle]
        release_date = params[:myrelease_date]
        starring = params[:mystarring]
        quote = params[:myquote]

        movie = Movie.create(title: title, release_date: release_date, starring: starring, quote: quote)
    end

    
end