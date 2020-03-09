require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @screening_id = options['screening_id']
  end

  def save
    sql = "INSERT INTO tickets
          ( customer_id,
            film_id,
            screening_id)
            VALUES
            ($1, $2, $3)
            RETURNING id"
    values = [@customer_id, @film_id, @screening_id]
    @id = SqlRunner.run(sql, values).first['id'].to_i
    customer_pays_for_ticket
  end

  def customer_pays_for_ticket
    sql = "UPDATE customers SET funds =
          ( SELECT
            ((SELECT funds FROM customers WHERE id = $1)
              -
              (SELECT price FROM films WHERE id = $2)))
          WHERE id = $1"
    values = [@customer_id, @film_id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE tickets SET
          ( customer_id,
            film_id,
            screening_id)
            =
            ($1, $2, $3)
            WHERE
            id = $4"
    values = [@customer_id, @film_id, @screening, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE * FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def most_sold(film_id)
    sql = ""
  end

end
