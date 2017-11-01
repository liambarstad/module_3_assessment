class SearchController < ApplicationController

  def index
    bbh = BestBuyHandler.new(params[:search])
    @stores = bbh.initialize_stores
  end

end
