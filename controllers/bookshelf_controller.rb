
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



    get '/books/:id' do
        id = params[:id].to_i

        @books = Bookshelf.find(id)

        erb :show

    end


    get '/books/:id/edit' do

      id = params[:id].to_i

      @books = Bookshelf.find(id)

      erb :edit

    end

    put '/books/:id' do

      id = params[:id].to_i

      book = Bookshelf.find(id)

      book.title = params[:title]
      book.author = params[:author]
      book.save

      redirect "/books"

    end

    delete '/books/:id' do

    id = params[:id].to_i

    Bookshelf.destroy(id)

    redirect "/books"

    end





  end
