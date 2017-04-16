require "test_helper"

describe Work do

  describe 'validations' do

    let(:work) { Work.new(title: "Finding Nemo",
                          creator: "Pixar",
                          publication_year: "2004",
                          description: "Dad has to safe son after he has been kidnapped") }

    let(:work_no_title) { Work.new(
                          creator: "Pixar",
                          publication_year: "2004",
                          description: "Dad has to safe son after he has been kidnapped") }

    let(:work_no_creator) { Work.new(
                          title: "Finding Nemo",
                          publication_year: "2004",
                          description: "Dad has to safe son after he has been kidnapped") }

    let(:work_non_number_year) { Work.new(title: "Finding Nemo",
                          creator: "Pixar",
                          publication_year: "this is not a number",
                          description: "Dad has to safe son after he has been kidnapped")}

    let(:work_no_attributes) { Work.new }


    it 'can be created with all attributes' do
      results = work.valid?
      results.must_equal true
    end

    it 'will not create when given no attributes' do
        work_no_attributes.valid?.must_equal false
        work_no_attributes.errors.messages.must_include :title
        work_no_attributes.errors.messages.must_include :creator
        work_no_attributes.errors.messages.must_include :publication_year
    end

    # this is the only validation that gets an error message on the example site
    it 'must have title' do
      work_no_title.valid?.must_equal false
      work_no_title.errors.messages.must_include :title
    end

    it 'must have a creator' do
      work_no_creator.valid?.must_equal false
      work_no_creator.errors.messages.must_include :creator
    end

    it 'the publication_year has to be an integer' do
      work_non_number_year.valid?.must_equal false
      work_non_number_year.errors.messages.must_include :publication_year
    end
  end

  describe 'find_top_ten_movies' do
    let (:movies) { Work.find_top_ten_movies }

    it 'returns an collection of work objects' do
      movies.each {|movie| movie.must_be_instance_of Work}
    end

    it 'returns at max 10 items' do
      movies.count.must_be :>=, 0
      movies.count.must_be :<=, 10
    end

    it 'returns nil if there are no movies' do
      Work.destroy_all
      Work.find_top_ten_movies.must_equal []
    end
  end

  describe 'find_top_ten_books' do
    let (:books) { Work.find_top_ten_books }

    it 'returns an collection of work objects' do
      books.each {|book| book.must_be_instance_of Work}
    end

    it 'returns at max 10 items' do
      books.count.must_be :>=, 0
      books.count.must_be :<=, 10
    end

    it 'returns nil if there are no movies' do
      Work.destroy_all
      Work.find_top_ten_books.must_equal []
    end
  end

  describe 'find_top_ten_albums' do
    let (:albums) { Work.find_top_ten_albums }

    it 'returns an collection of work objects' do
      albums.each {|album| album.must_be_instance_of Work}
    end

    it 'returns at max 10 items' do
      albums.count.must_be :>=, 0
      albums.count.must_be :<=, 10
    end

    it 'returns nil if there are no movies' do
      Work.destroy_all
      Work.find_top_ten_movies.must_equal []
    end
  end

  describe 'find_top' do
    # setup do
    #   @user1 = User.find_by(username: "cynthia")
    #   @user2 = User.find_by(username: "gymnast988")
    #
    #   #
    #   # @work = works(:nemo)
    #   # puts @work.id
    #
    #   puts @users1.id
    # end

    # it 'returns one work with the most votes' do
    #   Vote.create!(user_id: @user1.id, work_id: @work.id)
    #   Vote.create!(user_id: @user2.id, work_id: @work.id)
    #   # Vote.create!(user_id: @user3.id, work_id: @work.id)
    #   # Vote.create!(user_id: @user4.id, work_id: @work.id)
    #   Work.find_top.title.must_equal "Finding Nemo"
    # end

    it 'returns nil if no works' do
      Work.destroy_all
      Work.find_top.must_be_nil
    end
  end
end
