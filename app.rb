require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/stylists') do
  @all_stylists = Stylist.all()
  erb(:stylists)
end

post('/new_stylist') do
  stylist_name = params.fetch("stylist_name")
  Stylist.new({:name => stylist_name, :id => nil}).save()
  @all_stylists = Stylist.all()
  erb(:stylists)
end

get('/single_stylist/:id') do
  @stylist_list = Stylist.find(params.fetch("id").to_i())
  erb(:single_stylist)
end

get('/clients') do
  @all_clients = Client.all()
  erb(:clients)
end

post('/new_client') do
  name = params.fetch()
end
