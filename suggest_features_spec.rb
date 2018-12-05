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
	context 'When suggesting a feature-reporting a problem' do

		it 'should open Navigator' do
			@browser.goto('http://www.navigator.ba/')
		end

		it 'should check if properly redirected' do
			expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
			puts "Redirected to:" + @browser.url
		end

		it 'should open the form for suggesting features' do
			@browser.element(class: ["icon", "iconav-bubble-2"]).click
		end

		it 'should quit the form' do
			@browser.button(:xpath => '//*[@id="feedback"]/div[5]/div/input[2]').click
		end

		it 'should open the form again' do
			@browser.element(class: ["icon", "iconav-bubble-2"]).click
		end

		it 'should submit an empty form' do
			@browser.input(class: ["btn", "green-button"]).click
		end

		it 'should try to submit the form with only name entered' do
			@browser.input(name: "name_surname").send_keys "Jane Doe"
			@browser.input(class: ["btn", "green-button"]).click
		end

		it 'should try to submit the form with only e-mail entered' do
			@browser.input(name: "name_surname").to_subtype.clear
			@browser.input(class: "emailcheck").send_keys "janedoe@janedoe.com"
			@browser.input(class: ["btn", "green-button"]).click
		end

		it 'should submit the form to the team and the boss with only comment entered' do
			@browser.input(class: "emailcheck").to_subtype.clear
			@browser.textarea(:xpath => '//*[@id="feedback"]/div[3]/textarea').send_keys "Test 1"
			@browser.input(class: ["btn", "green-button"]).click
		end

		it 'should check if the confirmation message appears' do
			@confirmation=@browser.element(class: ["alert", "alert-success"])
			@confirmation.wait_until_present
			expect(@confirmation).to exist
		end

		it 'should sumbit the form with all information filled to the team only' do
			@browser.input(name: "name_surname").wait_until_present
			@browser.input(name: "name_surname").send_keys "Jane Doe"
			@browser.input(class: "emailcheck").send_keys "janedoe@janedoe.com"
			@browser.textarea(:xpath => '//*[@id="feedback"]/div[3]/textarea').send_keys "Test 2"
			@browser.input(:xpath => '//*[@id="feedback"]/div[4]/label[2]/input').click
			@browser.input(class: ["btn", "green-button"]).click
		end

	end
end