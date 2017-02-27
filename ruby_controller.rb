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

# SUBMIT new artist



# CURRENTLY - not submitting any information back to the table when I add an new artist - just creating an entry and that's it.