class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking was successfully made."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
