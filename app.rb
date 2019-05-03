require "sinatra"
require 'sinatra/contrib' #the reloader package
require 'sinatra/reloader' if development?
# require_relative './controllers/posts_controller'
# use Rack::MethodOverride
# run PostController

def page_content(title)
File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  return nil
end

def save_book(title, content)
  File.open("pages/#{title}.txt", "w") do |file|
    file.print(content)
  end
end

get ("/") do

  erb :index

end

get("/books") do

"a list of all available books"

end


get ("/new") do

  erb :new_book

end

post ("/create") do
  save_book(params["title"], params["content"])
end


get ("/delete") do
"contain form to delete book off shelf"
end

get ("/:title") do
  @title = params[:title]
  @content = page_content(@title)
  erb :show
end

# get ("/test") do
#
#   erb :test
#
# end
