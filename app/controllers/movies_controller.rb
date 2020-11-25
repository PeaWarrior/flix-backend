class MoviesController < ApplicationController
  def index
    now_playing = Movie.getNowPlaying
    popular = Movie.getPopular
    render json: { nowPlaying: now_playing, popular: popular }
  end

  def search
    movies = Movie.searchMovies(movie_params[:query], movie_params[:page])
    render json: movies
  end

  def show
    movie = Movie.find_or_get_by(movie_params[:id])
    render json: movie
  end

  def update
    movie = Movie.find_or_get_by(movie_params[:id])
    if movie_params[:change] == "like"
      movie.likes += 1
    else
      movie.dislikes += 1
    end
    movie.save

    render json: movie
  end


  private
  def movie_params
    params.permit(:id, :query, :change, :page)
  end
end
