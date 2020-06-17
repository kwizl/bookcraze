require 'rails_helper'

RSpec.describe "Sessions", river: :selenium_chrome, js: true do

  let(:user) { create(:user) }

  describe 'the signin process' do
    it 'signs user in' do
      visit new_session_path

      within('#login-div > form') do
        fill_in 'Name', with: user.name
      end
      click_button 'Login'
      expect(page).to have_content 'Logged in successfully.'
    end

    it 'signs out user' do
      login_as(user)
      visit articles_path

      within('#logout-link') do
        click_link('Logout')
      end
      visit login_path
      expect(page).to have_content 'Logged out!'
      sleep(3)
    end
  end

end
