require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @name = options["name"] if options["name"] # assigns a value if inputted
    @id = options["id"] if options["id"]
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

end