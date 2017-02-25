require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album.rb')

# Display all stock

get "/music-store" do
  @all_albums = Album.return_all_stock()
  erb( :index )
end

# get the form back to make a new album

get "/music-store/new" do
  erb ( :new )
end

# submit new artist form

post "/music-store" do
  @album = Album.new(params)
  @album.save()
  redirect to( "/music-store" )
end

# Delete album

post "/music-store/:id/delete" do
  @found_album = 
  @album_to_delete = Album.new(@album)
  @album_to_delete.delete()
  redirect to( :index )  
end

