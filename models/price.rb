require_relative('../db/sql_runner.rb')

class Price

  def initialize(options)

    @buy_price = options["buy_price"]
    @sell_price = options["sell_price"]
    @id = options["id"] if options["id"]

  end

  def save()

    sql = "INSERT INTO price
          (buy_price, sell_price)
          VALUES
          (#{@buy_price}, #{@sell_price})
          RETURNING *;"
  end

  

end