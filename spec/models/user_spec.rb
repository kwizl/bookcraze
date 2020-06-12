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

    it 'should not save user with empty name' do
      user.name = nil
      expect(user.save).to be(false)
    end
  end
end
