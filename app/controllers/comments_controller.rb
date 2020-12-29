class CommentsController < ApplicationController
  def create
    if comment.save
      comment = Comment.create(comment_params)
      redirect_to "/prototyps/#{comment.prototype.id}"
    else
      render :prototype_path
    end
  end

  def show
    @comments = Tweet.new.comments.includes(:user)
  end

private

def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
end
 
end
