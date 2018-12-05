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

	context 'When submiting an empty form' do

		it 'should open Navigator' do
			@browser.goto('http://www.navigator.ba/')
		end

		it 'should check if properly redirected' do
			expect(@browser.url).to eq('http://www.navigator.ba/#/categories')
			puts "Redirected to:" + @browser.url
		end

		it 'should open the form for creating a place' do
			@browser.span(class: "iconav-plus").click
		end

		it 'should submit an empty form' do
			@browser.button(class: ["btn", "btn-success"]).click!
			sleep 3
		end

		it 'should check for error messages' do
			@errorclass = @browser.element(class: "categories-error-msg")
			expect(@errorclass).to exist
		end
	end

	context 'When submiting a full form' do

		it 'should enter the name for the place' do
			@browser.input(:xpath => '//*[@id="poi_name"]').send_keys "Ortakoy"
		end

		it 'should enter the city of the place' do
			@browser.input(:xpath => '//*[@id="poi_city_name"]').send_keys "Sarajevo"
		end

		it 'should enter the ZIP code of the city' do
			@browser.input(:xpath => '//*[@id="poi_zip_code"]').send_keys "71000"
		end

		it 'should enter the street name' do
			@browser.input(:xpath => '//*[@id="poi_place_id"]').send_keys "Branilaca Sarajeva"
		end

		it 'should enter the house number' do
			@browser.input(:xpath => '//*[@id="poi_house_number"]').send_keys "32"
		end

		it 'should give the alternative address' do
			@browser.input(:xpath => '//*[@id="poi_street_name_alt"]').send_keys "Vakufska 8"
		end

		it 'should give the description of the place' do
			@browser.textarea(:xpath => '//*[@id="poi_description"]').send_keys "Good place"
		end

		it 'should click on "Categories" button' do
			@browser.button(class: ["ember-view", "btn", "btn-small"]).click
		end

		it 'should choose categories from lists' do
			@browser.option(text: "Hrana").click
			@browser.option(text: "Bosanski restoran").click
			@browser.option(text: "Aščinica").click
		end 

		it 'should delete categories chosen' do
			@browser.element(class: "iconav-delete").wait_until_present
		    @browser.element(class: "iconav-delete").click
		end

		it 'should choose a new category' do
			@browser.button(class: ["ember-view", "btn", "btn-small"]).wait_until_present
			@browser.button(class: ["ember-view", "btn", "btn-small"]).click
			@browser.option(text: "Kafa").click
		end

		it 'should give tags' do
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.input(class: ["ui-widget-content", "ui-autocomplete-input"]).send_keys "doner"
		    end

		it 'should choose working hours' do
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.button(id: "btn_day_sat").click
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="working_hours_0_0"]').send_keys "9"
			@browser.input(:xpath => '//*[@id="working_hours_0_1"]').send_keys "23"
			@browser.button(class: ["btn", "btnAddWorkingHours"]).click
		end

		it 'should add phone number' do
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_phone"]').send_keys "030000000"
		end

		it 'should enter mobile phone number' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_mobile_phone"]').send_keys "062000000"
		end

		it 'should enter Fax number' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_fax"]').send_keys "060000000"
		end

		it 'should enter web adress' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_web"]').send_keys "www.ortakoy.ba"
		end

		it 'should enter the e-mail' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_email"]').send_keys "ortakoy@gmail.com"
		end

		it 'should enter Facebook url' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_facebook_url"]').send_keys "www.facebook/ortakoy"
		end

		it 'should enter Twitter url' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_twitter_url"]').send_keys "www.twitter.com/ortakoy"
		end

		it 'should enter instagram url' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_instagram_url"]').send_keys "www.instagram.com/ortakoy"
		end

		it 'should enter Foursqare url' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_foursqare_url"]').send_keys "www.foursqare.com/ortakoy"
		end

		it 'should enter Wikipedia url' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_wikipedia_url"]').send_keys "www.wikipedia.com/ortakoy"
		end

		it 'should enter TripAdvisor url' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_tripadvisor_url"]').send_keys "www.tripadvisor.com/ortakoy"
		end

		it 'should enter Youtube url' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_youtube_url"]').send_keys "www.youtube.com/ortakoy"
		end

		it 'should enter Instagram hashtag' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_instagram_hashtag"]').send_keys "ortakoy"
		end

		it 'should enter wi-fi information' do
			@browser.send_keys :tab
			@browser.input(:xpath => '//*[@id="poi_has_wifi"]').click
			@browser.input(:xpath => '//*[@id="poi_wifi_pass"]').send_keys "ortakoy2017"
			@browser.input(:xpath => '//*[@id="poi_wifi_ssid"]').send_keys "Ortakoy"
		end

		it 'should provide credit cart payment information' do
			@browser.send_keys :tab
			@browser.input(id:"poi_accepts_credit_cards").click
			@browser.element(:xpath => '//*[@id="chk_credit_card_1"]').click
		end

		it 'should try to upload a PDF file as a picture' do
			@browser.file_field.set 'C:\rspec_tutorial\testdata\PDFfile.pdf'
			@browser.span(class: ["icon-remove", "pull-right"]).click
		end

		it 'should try to upload a .docx file as a picture' do
			@browser.file_field.set 'C:\rspec_tutorial\testdata\wordFile.docx'
			@browser.span(class: ["icon-remove", "pull-right"]).click
		end

		it 'should upload JPG file as a picture' do
			@browser.file_field.set 'C:\rspec_tutorial\testdata\jpgFile.jpg'
			sleep 2
		end

		it 'should check for the confirmation message for the file' do
			@browser.element(class: "upload-file-name").exists?
		end

		it 'should enter the comment for the place' do
			@browser.send_keys :tab
			@browser.textarea(id: 'poi_comment').send_keys "Great place!"
		end

		it 'should submit the form to create the place' do
			@browser.button(class: ["btn", "btn-success"]).click!
			sleep 3
		end

		it 'should check if the place is created on the map' do
			@ortakoy = @browser.element(class: "leaflet-popup-content").wait_until_present
			expect(@ortakoy).to exist
		end

	end
end