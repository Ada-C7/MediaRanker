module WorksHelper

def categories
  categories = @works.group_by { |work| work.category}
end
  
end
