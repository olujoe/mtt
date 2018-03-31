require 'capybara'
require 'site_prism'


class Order_Summary < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{configuration['order_summary_page_url']}/

	element :title, "h1"			
	element :other_payment_methods, ".cart_navigation .button-exclusive"	
	element :confirm_order, ".cart_navigation .button-medium"
	element :price, ".cheque-box .price"
end