class SearchController < ApplicationController

  def index
    bbh = BestBuyHandler.new(params[:search])
    search_results = bbh.get_stores
    @stores = Store.create_from_response(search_results)
  end

end
