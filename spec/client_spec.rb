require('spec_helper')

describe(Client) do
  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a client to the database") do
      test_client = Client.new({:name => 'Dan', :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#==") do
    it("adjusts rspec's eq() function to return true if two different client objects share the same name and stylist_id") do
      test_client = Client.new({:name => 'Dan', :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#update') do
    it("updates a clients info in the database") do
      test_client = Client.new({:name => 'Dan', :stylist_id => 1})
      test_client.save()
      test_client.update({:name => 'Danny'})
      expect(test_client.name()).to(eq('Danny'))
    end
  end

  describe('#delete') do
    it("deletes a client from the database") do
      test_client = Client.new({:name => 'Dan', :stylist_id => 1})
      test_client.save()
      test_client2 = Client.new({:name => 'Bob', :stylist_id => 1})
      test_client2.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end

  describe('.find') do
    it("finds a client based on the client id, and returns it as an object") do
      test_client = Client.new({:name => 'Dan', :stylist_id => 1})
      test_client.save()
      test_client2 = Client.new({:name => 'Bob', :stylist_id => 1})
      test_client2.save()
      expect(Client.find(test_client.id())).to(eq(test_client))
    end
  end
end
