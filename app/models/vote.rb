class Vote < ApplicationRecord
  belongs_to :users
  belongs_to :works
   #ask if the coloring of belongs_to is a problem
end
