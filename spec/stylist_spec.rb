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

end
