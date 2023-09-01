class ReviewsController < ApplicationController
  before_action :set_listing, only: %i[create]
  before_action :set_booking, only: %i[new]

  def index
    @listing = Listing.find(params[:listing_id])
    @reviews = @listing.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @listing.bookings.last
    if @review.save
      redirect_to @listing
    else
      render :new
    end

  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
