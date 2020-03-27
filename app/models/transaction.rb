class Transaction < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :amoun, presence: true
  belongs_to :user
  belongs_to :group, optional: true
end
