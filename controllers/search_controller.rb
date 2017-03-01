require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')

# Get all artists

get '/search/search_albums' do
  @found_albums = Album.find_by_name(params["title"])
  erb ( :"search/search_albums" )
end

get '/search/search_artists' do
  puts params
  @found_albums = Album.find_album_by_artist(params["artist"])
  puts @found_albums
  erb (:"search/search_artists")
end