class ListingsController < ApplicationController

  def index
    @search_results = Listing.search(
      params.permit(:max_price, :min_price, :max_bed, :min_bed, :max_bath, :min_bath, :page)
    )
    render :index
  end

end
