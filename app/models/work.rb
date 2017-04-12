class Work < ApplicationRecord
    has_many :votes
    # def categories_list(works)
    #   @categories_list = []
    #   works.each do | work |
    #     @categories_list << work.category
    #     @categories_list = @categories_list.uniq
    #   end
    #   return @categories_list
    # end


end
