require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts with no stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("Lets you save a stylist to the database and assigns them an ID based on their db location") do
        test_stylist = Stylist.new({:name => 'Bob', :id => nil})
        test_stylist.save()
        expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe(".find") do
    it("Finds a stylist object with a matching id and returns the stylist object") do
      test_stylist = Stylist.new({:name => 'Bob', :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => 'Ann', :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe('#update') do
    it("lets you update a stylist in the database") do
      test_stylist = Stylist.new({:name => 'Bob', :id => nil})
      test_stylist.save()
      test_stylist.update({:name => 'Bobby'})
      expect(test_stylist.name()).to(eq('Bobby'))
    end
  end

  describe('#delete') do
    it("deletes a stylist from the database") do
      test_stylist = Stylist.new({:name => 'Bob', :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => 'Ann', :id => nil})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

end
