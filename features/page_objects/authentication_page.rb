require 'capybara'
require 'site_prism'


class CreateAccount < SitePrism::Section
	element :title, "h1"
	element :email_field, "#email_create"
	element :submit_button, "#SubmitCreate"
end


class Login < SitePrism::Section
	element :title, "h1"
	element :email_field, "#email"
	element :password_field, "#passwd"
	element :submit_button, "#SubmitLogin"	
end


class Authentication < SitePrism::Page
	@@configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url_matcher /#{@@configuration['authentication_page']}/
	element :logo, "#header_logo"	
	section :create_account, CreateAccount, "#create-account_form"
	section :login, Login, "#login_form"

	def log_user_in
		login.email_field.set "#{@@configuration['email']}"
		login.password_field.set "#{@@configuration['password']}"
		login.submit_button.click
	end

end
