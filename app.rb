# app.rb
require 'sinatra'

get '/' do
  
  links = Dir.entries('../').select do |entry|
    File.symlink? File.join("..", entry) and entry != "default"
  end.map { |symlink| "http://#{symlink}.dev" }

  erb :index, locals: {links: links}

end