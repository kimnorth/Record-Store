require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')
# require_relative('../models/artists_with_albums.rb')

Artist.delete_all()
Album.delete_all()

# Artists

artist1 = Artist.new({"name" => "Iggy Pop"})
artist1.save()

# Albums

album1 = Album.new({"title" => "Lust For Life", "quantity" => 2, "artist" => artist1.name, "id_artists" => artist1.id})
album1.save()

album2 = Album.new({"title" => "The Idiot", "quantity" => 1, "id_artists" => artist1.id})
album2.save()

album3 = Album.new({"title" => "Post Pop Depression", "quantity" => 20, "id_artists" => artist1.id})
album3.save()


binding.pry
nil