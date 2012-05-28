# app.rb
require 'sinatra'

get '/' do
  content = "Ker-POW!"
  symlinks = Dir.entries('../').select do |entry|
    File.symlink? File.join("..", entry)
  end
  symlinks.each do |link|
    content << "<a href='http://#{link}.dev' title='#{link}'>#{link}</a><br/>"
  end
  content
end