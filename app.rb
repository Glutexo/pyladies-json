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
  items = []
  DB[:presidents].order(:id).each do |row|
    items << { jméno: row[:name],
               život: { od: row[:life_from], do: row[:life_to] } }
  end
  json items
end
