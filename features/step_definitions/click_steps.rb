Then(/^I click the "(.*?)" button$/) do |element|
	case element.downcase
		when 'add to chart'
			@page.featured_items.find(".ajax_add_to_cart_button" , visible: true).click

		when 'overlay proceed to checkout'
			@page.cart.proceed_to_checkout.click
			steps %Q{
				Then I should see the "Shopping Cart" page
			}

		when 'home'
			@page = My_Account.new
			@page.home.click

		when 'continue shopping'
			@page.continue_shopping.click
			steps %Q{
				Then I should see the "Home" page
			}

		when 'proceed to checkout'
			@page.proceed_to_checkout.click

		when 'pay by bank wire'
			@page.pay_by_bank_wire.click

		when 'confirm my order'
			@page.confirm_order.click

		else
			fail("The code for clicking on the '#{element}' button has not been written. Please check your spelling or add the code for this")
	end
end


Then(/^I hover over the "(.*?)" shopping item$/) do |item_location|
	case item_location.downcase
		when 'first'
			item = @page.featured_items.first('.product_img_link')
		when 'second'
			item = @page.featured_items.all('.product_img_link')[1]
		when 'third'
			item = @page.featured_items.all('.product_img_link')[2]
		else
			fail("The code for hovering over the '#{item_location}' shopping item has not been written. Please check your spelling or add the code for this")
	end
	item.hover
end