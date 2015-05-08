class Client
  attr_reader(:name, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id).to_i
  end

  define_singleton_method(:all) do
    db_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    db_clients.each() do |client|
      name = task.fetch("name")
      stylist_id = task.fetch("stylist_id").to_i
      clients.push(Client.new({:name => name, :stylist_id => stylist_id}))
    end
    return clients
  end


end
