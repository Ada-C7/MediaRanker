module ApplicationHelper
  def current_user(user_id)
    User.find_by(id: user_id).username
  end

  def find_work(id)
    Work.find(id)
  end
end
