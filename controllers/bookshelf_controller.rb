class BookShelfController < Sinatra::Base

  puts File.join(File.dirname(__FILE__), '..')
  puts ("-------------------------")

  #set the root of the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

#sets the views directory correctly
  set :views, Proc.new {File.join(root, "views")}



  configure :development do
    register Sinatra::Reloader
  end

#   get '/form' do
#     erb :form
#   end
#
#   post '/form' do
#   "You said '#{params[:message]}'"
# end

  get "/" do

  	   erb :index

  end

  get("/books") do

    @books = Bookshelf.all
    erb :books

  end

  get "/new" do

    @books = Bookshelf.new
    erb :new_book

  end

  post ("/") do

    book = Bookshelf.new
    book.title = params[:title]
    book.author = params[:author]
    book.save

    redirect "/books"

  end


  get ("/delete") do
  "contain form to delete book off shelf"
  end


  post ("/update") do
  "update the details of the book"
  end



  get ("/:title") do

    "book title is #{params[:title]}"

    redirect "/new_book"

  end



  end
