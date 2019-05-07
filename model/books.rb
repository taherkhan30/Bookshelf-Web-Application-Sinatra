require 'pg'

class Bookshelf

  attr_accessor(:id, :title, :author)


  # connect to the database
  def self.open_connection
    connection = PG.connect( dbname: 'bookshelf')
    # puts "connection is successful "
  end
#
  def self.all
    connection = self.open_connection

    sql = "SELECT id, title, author FROM book_titles ORDER BY id DESC"

    results = connection.exec(sql)

    book_title = results.map do |book|
      self.hydrate(book)
    end
    # method to get all book titles

    book_title
    # return array of books object

  end
#
  def self.find (id)
      connection = self.open_connection

      sql = "SELECT * FROM book_titles WHERE id = #{id} LIMIT 1"

      books = connection.exec(sql)

      book = self.hydrate(books[0])

      book


  end
#
#
#
  def self.hydrate(book_data)
    book = Bookshelf.new

    book.id = book_data ['id']
    book.title = book_data ['title']
    book.author = book_data['author']

    book

  end
#
  def save

    connection = Bookshelf.open_connection

    if (!self.id)
      sql = "INSERT INTO book_titles (title, author) VALUES ('#{self.title}', '#{self.author}')"
    else
      sql = "UPDATE book_titles SET title='#{self.title}', author='#{self.author}' WHERE id = #{self.id}"
    end

    connection.exec(sql)

  end

  def self.destroy (id)

    connection = self.open_connection

    sql = "DELETE FROM book_titles WHERE id = #{id}"

    connection.exec(sql)

  end

end
