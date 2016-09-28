require 'pry'
require 'rest-client'
require 'JSON'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  indiv_char = character_hash.fetch("results").find {|char_hash|   
char_hash.fetch("name").downcase == character
# binding.pry
} 
    
  film_array = indiv_char.fetch("films")
 names_array = film_array.collect do |x| 
    film_json =  RestClient.get(x)
    film_regular =   JSON.parse(film_json)

end 

  # iterate ove the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film. 
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list 
  #  of movies by title. play around with puts out other info about a given film.
end

# puts get_character_movies_from_api("r2-d2")

def get_movie_info(film)
 all_films = RestClient.get('http://www.swapi.co/api/films/')
 film_hash = JSON.parse(all_films)
 indiv_film = film_hash.fetch("results").find {|movie| movie.fetch("title") == film}


end

# p get_movie_info("A New Hope")

def parse_movie(movie)
  movie.each do |x|
    puts x 
  end 
  return nil
end 

puts parse_movie(get_movie_info("A New Hope"))

def parse_character_movies(films_hash)
  # binding.pry
  films_hash.each_with_index do |x, index|
     puts "#{index+1} #{x.fetch("title")}"
  end 
  # some iteration magic and puts out the movies in a nice list
end




def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
