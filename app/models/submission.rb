class Submission < ApplicationRecord
     has_many :votes

     def self.show_spotlight
          submissions = Submission.left_outer_joins(:votes)
                .select('submissions.*, COUNT(votes.*) as vote_count')
                .group('submissions.id')
                .order('vote_count DESC')
                .limit(1)
     end


     def self.show_albums
          submissions = Submission.left_outer_joins(:votes)
                .select('submissions.*, COUNT(votes.*) as vote_count')
                .group('submissions.id')
                .order('vote_count DESC')
                .where("category = ?", "Album")
                .limit(5)
     end

     def self.show_books
          submissions = Submission.left_outer_joins(:votes)
                .select('submissions.*, COUNT(votes.*) as vote_count')
                .group('submissions.id')
                .order('vote_count DESC')
                .where("category = ?", "Book")
                .limit(5)
     end

     def self.show_movie
          submissions = Submission.left_outer_joins(:votes)
                .select('submissions.*, COUNT(votes.*) as vote_count')
                .group('submissions.id')
                .order('vote_count DESC')
                .where("category = ?", "Movie")
                .limit(5)
     end
end
