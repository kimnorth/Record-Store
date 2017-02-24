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

end