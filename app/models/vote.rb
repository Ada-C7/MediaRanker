class Vote < ApplicationRecord
  belongs_to :works , :users

end
