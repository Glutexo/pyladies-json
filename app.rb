require 'sinatra'
require 'sequel'
require 'json'

DB = Sequel.sqlite 'db/database.sqlite'

def json *args
  JSON.generate *args
end

before do
  content_type 'application/json', charset: 'utf-8'
end

get '/' do
  halt 400, json('Neplatný vstupní bod. Použij /prezidenti.')
end

get '/prezidenti' do
  redirect to '/prezidenti/všichni'
end

get '/prezidenti/všichni' do
  names = []
  DB[:presidents].each do |row|
    names << row[:name]
  end
  json names
end
