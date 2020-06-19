require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Category Associations' do
    it { should belong_to(:article) }
  end

  context 'Category Validation tests' do
    let(:user) { User.second }
    let(:article) { attributes_for(:article) }
    let(:category) { attributes_for(:category) }

    it 'should save category' do
      article_data = user.articles.create(article)

      category_data = article_data.categories.build(category)
      expect(category_data.save).to be(true)
    end

    it 'should save not save category with empty name' do
      article_data = user.articles.create(article)

      category_data = article_data.categories.build(category)
      category_data.name = nil
      expect(category_data.save).to be(false)
    end
  end
end
