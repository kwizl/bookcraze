require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Article Associations' do
    it { should belong_to(:user) }
    it { should have_many(:categories) }
    it { should have_many(:votes) }
  end
  context 'Article Validation tests' do
    let(:user) { create(:user) }
    let(:article) { attributes_for(:article) }

    it 'should save article' do
      article_data = user.articles.build(article)
      expect(article_data.save).to be(true)
    end

    it 'should not save article with empty title' do
      article_data = user.articles.build(article)
      article_data.title = nil
      expect(article_data.save).to be(false)
    end

    it 'should not save article with empty text' do
      article_data = user.articles.build(article)
      article_data.text = nil
      expect(article_data.save).to be(false)
    end
  end
end
