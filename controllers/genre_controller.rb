require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/genres.rb')

# READ

get '/genres' do
  @all_genres = Genre.all()
  erb ( :"genres/index" )
end

# NEW

get '/genres/new' do
  @all_genres = Genre.all()
  erb (:"genres/new")
end

# POST

post '/genres/create' do
  new_genre = Genre.new(params)
  new_genre.save()
  redirect to("/genres")
end