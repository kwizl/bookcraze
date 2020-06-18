require 'rails_helper'

RSpec.describe "Articles", driver: :selenium_chrome, js: true do

  let(:user) { create(:user) }
  let(:article) { attributes_for(:article) }
  let(:category) { attributes_for(:category) }

  before(:each) do
    login_as(user)
  end

  describe 'the create article process' do
    it 'should create a article' do
      visit root_path

      within("#login-div > form") do
        fill_in 'Title', with: article[:title]
        fill_in 'Text', with: article[:text]
        fill_in 'Image', with: attach_file("Browse", Rails.root + "spec/fixtures/the_king.jpeg")
        fill_in 'Name', with: category[:name]
        fill_in 'Priority', with: category[:priority]
      end
      click_button 'Save'
      expect(page).to have_content 'Article was successfully created.'
      sleep(2)
    end
  end
end
