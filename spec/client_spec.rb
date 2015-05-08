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



end
