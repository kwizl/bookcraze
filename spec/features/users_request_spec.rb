require 'rails_helper'

RSpec.describe 'Users', driver: :selenium_chrome, js: true do
  describe 'User registration process' do
    let(:user) { create(:user) }
    it 'should register a user' do
      visit new_user_path

      fill_in 'Name', with: user[:name]

      click_button 'Register'
      sleep(2)
      visit login_path
      expect(page).to have_content 'Your successfully registered.'
    end
  end
end
