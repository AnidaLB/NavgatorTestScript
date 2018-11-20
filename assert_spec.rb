require 'rspec'
require 'selenium-webdriver'
require "watir"

browser = Watir::Browser.new :chrome 

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.before(:each) { @browser = browser }
  config.before(:all) {browser.window.maximize}
  config.after(:suite) { browser.close unless browser.nil? }
end



describe 'Navigator smoke test' do
	context "When searching for a place" do


it 'should open the main page' do
 @browser.goto('http://www.navigator.ba/')
end 

it 'should check if properly redirected' do
	expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
	puts @browser.url
	sleep 2
end

it 'should enter the name of the place' do
	@browser.input(:xpath => '//*[@id="ember564"]').send_keys "atlantbh"
end

it 'should click on search icon' do
	@browser.span(:xpath => '//*[@id="ember555"]/a/span').click
end

# 

it 'should open the place from search results' do
	@browser.element(title: "Atlantbh").click

sleep 3
end

it 'should check if the place is shown on the map' do

	@atlant = @browser.element(class: "leaflet-popup-content")
	expect(@atlant).to exist


end

end


context "When creating a place" do

	it 'should open the "Create place" form' do
 	@browser.span(class: "iconav-plus").click 
end

it 'should enter the name for the place' do
	@browser.input(:xpath => '//*[@id="poi_name"]').send_keys "Ortakoy"
end

it 'should click on "Categories" button' do
	@browser.button(class: ["ember-view", "btn", "btn-small"]).click
end

it 'should choose a category from a list' do
	@browser.option(text: "Hrana").click
	sleep 2 
end

it 'should create the place' do
	@browser.button(class: ["btn", "btn-success"]).click!
sleep 5
end

it 'should check if the place is created on the map' do

	@ortakoy = @browser.element(class: ["name", "solo"])
	expect(@ortakoy).to exist

end

end
end
