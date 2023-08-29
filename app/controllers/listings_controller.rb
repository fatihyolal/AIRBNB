class ListingsController < ApplicationController
  @listings = Listing.all
end
