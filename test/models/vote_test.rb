require "test_helper"

describe Vote do
  describe 'validations' do
    before do
      @user_id = User.first.id
      @work_id = Work.first.id
    end

    let(:vote1) { Vote.create!(user_id: @user_id, work_id: @work_id) }
    let(:vote2) { Vote.new(user_id: @user_id, work_id: @work_id) }


    it 'lets you vote if the id combo is unique' do
      vote1.valid?.must_equal true
    end

    it 'will fail if id combo is not unique' do
      vote1.save
      vote2.valid?.must_equal false
    end

    it 'will fail if user ID DNE' do
      vote = Vote.new(user_id: @user_id, work_id: '3')
      vote.valid?.must_equal false
    end

    it 'will fail if work ID DNE' do
      vote = Vote.new(user_id: '2', work_id: @work_id)
      vote.valid?.must_equal false
    end

    it 'will fails if both work and user ids DNE' do
      vote = Vote.new(user_id: '1', work_id: '1')
      vote.valid?.must_equal false
    end
  end
end
