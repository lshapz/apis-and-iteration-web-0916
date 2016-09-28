require 'pry'
require 'rest-client'
require 'JSON'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  indiv_char = character_hash.fetch("results").find {|char_hash|   
char_hash.fetch("name").downcase == character.downcase
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

def parse_character_movies(films_hash)
  # binding.pry
  array = []
  films_hash.each_with_index do |x, index|
     array << x.fetch("title")
  end 
  # some iteration magic and puts out the movies in a nice list
end





def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
# puts parse_character_movies("R2-D2")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?