class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4, maximum: 30 }, uniqueness: { case_sensitive: false }
  validate :corect_avatar
  has_many :transactions
  has_many :groups
  has_one_attached :avatar

  private

  def corect_avatar
    errors.add(:avatar, 'must be a JPEG or PNG') if avatar.attached? && !avatar.content_type.in?(%w[image/jpeg image/png])
  end
end
