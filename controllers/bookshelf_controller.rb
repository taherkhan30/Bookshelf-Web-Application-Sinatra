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

  get "/new" do
  	erb :new_book
  end


  end
