require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'Validation' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(30) }
    it { should validate_presence_of(:amoun) }
  end
  describe 'associations to test' do
    it { should belong_to(:user) }
    it { should belong_to(:group) }
  end
end
