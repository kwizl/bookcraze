require 'rails_helper'

RSpec.describe 'Users', driver: :selenium_chrome, js: true do

  let(:user) { create(:user) }
  
  it "signs me in" do
    visit login_path

    within("#login-div > form") do
      fill_in 'Name', with: user.name
    end
    click_button 'Login'
    expect(page).to have_content 'Logged in successfully.'
  end
end