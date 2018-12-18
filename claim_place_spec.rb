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
	context 'When claiming the place' do

		it 'should open Navigator' do
			@browser.goto('http://www.navigator.ba/')
		end

		it 'should check if properly redirected' do
			expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
			puts "Redirected to:" + @browser.url
		end

		it 'should search for the place' do
			@browser.input(:xpath => '//*[@id="ember564"]').send_keys "Ortakoy"
			@browser.span(:xpath => '//*[@id="ember555"]/a/span').click
		end

		it 'should open the place from the search results' do
			@browser.element(title: "Ortakoy").click
		end

		it 'should open the form for claiming the place' do
			@browser.button(class: ["btn", "btn-claim"]).click!
		end

		it 'should try to submit an empty form' do
			@browser.input(class: ["btn", "btn-success"]).wait_until_present
			@browser.input(class: ["btn", "btn-success"]).click
		end

		it 'should enter the name' do
			@browser.input(name: "name").send_keys "Jane Doe"
		end

		it 'should enter e-mail' do
			@browser.input(name: "email").send_keys "janedoe@email.com"
		end

		it 'should enter the phone number' do
			@browser.input(name: "phone").send_keys "060000000"
		end

		it 'should submit the form' do
			@browser.input(class: ["btn", "btn-success"]).click
		end

		it 'should check if the confirmation message appears' do
			@confirmation=@browser.element(class: ["alert", "alert-success"])
			@confirmation.wait_until_present
			expect(@confirmation).to exist
		end
	end
end