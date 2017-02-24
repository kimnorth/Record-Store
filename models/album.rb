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

  def self.return_all_stock_quantity()

    sql = "SELECT * FROM albums;"

    returned_albums = SqlRunner.run(sql)
    returned_album_objects_in_array = returned_albums.map {|album| Album.new(album)}
    total_stock = 0
    for album in returned_album_objects_in_array
      total_stock += album.quantity.to_i
    end
    return total_stock

  end

end