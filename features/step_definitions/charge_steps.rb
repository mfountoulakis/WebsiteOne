Given(/^I fill in appropriate card details for premium(?: for user with email "([^"]*)")?$/) do |email|
  email = email.present? ? email : 'random@morerandom.com'
  submit_card_details_for_button_with('Pay £10.00', email)
end

Given(/^I fill in appropriate card details for premium mob/) do
  submit_card_details_for_button_with('Pay £25.00')
end

Given(/^I fill in appropriate card details for premium f2f/) do
  submit_card_details_for_button_with('Pay £50.00')
end

Given(/^I fill in appropriate card details for premium plus$/) do
  submit_card_details_for_button_with('Pay £100.00')
end

Given(/^I fill in updated card details for premium(?: for user with email "([^"]*)")?$/) do |email|
  email = email.present? ? email : 'random@morerandom.com'
  submit_card_details_for_button_with('Update Card Details', email)
end

def submit_card_details_for_button_with(text, email='random@morerandom.com')
  stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  Capybara.within_frame stripe_iframe do
    fill_in 'Email', with: email
    fill_in 'Card number', with: '4242 4242 4242 4242'
    fill_in 'CVC', with: '123'
    fill_in 'cc-exp', with: '12/2019'
    click_button text
  end
  sleep(3)
end