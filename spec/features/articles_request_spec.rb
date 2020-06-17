require 'rails_helper'

RSpec.describe "Articles", driver: :selenium_chrome, js: true do

  let(:user) { User.first }
  let(:article) { attributes_for(:article) }
  before(:each) do
    login_as(user)
  end

  describe 'the create article process' do
    it 'should create a article' do
      visit root_path

      within('#article-div > form') do
        fill_in 'Title', with: article[:title], :text, :image, categories_attributes:[:name, :priority]]
        fill_in 'Text', with: article[:text]
        fill_in 'Image', with: attach_file("Browse", Rails.root + "spec/fixtures/the_king.jpeg")
        fill_in 'Name', with: categories_attributes:[:name]
        fill_in 'Priority', with: categories_attributes:[:priority]
      end

      click_button 'Save'
      expect(page).to have_content 'Article was successfully created.'
    end
  end
end
