require('pry')
require_relative('../models/artist.rb')

artist1 = Artist.new({
  "first_name" => "Iggy", 
  "last_name" => "Pop"
  })

artist1.save()

binding.pry
nil