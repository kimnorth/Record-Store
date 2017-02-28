require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name, :genre_id

  def initialize(options)
    @name = options["name"] if options["name"].to_s # assigns a value if inputted
    @id = options["id"] if options["id"]
    @genre_id = options["genre_id"] if options["genre_id"]
  end

  def save()
    sql = "INSERT INTO artists
          (name)
          VALUES
          ('#{@name}')
          RETURNING *;"

    returned_artist = SqlRunner.run(sql)
    artist_object = returned_artist.map {|artist| Artist.new(artist)}
    @id = artist_object.first.id.to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.find_by_name(find_name)
    sql = "SELECT COUNT(*) FROM artists
           WHERE name = '#{find_name}';"
    result = SqlRunner.run(sql)

    if result[0] == 0
      artist_object = Artist.new(find_name)
      return artist_object
    end

    return nil
  end

end