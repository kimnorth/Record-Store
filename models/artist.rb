require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :first_name, :last_name, :group_name

  def initialize(options)
    @first_name = options["first_name"] if options["first_name"] # assigns a value if inputted
    @last_name = options["last_name"]
    @group_name = options["group_name"] # if options["group_name"]
    @id = options["id"] if options["id"]
  end

  def save()
    sql = "INSERT INTO artists
          (first_name, last_name, group_name)
          VALUES
          ('#{@first_name}', '#{@last_name}', '#{@group_name}')
          RETURNING *;"

    returned_artist = SqlRunner.run(sql)
    artist_object = returned_artist.map {|artist| Artist.new(artist)}
    @id = artist_object.first.id
  end

  

end