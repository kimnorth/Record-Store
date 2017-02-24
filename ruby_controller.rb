require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/album.rb')

# Display all stock

get "/music-store" do
  @all_albums = Album.return_all_stock()
  erb( :"index" )
end

