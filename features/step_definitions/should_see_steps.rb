Then(/^I should see the "(.*?)" page$/) do |page_location|
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	case page_location.downcase
		when 'my account'
			@page = My_Account.new
			expect(@page).to be_all_there
			@page.title #=> "#{configuration['my_account_page']}"

		when 'shopping cart'
			@page = Shopping_Cart.new
			expect(@page).to be_all_there
			@page.title #=> "#{configuration['shopping_cart_page_title']}"

		when 'home'
			@page = HomePage.new
			expect(@page).to be_all_there

		when 'addresses'
			@page = Addresses.new
			expect(@page).to be_all_there
			@page.title #=> "#{configuration['addresses_page_title']}"

		when 'shipping'
			@page = Shipping.new
			expect(@page).to be_all_there
			@page.title #=> "#{configuration['shipping_page_title']}"

		when 'payment'
			@page = Payment.new
			expect(@page).to be_all_there
			@page.title #=> "#{configuration['payment_page_title']}"

		when 'order summary'
			@page = Order_Summary.new
			expect(@page).to be_all_there
			@page.title #=> "#{configuration['order_summary_page_title']}"

		when 'order confirmation'
			@page = Order_Confirmation.new
			expect(@page).to be_all_there
			@page.title #=> "#{configuration['order_confirmation_page_title']}"
			
		else
			fail("The code for see the '#{page_location}' page has not been written. Please check your spelling or add the code for this")
	end
end


When(/^I should see the shopping cart overlay$/) do 
    @page.cart.visible?
end


Then(/^I should see "(.*?)" item in the cart$/) do |number|
	@page.cart.cart_quantity.text.strip.to_i.should == number.to_i - 1
end


When(/^I should see "(.*?)" products in the product table$/) do |number|
    @page.cart_summary.find('tbody').all('tr').length.should == number.to_i
end








