class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes
  validates :username, presence: true, uniqueness: true, length: 2..10, allow_blank: false
  before_save :downcase_fields
  before_validation :downcase_fields

  def downcase_fields
    self.username.downcase!
  end
end
