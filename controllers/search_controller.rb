require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../titleize.rb')




# Get all artists

get '/search/search_albums' do
  params["title"] = params["title"].downcase.titleize
  @found_albums = Album.find_by_name(params["title"])
  erb ( :"search/search_albums" )
end

get '/search/search_artists' do
  params["artist"] = params["artist"].downcase.titleize
  @found_albums = Album.find_album_by_artist(params["artist"])
  erb ( :"search/search_artists" )
end