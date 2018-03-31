require 'capybara'
require 'site_prism'


class Addresses < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{configuration['addresses_page_url']}/

	element :title, "h1"			
	element :continue_shopping, ".cart_navigation .button-exclusive"	
	element :proceed_to_checkout, ".cart_navigation button[name='processAddress']"
end