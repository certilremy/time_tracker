require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Validation' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(30) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:transactions) }
  end
end
