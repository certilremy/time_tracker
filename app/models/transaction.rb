class Transaction < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :amoun, presence: true
  validate :correct_amount
  belongs_to :user
  belongs_to :group, optional: true 

  private 

  def correct_amount
    errors.add(:amoun, 'must be greater than 0') if amoun && amoun <= 0
  end

end
