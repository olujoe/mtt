require 'capybara'
require 'site_prism'


class Payment < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{configuration['payment_page_url']}/

	element :title, "h1"			
	element :continue_shopping, ".button-exclusive"		
	element :pay_by_bank_wire, ".bankwire"	
	element :pay_by_check, ".cheque"	
	element :total, ".cart_total_price #total_price"	
	element :cart_summary, "#cart_summary"	
end