require 'pry'
require 'rest-client'
require 'JSON'


def all_character_hash
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  JSON.parse(all_characters)
end

def get_character_info(character)
    indiv_char = all_character_hash.fetch("results").find {|char_hash| char_hash.fetch("name").downcase == character.downcase}
end

def get_character_specific(character, trait)
  return get_character_info(character).fetch(trait)
binding.pry
end


def get_movie_info(film)
 all_films = RestClient.get('http://www.swapi.co/api/films/')
 film_hash = JSON.parse(all_films)
 indiv_film = film_hash.fetch("results").find {|movie| movie.fetch("title") == film}
end



def parse_movie(movie)
  movie.each do |x|
    puts x 
  end 
  return nil
end 

#puts parse_movie(get_movie_info("A New Hope"))

def parse_character_movies(films_hash)
  # binding.pry
  array = []
  films_hash.each do |x|
       array << "#{x.fetch("episode_id")} #{x.fetch("title")}"
     # puts "#{x.fetch("episode_id")} #{x.fetch("title")}" 
  end 
  array.sort.each do |y|
    puts y
  end 
  # some iteration magic and puts out the movies in a nice list
end

def get_full_movies(api_array)
  api_array.collect do |film_url|
    JSON.parse(RestClient.get(film_url))
  end
end



def show_character_movies(character)
  films_array = get_character_specific(character, "films")
  films_hash = get_full_movies(films_array)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
