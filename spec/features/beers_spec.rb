require 'rails_helper'

feature 'Beers', js: true do
  before(:each) do
    visit('http://localhost:3000/beers')
    @wait = Selenium::WebDriver::Wait.new(timeout: 5)
    @wait.until { page.has_css?('#beers_grid') }
  end

  scenario 'All Beers' do
    beers = all('.beer_card')
    expect(beers.count).to eq(10)
  end

  scenario 'Single Beer' do
    beer_card = all('.beer_card').first
    header = beer_card.find('.header').text
    beer_card.find('.more_info_link').click
    @wait.until { page.has_css?('#beer_header') }
    expect(find('#beer_header').text).to eq(header)
    expect(CGI::unescape(current_path)).to eq("/beers/#{header}")
  end

  scenario 'Random Beer'
  scenario 'Beers Search'
  scenario 'Beers Pagination'
end