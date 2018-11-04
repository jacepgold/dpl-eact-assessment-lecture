require 'rails_helper'

def validate_links
  links = 
  [ 
    { name: 'Home Link', id: 'nav_home', url: '/'},
    { name: 'DPS Link', id: 'nav_dps', url: '/'},
    { name: 'Beers Link', id: 'nav_beers', url: '/beers'},
    { name: 'Breweries Link', id: 'nav_breweries', url: '/breweries'}
  ]
  links.each do |link|
    scenario link[:name] do
      click_link(link[:id])
      expect(current_path).to eq(link[:url])
    end
  end
end

feature 'Navbar', js: true do
  before(:each) do
    visit('http://localhost:3000')
  end

  validate_links
end