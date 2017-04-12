module WorksHelper

  def works_path(category)
    url_for(controller: "works", action: "index", category: category)
  end

  def work_path(category, id)
    url_for(controller: "works", action: "show", category: category, id: id)
  end
end
