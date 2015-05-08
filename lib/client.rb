class Client
  attr_reader(:name, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id).to_i
    @id = attributes.fetch(:id, nil)
  end

  define_singleton_method(:all) do
    db_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    db_clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i
      id = client.fetch("id").to_i
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    return clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    @stylist_id = attributes.fetch(:stylist_id, 1)
    DB.exec("UPDATE clients SET name = '#{@name}', stylist_id = #{@stylist_id} WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_singleton_method(:find) do |client_id|
    search_client = nil
    Client.all().each() do |client|
      if client.id() == client_id
        search_client = client
      end
    end
    search_client
  end

end
