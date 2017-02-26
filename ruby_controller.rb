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

# Delete album - 

get '/music-store/:id/delete' do #delete action
  @album = Album.find_by_id(params[:id])
  @album.delete
  redirect to ('/music-store')
end