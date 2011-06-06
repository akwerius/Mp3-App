class ReviewsController < ApplicationController

  def create
	@mp3 = Mp3.find(params[:mp3_id])
	@review = @mp3.reviews.create(params[:review])
    redirect_to mp3_path(@mp3)
    
  end
end
