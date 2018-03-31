When(/^I login using the test login details$/) do 
    @page.nav.signin.click
    @page = Authentication.new
    @page.log_user_in
end


Given(/^I add the "(.*?)" shopping item to my cart$/) do |item|
	case item.downcase
		when 'first'
			number = 1
		when 'second'
			number = 2
		when 'third'
			number = 3
		else
			fail("The code for adding the '#{item}' element to my cart has not been written. Please check your spelling or add the code for this")
	end

	steps %Q{
		When I hover over the "#{item}" shopping item
		And I click the "add to chart" button
		Then I should see the shopping cart overlay
		Then I should see "#{number}" item in the cart
	}
end


When(/^I accept the terms of service$/) do 
    @page.terms_of_service.set(true)
end


When(/^I save the total product cost in the shopping cart summary page$/) do 
	$total_cost = @page.total.text
end


When(/^the total product cost should match the cost from the cart summary page$/) do 
	cost = @page.price.text
	$total_cost.should == cost
end