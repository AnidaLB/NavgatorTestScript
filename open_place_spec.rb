require 'rspec'
require 'watir'
require 'selenium-webdriver'

browser = Watir::Browser.new :chrome

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.before(:each) { @browser = browser }
  config.before(:all) {browser.window.maximize}
  config.after(:suite) { browser.close unless browser.nil? }
end

describe 'Navigator regression test' do
	context 'When opening the place from a category' do

		it 'should open Navigator' do
			@browser.goto('http://www.navigator.ba/')
		end

		it 'should check if properly redirected' do
			expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
			puts "Redirected to:" + @browser.url
		end

		it 'should open Accommodation category' do
			@browser.element(class: "accommodation").click
		end

		it 'should open Plavi Zamak from the category results' do
			@browser.element(title: 'Plavi zamak').click
		end

		it 'should check if the place is shown on the map' do
			@zamak = @browser.element(class: "leaflet-popup-content")
			@zamak.wait_until_present
			expect(@zamak).to exist
		end

		it 'should go back to the main page' do
			@browser.a(class: ["ember-view", "logo"]).click
		end

		it 'should check if it is the main page' do
			expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
		end

	end
end