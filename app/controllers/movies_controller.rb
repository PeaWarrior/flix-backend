class MoviesController < ApplicationController

  def index
    now_playing = Movie.getNowPlaying
    popular = Movie.getPopular
    if now_playing.length > 0 && popular.length > 0
      render json: { nowPlaying: now_playing, popular: popular }
    else
      render json: { error: "Could not find any movies." }, status: :no_content
    end
  end

  def search
    movies = Movie.searchMovies(movie_params[:query], movie_params[:page])

    if movies["results"].length > 0
      render json: movies
    else
      render json: { error: "Could not find any results for #{query}. Please try another term."}, status: :no_content
    end
  end

  def show
    movies = Movie.find_or_get_by(movie_params[:id])

    if movies[:movie]
      render json: movies
    else
      render json: { error: "Could not find movie."}, status: :bad_request
    end
  end

  def update
    movie = Movie.find(movie_params[:id])

    if movie
      movie_params[:change] == "like" ? movie.likes +=1 : movie.dislikes +=1
      movie.save
      render json: movie
    else
      render json: {error: "Unable to find movie in the database." }, status: :bad_request
    end
  end


  private
  def movie_params
    params.permit(:id, :query, :change, :page)
  end

end
