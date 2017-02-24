class Album

  attr_reader :id
  attr_accessor :title, :quantity

  def initialize(options)

    @title = options["title"]
    @quantity = options["quantity"]
    @id = options["id"] if options["id"]

  end

  def save()

    sql = "INSERT INTO albums
          (title, quantity)
          VALUES
          ('#{@title}', #{@quantity})
          RETURNING *;"

    returned_albums = SqlRunner.run(sql)
    album_object = returned_albums.map {|album| Album.new(album)}
    @id = album_object.first.id

  end

  def return_quantity()

    sql = "SELECT * FROM albums
          WHERE id = #{@id};"

    returned_album = SqlRunner.run(sql)
    returned_album_object_in_array = returned_album.map {|album| Album.new(album)}
    return returned_album_object_in_array.first.quantity

  end

  

end