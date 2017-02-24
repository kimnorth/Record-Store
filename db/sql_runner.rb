require('PG')

class SqlRunner

  def run(sql)
    begin
      db = PG.connect({name: "music_store", host: "localhost"})
      db.exec(sql)
    ensure
      db.close()
    end

  end

end