#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
puts show_character_movies(character)
movie = get_movie_from_user

print_movie_crawl(movie)
