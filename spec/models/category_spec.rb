require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Category Associations' do
    it { should belong_to(:article) }
  end

  context 'Category Validation tests' do
    let(:user) { create(:user) }
    let(:article) { attributes_for(:article) }
    let(:category) { attributes_for(:category) }

    it 'should save article' do
      article_data = user.articles.build(article)
      article_save = article_data.save

      category_data = article_save.categories.build(category)
      expect(category_data.save).to be(true)
    end
  end
end
