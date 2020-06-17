require 'rails_helper'

RSpec.describe "Votes", driver: :selenium_chrome, js: true do
  let(:user) { User.first }
  let(:article) { attributes_for(:article) }
  before(:each) do
    login_as(user)
  end

  describe 'the create article process' do
    it 'should increase a vote' do
      visit new_article_path
      
      within('#article-div > form') do
        fill_in 'Title', with: article[:title], :text, :image, categories_attributes:[:name, :priority]]
        fill_in 'Text', with: article[:text]
        fill_in 'Image', with: attach_file("Browse", Rails.root + "spec/fixtures/the_king.jpeg")
        fill_in 'Name', with: categories_attributes:[:name]
        fill_in 'Priority', with: categories_attributes:[:priority]
      end

      click_button 'Save'
      within('vote-div > form') do
        click_button 'Vote'
      end
      expect(page).to have_content 'Article voted!'
    end
  end
end
