require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/genres.rb')

Artist.delete_all()
Album.delete_all()
Genre.delete_all()
# Genres

genre1 = Genre.new({"name" => "Classic Rock"})
genre1.save()

genre2 = Genre.new({"name" => "Hip Hop"})
genre2.save()

# Artists

artist1 = Artist.new({"name" => "Iggy Pop", "genre_id" => genre1.id})
artist1.save()

# Albums

album1 = Album.new({"title" => "Lust For Life", "quantity" => 2, "artist" => artist1.name, "id_artists" => artist1.id, "buy_price" => 8, "sell_price" => 10})
album1.save(artist1.name)

album2 = Album.new({"title" => "The Idiot", "quantity" => 1, "artist" => artist1.name, "id_artists" => artist1.id, "buy_price" => 8, "sell_price" => 10})
album2.save(artist1.name)

album3 = Album.new({"title" => "Post Pop Depression", "quantity" => 20, "artist" => artist1.name, "id_artists" => artist1.id, "buy_price" => 8, "sell_price" => 10})
album3.save(artist1.name)


binding.pry
nil