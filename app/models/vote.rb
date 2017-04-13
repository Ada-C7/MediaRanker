class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
   #ask if the coloring of belongs_to is a problem
end
