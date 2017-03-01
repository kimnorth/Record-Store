require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')

# I freely admit that this following block of code isn't mine, but I do understand what it is doing! The String class doesn't implicitly have a titleize method, so this is creating a new method for the String class that splits out a phrase, capitalizes each word and joins them back together with a space. It's so I can search for an artist where a user types in lowercase, uppercase, etc.

class String
  def titleize
    self.split(" ").map{|word| word.capitalize}.join(" ")
  end
end

# Get all artists

get '/search/search_albums' do
  params["title"] = params["title"].downcase.titleize
  @found_albums = Album.find_by_name(params["title"])
  erb ( :"search/search_albums" )
end

get '/search/search_artists' do
  params["artist"] = params["artist"].downcase.titleize
  @found_albums = Album.find_album_by_artist(params["artist"])
  erb (:"search/search_artists")
end