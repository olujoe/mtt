@tech_test
Feature: Login and buy an item
	As a tester, I want to be able to log into the test website, add an item to basket, go to the check out, add another item to basket, accept terms and pay with bank-wire
	
@main_test
Scenario: Login, Add an item to chart from the home page & proceed to checkout
	Given I navigate to the tech test homepage and login
	And I go to the home page from the my account page
	When I add the "first" shopping item to my cart
	And I click the "overlay Proceed to checkout" button
	And I click the "Continue shopping" button
	And I add the "second" shopping item to my cart
	And I click the "overlay Proceed to checkout" button
	Then I should see "2" products in the product table
	And I save the total product cost in the shopping cart summary page

	Given I click the "Proceed to checkout" button
	Then I should see the "Addresses" page
	When I click the "Proceed to checkout" button
	Then I should see the "Shipping" page
	When I accept the terms of service
	And I click the "Proceed to checkout" button
	Then I should see the "Payment" page
	And I should see "2" products in the product table
	
	When I click the "Pay by bank wire" button
	Then I should see the "Order summary" page
	When I click the "Confirm my order" button
	Then I should see the "Order confirmation" page
	And the total product cost should match the cost from the cart summary page