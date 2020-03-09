require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :movie_id, :screening_time, :screening_capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @screening_time = options['screening_time']
    @screening_capacity = options['screening_capacity']
  end

  def save
    sql = "INSERT INTO screenings
      ( movie_id,
        screening_time,
        screening_capacity)
      VALUES
      ($1, $2, $3)
      RETURNING id"
    values = [@movie_id, @screening_time, @screening_capacity]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update
    sql = "UPDATE screenings SET
    ( movie_id,
      screening_time,
      screening_capacity)
      =
        ($1, $2, $3)
      WHERE
        id = $4"
    values = [@movie_id, @screening_time, @screening_capacity]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM screenings"
    screenings= SqlRunner.run(sql)
    screenings.map {|screening| Screening.new(screening)}
  end
  
end
