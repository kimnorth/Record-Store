require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Artist.delete_all()
Album.delete_all()

# Artists

artist1 = Artist.new({"first_name" => "Iggy", "last_name" => "Pop"})
artist1.save()

# Albums

album1 = Album.new({"title" => "Lust For Life", "quantity" => 2})
album1.save()

album2 = Album.new({"title" => "The Idiot", "quantity" => 1})
album2.save()

album3 = Album.new({"title" => "Post Pop Depression", "quantity" => 20})
album3.save()

binding.pry
nil