require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album.rb')
require_relative('./models/artist.rb')

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
  album = Album.new(params)
  album.save(params["artist"])
  redirect to( "/albums" )
end

# Delete album - 

get '/albums/:id/delete' do #delete action
  @album = Album.find_by_id(params[:id])
  @album.delete
  redirect to ('/albums')
end

# Update album - GET form

get '/albums/:id/edit' do
  @album = Album.find_by_id(params[:id])
  p @album
  erb ( :"albums/edit" )
end

# Update album - POST form

post '/albums/update' do
  updated_album = Album.new(params)
  p updated_album
  updated_album.update()
  redirect to('/albums')
end

# can't post back to /albums because that won't update - already a unique route

#<Album:0x007f94fe9004d0 @title="", @quantity=100, @artist="", @id_artists=0, @buy_price=1000, @sell_price=1001>