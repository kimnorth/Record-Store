require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
require_relative('../models/genres.rb')

Artist.delete_all()
Album.delete_all()
Genre.delete_all()
# Genres

genre1 = Genre.new({"name" => "Alternative Rock"})
genre1.save()

genre2 = Genre.new({"name" => "Big Band"})
genre2.save()

genre3 = Genre.new({"name" => "Blues"})
genre3.save()

genre4 = Genre.new({"name" => "Classical"})
genre4.save()

genre5 = Genre.new({"name" => "Country"})
genre5.save()

genre6 = Genre.new({"name" => "Disco"})
genre6.save()

genre7 = Genre.new({"name" => "Electro"})
genre7.save()

genre8 = Genre.new({"name" => "Electronic"})
genre8.save()

genre9 = Genre.new({"name" => "Funk"})
genre9.save()

genre10 = Genre.new({"name" => "Hip Hop"})
genre10.save()

genre11 = Genre.new({"name" => "Indie"})
genre11.save()

genre12 = Genre.new({"name" => "Jazz"})
genre12.save()

genre13 = Genre.new({"name" => "Metal"})
genre13.save()

genre14 = Genre.new({"name" => "New Wave"})
genre14.save()

genre15 = Genre.new({"name" => "Orchestra"})
genre15.save()

genre16 = Genre.new({"name" => "Other"})
genre16.save()

genre17 = Genre.new({"name" => "Pop"})
genre17.save()

genre18 = Genre.new({"name" => "Punk"})
genre18.save()

genre19 = Genre.new({"name" => "Rock"})
genre19.save()

genre20 = Genre.new({"name" => "Ska"})
genre20.save()

genre21 = Genre.new({"name" => "Soul"})
genre21.save()

genre22 = Genre.new({"name" => "Soundtracks"})
genre22.save()

genre23 = Genre.new({"name" => "World Music"})
genre23.save()

# Artists

artist1 = Artist.new({"name" => "Iggy Pop", "genre_id" => genre1.id})
artist1.save()

# Albums

album1 = Album.new({"title" => "Lust For Life", "quantity" => 2, "artist" => artist1.name, "id_artists" => artist1.id, "buy_price" => 8, "sell_price" => 10})
album1.save(artist1.name, genre1.id)

album2 = Album.new({"title" => "The Idiot", "quantity" => 1, "artist" => artist1.name, "id_artists" => artist1.id, "buy_price" => 8, "sell_price" => 10})
album2.save(artist1.name, genre1.id)

album3 = Album.new({"title" => "Post Pop Depression", "quantity" => 20, "artist" => artist1.name, "id_artists" => artist1.id, "buy_price" => 8, "sell_price" => 10})
album3.save(artist1.name, genre1.id)


binding.pry
nil