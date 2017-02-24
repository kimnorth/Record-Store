require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :first_name, :last_name, :group_name

  def initialize(options)
    @first_name = options["first_name"] 
    @last_name = options["last_name"]
    @group_name = options["group_name"] if options["group_name"]
    @id = options["id"] if options["id"]
  end

  def save()
    sql = "INSERT INTO artists
          (first_name, last_name, group_name)
          VALUES
          ('#{@first_name}', '#{@last_name}', '#{@group_name}')
          RETURNING *;"

    returned_artist = SqlRunner.run(sql)
    p returned_artist

  end

end