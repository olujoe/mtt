require 'capybara'
require 'site_prism'


class Nav < SitePrism::Section
	element :signin, ".login"
	element :contact_us, :xpath, "//a[text() ='Contact us']"	
end


class Cart < SitePrism::Section
	element :signin, ".login"
	element :continue_shopping, ".button-container .continue"	
	element :proceed_to_checkout, ".button-container .button-medium"
	element :cart_text, ".layer_cart_cart .ajax_cart_product_txt_s .ajax_cart_product_txt"	
	element :cart_quantity, ".layer_cart_cart .ajax_cart_product_txt_s .ajax_cart_quantity"	
end


class HomePage < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url configuration['home_page']

	element :logo, "#header_logo"
	element :women_link, :xpath, "//a[text() ='Women']"			
	element :dresses_link, :xpath, "//a[text() ='Dresses']"		
	element :tshirt_link, :xpath, "//a[text() ='T-shirts']"
	element :featured_items, "#homefeatured"
	element :add_to_cart_button, ".ajax_add_to_cart_button"
	section :nav, Nav, ".nav"
	section :cart, Cart, "#layer_cart"
end