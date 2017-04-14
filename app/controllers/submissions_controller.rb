class SubmissionsController < ApplicationController
     def index; end

     def show
          @submission = Submission.find_by_id(params[:id])
     end

     def new
          @submission = Submission.new
     end

     def create
          @submission = Submission.new(submission_params)

          @submission.title = submission_params[:title]
          @submission.author = submission_params[:author]
          @submission.publish_date = submission_params[:publish_date]
          @submission.publish_date = submission_params[:category]
          @submission.summary= submission_params[:summary]

               if @submission.save && @submission.category == "Album"
                    flash[:success] = "Album created. All systems go."
                    redirect_to albums_path
               elsif @submission.save && @submission.category == "Book"
                    flash[:success] = "Book created. All systems go."
                    redirect_to books_path
               elsif @submission.save && @submission.category == "Movie"
                    flash[:success] = "Movie created. All systems go."
                    redirect_to movies_path
               else
                    flash[:success] = "Damn. Submission not updated. Give it another try."
                    render "new"
               end
     end

     def edit
          @submission = Submission.find_by_id(params[:id])
     end

     def update
          @submission = Submission.find(params[:id])

          @submission.title = submission_params[:title]
          @submission.author = submission_params[:author]
          @submission.publish_date = submission_params[:publish_date]
          @submission.summary= submission_params[:summary]

               if @submission.save
                    flash[:success] = "Submission edited. All systems go."
                    redirect_to albums_path
               else
                    flash[:success] = "Damn. Submission not edited. Try again."
                    render "edit"
               end
     end

     def destroy
          @submission = Submission.find(params[:id]) 
          if @submission.votes.count > 0
               flash[:error] = "Apparently someone else has bad taste. This submission has votes and can't be deleted."
               redirect_to submission_path
          else
               @submission.destroy
               flash[:success] = "This submission is no more."
               redirect_to root_path
          end
     end

     def upvote
          @submission = Submission.find(params[:id])
          @user = User.find_by_id(session[:user_id])
          @votes = Vote.all

          if @user

               if  @votes.any? {|vote| vote.submission_id == @submission.id && vote.user_id == @user.id }
                    flash[:error] = "Upvote aborted. Don't be greedy. One vote per submission."
                    redirect_to(submission_path)
               else
                    Vote.create(user: @user, submission: @submission)
                    flash[:success] = "Upvote deployed."
                    redirect_to(submission_path)
               end

          else
               flash[:error] = "Upvote aborted. To exercise your right to vote, log in."
               redirect_to submission_path
          end

     end

     private

     def submission_params
          params.require(:submission).permit(:title, :author, :publish_date, :category,:summary)
     end
end
