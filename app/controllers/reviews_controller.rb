class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = @list.reviews.build(review_params) # Build a new review associated with the list

    if @review.save
      redirect_to list_path(@list), notice: 'Review was successfully created.'
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
