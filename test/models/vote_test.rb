require "test_helper"

describe Vote do
 describe 'relations' do
    it 'can find the user through "user_id"' do
       user = User.new(username: "whoever")
       work = Work.new(category: "movie", title: "One")
       vote = Vote.new(user_id: user.id, work_id: work.id)
       vote.user_id.must_equal user.id
    end

    # it 'can set the author through "author_id"' do
    #    # Create two models
    #    book = Book.new(title: "test book")
    #
    #    # Make the models relate to one another
    #    book.author_id = authors(:metz).id #authors -> authors.yml file
    #
    #    # author should have changed accordingly
    #    book.author.must_equal authors(:metz)
    # end
end
end
