require 'capybara'
require 'site_prism'


class Order_Confirmation < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{configuration['order_confirmation_page_url']}/

	element :title, "h1"			
	element :back_to_orders, ".cart_navigation .button-exclusive"	
	element :price, ".box .price"
end