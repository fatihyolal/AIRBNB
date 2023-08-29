class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def edit
    @listing = Listing.find(params:id)
  end

  def destroy
    @listing = Listing.find(params:id)
    @listing.destroy

    redirect_to restaurants_path, status: :see_other
  end
end
