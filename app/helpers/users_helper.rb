module UsersHelper
  def find_work(vote)
    Work.find(vote.work_id)
  end
end
