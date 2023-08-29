class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def edit
    @listing = Listing.find(params:id)
  end

  def update
    @listing = Listing.find(params:id)
    @listing.update(listing_params)

    redirect_to listing_path(@listing)
  end
  def destroy
    @listing = Listing.find(params:id)
    @listing.destroy

    redirect_to restaurants_path, status: :see_other
  end


  private

  def listing_params
    params.requiere(:listing).permit(:address, :price, :average_rating, :availability, :boat_description, :capacity)
  end
end
