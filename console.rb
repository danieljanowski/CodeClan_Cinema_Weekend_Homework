require ('pry-byebug')
require_relative ('models/customer.rb')
require_relative ('models/film.rb')
require_relative ('models/ticket.rb')
require_relative ('models/screening.rb')

Customer.delete_all
Film.delete_all
Ticket.delete_all
Screening.delete_all

customer1 = Customer.new({'name' => 'Daniel', 'funds' => 100})
customer1.save
customer2 = Customer.new({'name' => 'Samuel', 'funds' => 120})
customer2.save
customer3 = Customer.new({'name' => 'Millie', 'funds' => 200})
customer3.save

film1 = Film.new({'title' => 'Matrix', 'price' => 4})
film1.save
film2 = Film.new({'title' => 'Next', 'price' => 2})
film2.save
film3 = Film.new({'title' => 'Narnia', 'price' => 8})
film3.save

screening1 = Screening.new({'movie_id' => film1.id, 'screening_time' => '16:00', 'screening_capacity' => 3})
screening1.save
screening2 = Screening.new({'movie_id' => film2.id, 'screening_time' => '18:00', 'screening_capacity' => 3})
screening2.save
screening3 = Screening.new({'movie_id' => film3.id, 'screening_time' => '19:00', 'screening_capacity' => 3})
screening3.save
screening4 = Screening.new({'movie_id' => film2.id, 'screening_time' => '20:00', 'screening_capacity' => 3})
screening4.save
screening5 = Screening.new({'movie_id' => film3.id, 'screening_time' => '21:00', 'screening_capacity' => 3})
screening5.save

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id, 'screening_id' => screening1.id})
ticket1.save
ticket1.save
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id, 'screening_id' => screening2.id})
ticket2.save
ticket2.save
ticket2.save
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id, 'screening_id' => screening3.id})
ticket3.save
ticket3.save
ticket3.save
ticket3.save
ticket4 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film2.id, 'screening_id' => screening4.id})
ticket4.save
ticket4.save
ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id, 'screening_id' => screening5.id})
ticket5.save
ticket5.save

binding.pry
nil
