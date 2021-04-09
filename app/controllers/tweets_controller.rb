class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]

  # GET /tweets
  def index
    @tweets = Tweet.all.sort_by(&:created_at).reverse
    @tweet = Tweet.new
  end

  # GET /tweets/:id
  def show
    @comments = @tweet.comments
    @comment = Comment.new
  end

  # POST /tweets
  def create
    @tweets = Tweet.all
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    authorize @tweet
    if @tweet.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  # GET /tweets/:id/edit
  def edit
    authorize @tweet
  end

  # PATCH /tweets/:id
  def update
    authorize @tweet
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render 'edit'
    end
  end

  # DELETE /tweets/:id
  def destroy
    authorize @tweet
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
