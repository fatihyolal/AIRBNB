class ReviewsController < ApplicationController

  before_action :set_listing, only: %i[new create]
  def index
    @listing = Listing.find(params[:listing_id])
    @reviews = @listing.reviews
  end

  def new
    @review = Review.new
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

end
