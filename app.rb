require 'sinatra'
require 'sequel'
require 'json'

DB = Sequel.connect ENV['DATABASE_URL']

def json *args
  JSON.generate *args
end

def date_where date
  Proc.new do
    (from <= date) & ((to >= date) | { to: nil })
  end
end

def params_date params
  Date.new *params['captures'].map(&:to_i)
end

def presidents *args, &block
  items = {}
  DB[:office].where(*args, &block).each do |row|
    items[row[:president]] = { jméno: nil,
                                    život: { od: nil, do: nil },
                                    úřad: [] } unless items.has_key? row[:president]
    items[row[:president]][:úřad] << { od: row[:from], do: row[:to] }
  end

  DB[:president].where(id: items.keys).each do |row|
    item              = items[row[:id]]
    item[:jméno]      = row[:name]
    item[:život][:od] = row[:life_from]
    item[:život][:do] = row[:life_to]
  end

  items.values
end

before do
  content_type 'application/json', charset: 'utf-8'
end

get %r{^/prezidenti/?$} do
  redirect to '/prezidenti/všichni'
end

get '/prezidenti/všichni' do
  json presidents
end

get %r{^/prezidenti/(\d+)$} do
  date = params_date params
  halt 400, json('Do budoucnosti nevidíme.') if date.year > Date.today.year
  json presidents date_where date
end

get %r{^/prezidenti/(\d+)-(\d+)-(\d+)$} do
  date = params_date params
  halt 400, json('Do budoucnosti nevidíme.') if date > Date.today
  json presidents date_where date
end

get %r{^/prezidenti/.*$} do
  halt 400, json('Neplatná vstupní hodnota. Použij /prezidenti/všichni, /prezidenti/[rok], nebo /prezidenti/[datum].')
end

get %r{} do
  halt 400, json('Neplatný vstupní bod. Použij /prezidenti.')
end
