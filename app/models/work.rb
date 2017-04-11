class Work < ApplicationRecord

  validates :title, presence: true, uniqueness: true

  validates :pub_yr, presence: true, numericality: { only_integer: true, greater_than: 0, :less_than => 2018 }, allow_nil: true

end
