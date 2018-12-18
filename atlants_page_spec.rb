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
	context 'When opening Atlantbh web page' do

		it 'should open Navigator' do
			@browser.goto('http://www.navigator.ba/')
		end

		it 'should check if properly redirected' do
			expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
			puts "Redirected to:" + @browser.url
		end

		it 'should open the page of Atlantbh' do
			@browser.a(:xpath => '//*[@id="ember628"]/div[3]/div[4]/div/a[2]').click
		end

		it 'should check if the page is opened' do
			@browser.window(:url => /atlantbh/).use
			@browser.refresh
			@browser.url
			expect(@browser.url).to eq('https://www.atlantbh.com/')
		end
	end
end