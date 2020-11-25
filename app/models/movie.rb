class Movie < ApplicationRecord

  def self.getNowPlaying
    data = JSON.parse(RestClient.get("#{BASE_URL}/movie/now_playing", {
      params: {
        api_key: "#{ENV["TMDB_API_KEY"]}",
        language: "en-US",
        page: 1
      }
    }))
    movies = data["results"].map {|movie| parse_data(movie, false)}
  end

  def self.getPopular
    data = JSON.parse(RestClient.get("#{BASE_URL}/movie/popular", {
      params: {
        api_key: "#{ENV["TMDB_API_KEY"]}",
        language: "en-US",
        page: 1
      }
    }))
    movies = data["results"].map {|movie| parse_data(movie, false)}
  end

  def self.searchMovies(query, page = 1)
    JSON.parse(RestClient.get("#{BASE_URL}/search/movie", {
      params: {
        api_key: "#{ENV["TMDB_API_KEY"]}",
        language: "en-US",
        page: page,
        query: query
      }
    }))
  end

  def self.find_or_get_by(id)
    movie = Movie.find_by(id: id)
    if !movie
      data = JSON.parse(RestClient.get("#{BASE_URL}/movie/#{id}", {
        params: {
          api_key: "#{ENV["TMDB_API_KEY"]}",
          language: "en-US",
          append_to_response: 'credits'
        }
      }))

      movie_params = self.parse_data(data)
      movie = Movie.create(movie_params)
    end
    
    movie
  end

  private
  def self.get_director(crew)
    crew.find do |crewmember|
      crewmember["job"] === "Director"
    end["name"]
  end

  def self.parse_data(data, query = true)
    parsed_data = {
      id: data["id"],
      title: data["title"],
      director: query ? self.get_director(data["credits"]["crew"]) : nil,
      overview: data["overview"],
      runtime: "#{data["runtime"]} mins",
      released: data["release_date"].split("-")[0],
      poster: "#{IMAGE_BASE_URL}500#{data["poster_path"]}"
    }
  end
end
