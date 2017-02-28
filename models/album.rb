require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')

class Album

  attr_reader :id
  attr_accessor :title, :quantity, :id_artists, :artist, :buy_price, :sell_price

  def initialize(options)

    @title = options["title"].to_s
    @quantity = options["quantity"].to_i
    @artist = options["artist"].to_s
    @id_artists = options["id_artists"].to_i
    @id = options["id"] if options["id"]
    @buy_price = options["buy_price"].to_i
    @sell_price = options["sell_price"].to_i

  end

  def does_artist_exist?(artist_name) # string

    sql = "SELECT * FROM artists
           WHERE name = '#{artist_name}';"
    returned_query = SqlRunner.run(sql)

    if returned_query != nil
      returned_artist_object = returned_query.map {|artist| Artist.new(artist)}
      return returned_artist_object.first
    else
      return nil # explicit return - will return nil anyway
    end

  end



  def save(artist_name) # CANNOT CREATE ALBUM WITHOUT AN ARTIST STRING AS ARGUMENT

    # if artist exists use the id from that existing entry

    existing_artist = does_artist_exist?(artist_name)

    if existing_artist != nil
      existing_artist_id = existing_artist.id
      sql = "INSERT INTO albums
            (title, quantity, artist, id_artists, buy_price, sell_price)
            VALUES
            ('#{@title}', #{@quantity}, '#{@artist}', #{existing_artist_id}, #{@buy_price}, #{@sell_price})
            RETURNING *;"

      returned_albums = SqlRunner.run(sql)
      album_object = returned_albums.map {|album| Album.new(album)}
      @id = album_object.first.id
      
      # maybe this last bit can be outside loop for DRY reasons

    else

      # create an artist and then create an album and assign it that id

      sql_artist = "INSERT INTO artists
             (name)
             VALUES
             ('#{artist_name}') RETURNING *;"

      new_artist = SqlRunner.run(sql_artist)
      artist_object = new_artist.map {|artist| Artist.new(artist)}
      new_artist_id = artist_object.first.id

      sql_album = "INSERT INTO albums
              (title, quantity, artist, id_artists, buy_price, sell_price)
              VALUES
              ('#{@title}', #{@quantity}, '#{artist_name}', #{new_artist_id}, #{@buy_price}, #{@sell_price})
              RETURNING *;"

      returned_albums = SqlRunner.run(sql_album)
      album_object = returned_albums.map {|album| Album.new(album)}
      @id = album_object.first.id

    end
    
  end

  def return_quantity()
    sql = "SELECT * FROM albums
          WHERE id = #{@id};"
    returned_album = SqlRunner.run(sql)
    returned_album_object_in_array = returned_album.map {|album| Album.new(album)}
    return returned_album_object_in_array.first.quantity
  end

  def self.return_all_stock()
    sql = "SELECT * FROM albums;"
    returned_albums = SqlRunner.run(sql)
    returned_albums_array = returned_albums.map {|album| Album.new(album)}
    return returned_albums_array
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

  def self.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums
           WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find_by_id(album_id)
    sql = "SELECT * FROM albums
            WHERE id = #{album_id};"
    returned_albums = SqlRunner.run(sql)
    returned_album_object_in_array = returned_albums.map {|album| Album.new(album)}
    return returned_album_object_in_array.first
  end

  def update()
    
    sql = "UPDATE albums SET
          (title, quantity, artist, id_artists, buy_price, sell_price)
          =
          ('#{@title}', #{@quantity}, '#{@artist}', #{@id_artists}, #{@buy_price}, #{@sell_price})
          WHERE id = #{@id};"

    SqlRunner.run(sql)
  
  end
 
end