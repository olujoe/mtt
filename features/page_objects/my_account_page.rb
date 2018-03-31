require 'capybara'
require 'site_prism'


class My_Account < SitePrism::Page
	@configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{@configuration['my_account_page_url']}/

	element :title, "h1"			
	element :order_history, "a", text: "Order history and details"		
	element :my_credit_slips, "a", text: "My credit slips"		
	element :my_addresses, "a", text: "My addresses"		
	element :my_personal_information, "a", text: "My personal information"		
	element :my_wishlists, "a", text: "My wishlists"		
	element :home, ".footer_links .button-small"	
end