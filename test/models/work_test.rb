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

    let(:work_no_creator) { Work.new(title: "Finding Nemo",
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

  describe 'find_movies' do
    let (:all_works) { Work.all }

    it 'returns an array of movie objects' do
      all_work.find_movies.each do |media|
        media.category.must_equal "movie"
      end
    end
  end
end
