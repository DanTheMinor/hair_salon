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

#HERE IS STUFF
#
#You need to add a patch and/or post method for single_stylist/:id
get('/single_stylist/:id') do
  @stylist_list = Stylist.find(params.fetch("id").to_i())
  @all_clients = Client.all()
  erb(:single_stylist)
end

patch('/single_stylist/:id') do
  @stylist_list = Stylist.find(params.fetch("id").to_i)
  client_ids = params.fetch("client_ids", [])
  @stylist_list.update({:client_ids => client_ids})
  @all_clients = Client.all()
  erb(:single_stylist)
end


get('/clients') do
  @all_clients = Client.all()
  erb(:clients)
end

post('/new_client') do
  name = params.fetch("client_name")
  stylist_id = nil #stylist id is not assigned at creation
  new_client = Client.new(:name => name, :stylist_id => stylist_id)
  new_client.save()
  @all_clients = Client.all()
  erb(:clients)
end

delete('/delete_stylist/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.delete()
  @all_stylists = Stylist.all()
  erb(:stylists)
end

delete('/delete_client/:id') do
  @client = Client.find(params.fetch("id").to_i)
  @client.delete()
  @all_clients = Client.all()
  erb(:clients)
end

patch('/update_stylist/:id') do
  new_name = params.fetch("stylist_new_name")
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.update({:name => new_name})
  @all_stylists = Stylist.all()
  erb(:stylists)
end

patch('/update_client/:id') do
  new_name = params.fetch("client_new_name")
  @client = Client.find(params.fetch("id").to_i)
  @client.update({:name => new_name})
  @all_clients = Client.all()
  erb(:clients)
end
