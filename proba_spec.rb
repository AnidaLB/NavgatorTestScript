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


describe 'Navigator test' do
	context "When searching for a place" do


it 'should open the main page' do
 @browser.goto('http://www.navigator.ba/#/categories')
end 

it 'should enter the name of the place' do
	@browser.text_field(:xpath => '//*[@id="ember558"]').send_keys "atlantbh"
end

it 'should click on search icon' do
	@browser.span(:xpath => '//*[@id="ember549"]/a/span').click
end

it 'should open the place from search results' do
	@browser.element(title: "Atlantbh").click
sleep 5
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

end
end
