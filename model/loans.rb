require 'pg'
require 'BookShelfController'

class Bookloan

  attr_accessor(:id, :load_id, :date_borrowed)


  # connect to the database
  def self.open_connection
    connection = PG.connect( dbname: 'bookshelf')
    # puts "connection is successful "
  end
#
  def self.all
    connection = self.open_connection

    sql = "SELECT id, load_id, date_borrowed FROM loans"

    results = connection.exec(sql)

    loans = results.map do |loan|
      self.hydrate(loan)
    end
    # method to get all book titles

    loans
    # return array of books object

  end
#
  # def self.find (id)
  #     connection = self.open_connection
  #
  #     sql = "SELECT * FROM book_titles WHERE id = #{id} LIMIT 1"
  #
  #     books = connection.exec(sql)
  #
  #     book = self.hydrate(books[0])
  #
  #     book
  #
  #
  # end
#
#
#
  def self.hydrate(loan_data)
    loan = Bookloan.new

    loan.id = loan_data ['id']
    loan.load_id = loan_data ['load_id']
    loan.date_borrowed = loan_data['date_borrowed']

    loan

  end
#
  # def save
  #
  #   connection = Bookshelf.open_connection
  #
  #   if (!self.id)
  #     sql = "INSERT INTO book_titles (title, author) VALUES ('#{self.title}', '#{self.author}')"
  #   else
  #     sql = "UPDATE book_titles SET title='#{self.title}', author='#{self.author}' WHERE id = #{self.id}"
  #   end
  #
  #   connection.exec(sql)
  #
  # end
  #
  # def self.destroy (id)
  #
  #   connection = self.open_connection
  #
  #   sql = "DELETE FROM book_titles WHERE id = #{id}"
  #
  #   connection.exec(sql)
  #
  # end

end
