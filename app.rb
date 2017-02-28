require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/genre_controller.rb')
require_relative('controllers/album_controller.rb')
# require_relative('./controllers/genre_controller.rb')
require_relative('models/album.rb')

get '/' do
  @all_albums = Album.return_all_stock()
  erb( :"albums/index" )
end