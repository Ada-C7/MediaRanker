class Work < ApplicationRecord
has_many :votes

  validates :title, presence: true, uniqueness: true
  validates :created_by, presence: true

  validates :category, presence: true , inclusion: { in: %w(album movie book)}

def show_category(type)
  all = Work.all
  all.select!{|item| item.category == type}
  return all
end

end
