require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User Associations' do
    it { should have_many(:articles) }
  end
  context 'User Validation tests' do
    let(:user) { build(:user) }

    it 'should save user' do
      expect(user.save).to be(true)
    end
  end
end
