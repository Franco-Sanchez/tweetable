class CommentsController < ApplicationController
  before_action :set_tweet
  before_action :set_comment, only: %i[edit update destroy]

  # POST /tweets/:tweet_id/comments
  def create
    @comment = @tweet.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @tweet
    else
      render 'tweets/show'
    end
  end

  # GET /tweets/:tweet_id/comments/:id/edit
  def edit; end

  # PATCH /tweets/:tweet_id/comments/:id
  def update
    if @comment.update(comment_params)
      redirect_to @tweet
    else
      render 'edit'
    end
  end

  # DELETE /tweets/:tweet_id/comments/:id
  def destroy
    @comment.destroy
    redirect_to @tweet
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def set_comment
    @comment = @tweet.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end