class LoanController < Sinatra::Base

  puts File.join(File.dirname(__FILE__), '..')
  puts ("-------------------------")

  #set the root of the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

#sets the views directory correctly
  set :views, Proc.new {File.join(root, "views")}



  configure :development do
    register Sinatra::Reloader
  end


  get("/loan") do

    @loans = Bookshelf.all
    erb :loan

  end


end
