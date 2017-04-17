class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :work

  def index
  end
end
