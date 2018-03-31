Given(/^I navigate to the tech test homepage$/) do
	@page = HomePage.new
  	@page.load
  	@page.displayed?
end


Given(/^I navigate to the tech test homepage and login$/) do
	steps %Q{
		Given I navigate to the tech test homepage
		And I login using the test login details
		Then I should see the "My Account" page
	}
end


Given(/^I go to the home page from the my account page$/) do
	steps %Q{
		When I click the "home" button
		Then I should see the "Home" page
	}
end