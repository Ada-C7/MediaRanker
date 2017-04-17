class Submission < ApplicationRecord
     has_many :votes

     validates :title, presence: { message: "Can't nobody vote without a title." },
          uniqueness: { message: "You're in good company. That title has been previously entered. Try another one." }


     def self.show_spotlight
          submissions = Submission.left_outer_joins(:votes)
                .select('submissions.*, COUNT(votes.*) as vote_count')
                .group('submissions.id')
                .order('vote_count DESC')
                .limit(1)
     end


     def self.show(tootsy)
          submissions = Submission.left_outer_joins(:votes)
                .select('submissions.*, COUNT(votes.*) as vote_count')
                .group('submissions.id')
                .order('vote_count DESC')
                .where("category = ?", tootsy)
                .limit(10)
     end

     def self.show_all(tootsy)
          submissions = Submission.left_outer_joins(:votes)
                .select('submissions.*, COUNT(votes.*) as vote_count')
                .group('submissions.id')
                .order('vote_count DESC')
                .where("category = ?", tootsy)
     end
end
