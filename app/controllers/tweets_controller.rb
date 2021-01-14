class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]

  # GET /tweets
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  # GET /tweets/:id
  def show
    @comment = Comment.new
  end

  # POST /tweets
  def create
    @tweets = Tweet.all
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to @tweet
    else
      render 'index'
    end
  end

  # GET /tweets/:id/edit
  def edit; end

  # PATCH /tweets/:id
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render 'edit'
    end
  end

  # DELETE /tweets/:id
  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
