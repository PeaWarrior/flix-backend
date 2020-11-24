class MoviesController < ApplicationController
  def search
    movies = Movie.searchMovies(movie_params[:query])
    render json: movies
  end

  def show
    movie = Movie.find_or_get_by(movie_params[:id])
    render json: movie
  end

  def update
    byebug
  end

  # def index
  #   now_playing = Movie.fetchNowPlaying
  #   popular = Movie.fetchPopular
  #   render json: { nowPlaying: now_playing, popular: popular }
  # end

  private
  def movie_params
    params.permit(:id, :query)
  end
end
