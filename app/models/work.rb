class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true


    # def subset_category()
    #   self.category.uniq each do
    #     subset = self.where()
    #   end
    # end
    #
    # def split_works
    #
    # end
  end
