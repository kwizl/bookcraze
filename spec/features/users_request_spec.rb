require 'rails_helper'

RSpec.describe 'Users', driver: :selenium_chrome, js: true do
  describe 'User registration process' do
    it 'should register a user' do
      visit new_user_path

      within('#form-registration > form') do
        fill_in 'Name', with: 'Microverse'
      end

      click_button 'Register'
      sleep(2)
      expect(page).to have_content 'Your successfully registered.'
    end
  end
end
