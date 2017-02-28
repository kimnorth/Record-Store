require_relative('../db/sql_runner.rb')

class Genre

  attr_accessor :name, :id

  def initialize(options)

    @name = options["name"]
    @id = options["id"] if options["id"]

  end

  def save()

    sql = "INSERT INTO genres
          (name)
          VALUES
          ('#{@name}')
          RETURNING *;"

    returned_sql_object = SqlRunner.run(sql)
    genre_object_array = returned_sql_object.map {|genre| Genre.new(genre)}
    p genre_object_array
    @id = genre_object_array.first.id

  end

  def self.all()

    sql = "SELECT * FROM genres;"
    returned_sql_object = SqlRunner.run(sql)
    genre_object_array = returned_sql_object.map {|genre| Genre.new(genre)} 
    return genre_object_array

  end

  def self.delete_all()

    sql = "DELETE FROM genres;"
    SqlRunner.run(sql)
  
  end

  def self.find_by_name(genre_name)
    sql = "SELECT * FROM genres
          WHERE name = '#{genre_name}';"

    returned_sql_object = SqlRunner.run(sql) 
    genre_object_array = returned_sql_object.map {|genre| Genre.new(genre)}
    return genre_object_array.first
  end

end