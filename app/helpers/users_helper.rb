module UsersHelper
  def find_work(vote)
    Work.find_by(id: vote.work_id)
  end
end
