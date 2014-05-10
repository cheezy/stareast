Given(/^I want to adopt puppies$/) do
  visit HomePage
end

When(/^I attempt to checkout without (?:a|an) (.+)$/) do |field|
  navigate_to(CheckoutPage).checkout(field => '')
end

Then(/^I should see the error message "([^"]*)"$/) do |error|
  @current_page.text.should include error
end

When(/^I am checking out$/) do
  navigate_to(CheckoutPage)
end

Then(/^I should be prompted with the following payment options:$/) do |table|
  table.hashes.first do |hsh|
    on(CheckoutPage).payment_options.should include hsh['option']
  end
end

When(/^I complete the adoption of a puppy$/) do
  navigate_all
end

Then(/^I should see the message "([^"]*)"$/) do |message|
  @current_page.text.should include message
end