class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  #
  # validates :isbn, uniqueness: true
  # def method_name
  #
  # end

end
