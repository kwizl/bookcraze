require 'rails_helper'

RSpec.describe "Articles", type: :request do

  let(:user) { User.first }
  let(:post) { attributes_for(:post) }
  before(:each) do
    login_as(user)
  end

  describe 'the create article process' do
    it 'should create a post' do
      visit root_path

      within('#new_post') do
        fill_in 'Content', with: post[:content]
      end

      click_button 'Save'
      expect(page).to have_content 'Post was successfully created.'
    end
  end
end
