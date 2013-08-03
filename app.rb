# coding: utf-8
require 'sinatra/base'
require './book.rb'
require 'ostruct'
require 'time'
class App < Sinatra::Base

  get '/' do
    @books = Book.all
    erb :index
  end

  get '/book/:book_id' do |book_id|
    @chapters = Book.get_book(book_id).chapters
  end

  get '/chapter' do
    haml :chapter
  end
end

