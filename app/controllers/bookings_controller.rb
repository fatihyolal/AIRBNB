class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
  @bookings = current_user.bookings
  @bookings = @bookings.order(start_date: :desc)
  @owner_bookings = current_user.bookings_as_owner

  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to listing_booking_path(@listing, @booking), notice: "Booking was successfully made."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
