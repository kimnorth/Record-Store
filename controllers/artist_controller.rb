require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')

# READ

get '/artists' do
  @all_artists = Artist.all()
  erb ( :"artists/index" )
end

# NEW

# get '/genres/new' do
#   @all_genres = Genre.all()
#   erb (:"genres/new")
# end

# POST

# post '/genres/create' do
#   new_genre = Genre.new(params)
#   new_genre.save()
#   redirect to("/genres")
# end