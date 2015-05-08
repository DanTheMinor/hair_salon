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

  # describe('#update') do
  #   it("lets you update a stylist in the database") do
  #     test_stylist = Stylist.new({:name => 'Bob', :id => nil})
  #     test_stylist.save()
  #     test_stylist.update({:name => 'Bobby'})
  #     expect(test_stylist.name()).to(eq('Bobby'))
  #   end
  # end
  #
  # describe('#delete') do
  #   it("deletes a stylist from the database") do
  #     test_stylist = Stylist.new({:name => 'Bob', :id => nil})
  #     test_stylist.save()
  #     test_stylist2 = Stylist.new({:name => 'Ann', :id => nil})
  #     test_stylist2.save()
  #     test_stylist.delete()
  #     expect(Stylist.all()).to(eq([test_stylist2]))
  #   end
  # end

end
