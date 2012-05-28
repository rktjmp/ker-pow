# app.rb
require 'sinatra'

get '/' do
  
  links = Dir.entries('../').select do |entry|
    File.symlink? File.join("..", entry)
  end.map { |symlink| "http://#{symlink}.dev" }

  erb :index, locals: {links: links}

end