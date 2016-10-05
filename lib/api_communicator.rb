require 'pry'
require 'rest-client'
require 'JSON'


def all_character_hash
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  JSON.parse(all_characters)
end
#gets a hash of all the characters and all their stuff

def get_character_info(character)
    indiv_char = all_character_hash.fetch("results").find {|char_hash| char_hash.fetch("name").downcase == character.downcase}
end

#takes that hash, goes to the key "results" (an array), does find on that to find the first element where name == the input name, and returns that character's whole hash
# puts get_character_info("r2-d2")

def get_character_specific(character, trait)
  return get_character_info(character).fetch(trait)
end
#takes the hash that returns on the previous method and searches that for different keys/traits and returns their value
# puts  get_character_specific("r2-d2", "hair_color")

def all_movie_hash

 all_films = RestClient.get('http://www.swapi.co/api/films/')
 film_hash = JSON.parse(all_films)
end
#gets a hash of all the movies and all their stuff
# puts all_movie_hash

def get_movie_info(film)
 indiv_film = all_movie_hash.fetch("results").find {|movie| movie.fetch("title").downcase == film.downcase}
end
#takes that hash, goes into the key array-results, finds the elemnt where the title is right, and returns its hash (but not neatly)
# puts get_movie_info("Attack of the Clones")

def print_movie_crawl(film)
  20.times {puts " "}
  crawl = get_movie_info(film)["opening_crawl"]
  crawl_array = crawl.split("\n")
  crawl_array.each do |line|
    puts "                                                       #{line}"
    sleep(1)
  end
  50.times do
    sleep(1)
    puts " "
  end
end
#takes a movie title and makes the movie's crawl slowly crawl up the screen

def print_movies
puts "The Phantom Menace"
puts "Attack of the Clones"
puts "Revenge of the Sith"
puts "A New Hope"
puts "The Empire Strikes Back"
puts "Return of the Jedi"
puts "The Force Awakens"
end

def parse_movie(movie)
  movie.each do |x|
    puts x
  end
  return nil
end
#takes the information from before and puts each thing on a new line
# puts parse_movie(get_movie_info("A New Hope"))

def parse_character_movies(films_hash)
  # binding.pry
  array = []
  films_hash.each do |x|
       array << "#{x.fetch("episode_id")}. #{x.fetch("title")}"
     # puts "#{x.fetch("episode_id")} #{x.fetch("title")}"
  end
  # array.sort.each do |y|
  #   puts y
  # end
  # some iteration magic and puts out the movies in a nice list
  array.sort
end

#finds the movies that a character is in, fetches its episode_id and it's title, then sorts them by episode #

def get_full_movies(api_array)
  api_array.collect do |film_url|
    JSON.parse(RestClient.get(film_url))
    # binding.pry
  end
end

#takes an array of film urls and returns the film hashes, kinda like get movie info but starting with the URL




def show_character_movies(character)
  films_array = get_character_specific(character, "films")
  films_hash = get_full_movies(films_array)

  parse_character_movies(films_hash)
end


#so it takes the specific character and his list of movie URLs, gets the full info as per get_full_movies, then parses that i
#nto an episodic list of the movies in which that character appears.


# puts show_character_movies('Owen Lars')

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
