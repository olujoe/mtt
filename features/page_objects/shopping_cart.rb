require 'capybara'
require 'site_prism'


class Shopping_Cart < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{configuration['shopping_cart_page_url']}/

	element :title, "h1"			
	element :continue_shopping, ".cart_navigation .button-exclusive"	
	element :proceed_to_checkout, ".cart_navigation .standard-checkout"
	element :product_quantity, "#summary_products_quantity"	
	element :total, ".cart_total_price #total_price"	
	element :cart_summary, "#cart_summary"	
end