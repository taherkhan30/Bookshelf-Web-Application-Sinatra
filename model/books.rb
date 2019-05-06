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

    sql = "SELECT id, title, author FROM book_titles ORDER BY id"

    results = connection.exec(sql)

    book_title = results.map do |book|
      self.hydrate(book)
    end
    # method to get all book titles

    book_title
    # return array of books object

  end
#
#   def self.find (id)
#       connection = self.open_connection
#
#       sql = "SELECT * FROM post WHERE id = #{id} LIMIT 1"
#
#       posts = connection.exec(sql)
#
#       post = self.hydrate(posts[0])
#
#       post
#
#
#   end
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
# def save
#
#   connection = Post.open_connection
#
#   if (!self.id)
#     sql = "INSERT INTO post (title, body) VALUES ('#{self.title}', '#{self.body}')"
#   else
#     sql = "UPDATE post SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
#   end
#
#   connection.exec(sql)
#
# end
#
# def self.destroy
#
#   connection = self.open_connection
#
#   sql = "DELETE FROM post WHERE id = #{id}"
#
# end
#
# end


end
# puts Post.all
