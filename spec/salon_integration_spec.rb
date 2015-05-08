require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('pry')

describe('The stylist path', {:type => :feature}) do
  it("displays a list of all stylists") do
    test_stylist = Stylist.new({name: 'Bob', id: 1})
    test_stylist.save()
    visit('/')
    click_link('View a list of stylists')
    expect(page).to have_content(test_stylist.name())
  end
end

describe('The stylist creation path', {:type => :feature}) do
  it("provides a form for creating a new stylist and when form is submitted, saves new stylist to database") do
    visit('/stylists')
    fill_in('stylist_name', :with => 'Bob')
    click_button("Add new stylist")
    expect(page).to have_content('Bob')
  end
end

describe('The client path', {:type => :feature}) do
  it("displays a list of all clients") do
    test_client = Client.new({name: 'Dan', id: 1, stylist_id: 1})
    test_client.save()
    visit('/')
    click_link('View a list of clients')
    expect(page).to have_content('Dan')
  end
end

describe('The client creation path', {:type => :feature}) do
  it("adds a client to the list of clients") do
    visit('/clients')
    fill_in('client_name', :with => 'Dan')
    click_button("Add new client")
    expect(page).to have_content('Dan')
  end
end
