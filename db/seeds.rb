require('pry')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({"first_name" => "Iggy", "last_name" => "Pop"})
artist1.save()

album1 = Album.new({"title" => "Lust For Life", "quantity" => 2})
album1.save()

binding.pry
nil