class ListingsController < ApplicationController
  def index
    if params[:query].present?
      @listings=Listing.search_by_title_and_address(params[:query])
    else
      @listings = Listing.all
    end
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
    @marker = [{
      lat: @listing.latitude,
      lng: @listing.longitude
    }]
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)

    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def listing_params
    params.require(:listing).permit(:address, :price, :average_rating, :availability, :boat_description, :capacity, :image_url, :title)
  end
end
