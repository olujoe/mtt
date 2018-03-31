require 'capybara'
require 'site_prism'


class Shipping < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{configuration['shipping_page_url']}/

	element :title, "h1"			
	element :terms_of_service, "#cgv"	
	element :continue_shopping, ".cart_navigation .button-exclusive"	
	element :proceed_to_checkout, ".cart_navigation button[name='processCarrier']"
end