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
	context 'When suggesting changes for a place' do

		it 'should open Navigator' do
			@browser.goto('http://www.navigator.ba/')
		end

		it 'should check if properly redirected' do
			expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
			puts "Redirected to:" + @browser.url
		end

		it 'should enter the name of the place to search' do
			@browser.input(:xpath => '//*[@id="ember564"]').send_keys "Atlantbh"
		end

		it 'should click on search icon' do
			@browser.span(:xpath => '//*[@id="ember555"]/a/span').click
		end

		it 'should open the place from search results' do
			@browser.element(title: "Atlantbh").click
		end

		it 'should check if the place is shown on the map' do
			@atlant = @browser.element(class: "leaflet-popup-content")
			expect(@atlant).to exist
		end

		it 'should open the "Suggest changes" form' do
			@browser.button(class: ["btn", "btn-success", "btn-suggest-edit"]).click!
		end

		# it 'should check the content' do
		# end

		# it 'should make the suggestion' do
		# end

		it 'should submit the form' do
			@browser.button(class: ["btn", "btn-success"]).click!
		end
		
	end
end


