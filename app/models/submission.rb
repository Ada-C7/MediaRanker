class Submission < ApplicationRecord
     has_many :votes

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
                .limit(5)
     end
end
