require "test_helper"

 describe Vote do
   let(:vote) { Vote.new }


     it "Cannot create a vote without a work and user" do
       vote.valid?.must_equal false
       #negative test

       vote.errors.messages.must_include :work
       vote.errors.messages.must_include :user
       #negative test
     end


     it "Can create a vote with a work and user" do
       vote.user_id = 1
       vote.work_id = 1
       vote.save
       vote.valid? #won't run validations until save or valid? is run
     end


    #  it "vote must be unique" do
    #     vote1 = Vote.new
    #     vote1.work = "one"
    #     vote1.user = "Kelly"
    #     vote1.save
     #
    #     vote2 = Vote.new
    #     vote2.work = "two"
    #     vote2.user = "Kevin"
     #
    #     vote2.valid?.must_equal false
    #     vote2.errors.messages.must_include :id
        #WHy does this have no error message?
    #  end


   end
