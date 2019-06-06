require 'sinatra'
require 'sinatra/contrib' #the reloader package
require 'sinatra/reloader' if development?
require_relative './model/books'
require 'pg'
require_relative './controllers/bookshelf_controller'
require_relative './controllers/loans_controller'
require_relative './controllers/users_controller'
use Rack::MethodOverride
run BookShelfController
use LoanController
use UserController
