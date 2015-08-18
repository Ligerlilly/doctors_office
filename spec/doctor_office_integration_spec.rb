require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'doctor office path' , { type: :feature } do
  it 'takes you to success page after you enter doctor details and hit Submit' do
    visit '/'
    click_link 'View Doctors'
    click_link 'Add Doctor'
    fill_in 'name', with: 'Dr. Nick'
    click_button "Submit"
    expect(page).to have_content 'Success'
  end
end
