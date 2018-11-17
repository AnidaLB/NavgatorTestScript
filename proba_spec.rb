
require 'rspec'
require 'selenium-webdriver'
require "watir"
require 'watir-scroll'

browser = Watir::Browser.new :chrome 

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.before(:each) { @browser = browser }
  config.before(:all) {browser.window.maximize}
  config.after(:suite) { browser.close unless browser.nil? }
end

describe 'Testing the page' do


it 'to open Navigator page' do
 @browser.goto('http://www.navigator.ba/#/categories')
end 

 it 'to find search text field ' do
 	@browser.element(:xpath => '//*[@id="ember558"]').click
 end

it 'to enter the place to search' do
	@browser.element(:xpath => '//*[@id="ember558"]').send_keys "atlantbh"
end

it 'to click search icon' do
	@browser.element(:xpath => '//*[@id="ember549"]/a/span').click
end

it 'to open the place from search results' do
	@browser.element(title: "Atlantbh").click
sleep 5
end



  it 'to open the "Create place" form' do
  	@browser.element(class: "iconav-plus").click 
 end

 it 'to find the required textfield "Name" ' do
 	@browser.element(:xpath => '//*[@id="poi_name"]').click
 end

 it 'to enter the name for the place' do
 	@browser.element(:xpath => '//*[@id="poi_name"]').send_keys "Ortakoy"
 end

 it 'to click on "Categories" button' do
 	@browser.button(class: ["ember-view", "btn", "btn-small"]).click
 end

 it 'to choose a category from a list' do
 	@browser.option(text: "Hrana").click
 end



 it 'should create the place' do
# 	#@browser.button(class: ["btn", "btn-success"]).exists?
# 	#@browser.element(class: ["btn", "btn-success"]).scroll.to :center
# 	#@browser.button(class: ["btn", "btn-success"]).wait_until_present
# 	# element=@browser.button(class: ["btn", "btn-success"])
# 	# puts element.location
# 	@browser.scroll.to [248.95834350585938, 1749.5208740234375]
# 	#@browser.button(class: ["btn", "btn-success"]).scroll_into_view
# 	@browser.button(class: ["btn", "btn-success"]).click

 	sleep 2
 end


end
