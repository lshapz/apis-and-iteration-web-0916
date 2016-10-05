def welcome
  # puts out a welcome message here!
  puts "Hi!"
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp.downcase
  return character
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_movie_from_user
  puts "now enter a movie title"
  movie = gets.chomp.downcase
  return movie
end
