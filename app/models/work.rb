class Work < ApplicationRecord

  validates :title, presence: true

  validates :category, presence: true , inclusion: { in: %w(album movie book) }

end
