class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    # @organization = Organization.find(params[:review][:organization_id]) if params[:review][:organization_id]
    @review = Review.new(params[:review])
    @review.user_id = current_user.id
    if @review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
