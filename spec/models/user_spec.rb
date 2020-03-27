require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validate username' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(30) }
  end

  describe 'Test associations' do
    it { should have_many(:transactions) }
    it { should have_many(:groups) }
  end
end
