require 'rails_helper'

RSpec.describe 'Users', driver: :selenium_chrome, js: true do
  let(:user) { User.first }

  it 'sign user in' do
    visit login_path

    within('#login-div > form') do
      fill_in 'Name', with: user.name
    end
    click_button 'Login'
    expect(page).to have_content 'Logged in successfully.'
  end

  it 'signs user out' do
    visit login_path

    within('#login-div > form') do
      fill_in 'Name', with: user.name
    end
    click_button 'Login'

    within('#navbar-header') do
      click_link('Logout')
    end

    sleep(3)
    expect(page).to have_content 'Logged out!'
  end
end
