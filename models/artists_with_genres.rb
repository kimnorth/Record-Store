class ArtistWithGenre

  attr_accessor :name, :genre

  def initialize(options)
    @name = options["artist_name"]
    @genre = options["genre_name"]
  end

end


