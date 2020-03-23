class Group < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validate :corect_icon
  belongs_to :user
  has_many :transactions
  has_one_attached :icon

  private

  def corect_icon
    errors.add(:icon, 'must be a JPEG or PNG') if icon.attached? && !icon.content_type.in?(%w[image/jpeg image/png])
  end
end
