require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

# Get all artists

get '/search/search_albums' do
  @found_albums = Album.find_by_name(params["title"])
  erb ( :"search/search_albums" )
end

get '/search/search_artists' do
  @found_albums = Artists.find_by_name(params["name"])
  erb (:"search/search_artists")
end