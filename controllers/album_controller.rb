require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')
require_relative('../models/genres.rb')
require_relative('../titleize.rb')

# READ - Display all stock

get "/albums" do
  @all_albums = Album.return_all_stock()
  erb( :"albums/index" )
end

# NEW - get the form back to make a new album

get "/albums/new" do
  @all_genres = Genre.all()
  erb ( :"albums/new" )
end

# CREATE - submit new artist form

# 1. if artist doesn't exist, create a new artist, create a new album and assign album new artist id
# 2. if artist does exist, create a new album and assign the id from the existing artist, then save

post "/albums" do
  params["title"] = params["title"].downcase.titleize
  params["artist"] = params["artist"].downcase.titleize
  album = Album.new(params)
  genre_object = Genre.find_by_name(params["genre"])
  album.save(params["artist"], genre_object.id)
  redirect to( "/albums" )
end

# Delete album - 

get '/albums/:id/delete' do #delete action
  album = Album.find_by_id(params[:id])
  album.delete
  redirect to ('/albums')
end

# Update album - GET form

get '/albums/:id/edit' do
  @album = Album.find_by_id(params[:id])
  erb ( :"albums/edit" )
end

# Update album - POST form

post '/albums/update' do
  updated_album = Album.new(params)
  updated_album.update()
  redirect to('/albums')
end

# can't post back to /albums because that won't update - already a unique route

get '/artists' do
  @all_artists = Artist.all()
  @all_genres = Genre.all()
  erb ( :"artists/index" )
end

get '/search' do
  erb ( :"search/index" )
end