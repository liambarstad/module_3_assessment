class SearchController < ApplicationController

  def index
    if params[:page] == nil
      params[:page] = 1
    end

    bbh = BestBuyHandler.new(params[:search])
    search_results = bbh.get_stores
    stores = Store.create_from_response(search_results)

    @results_count = stores.count
    @page = params[:page].to_i
    paginate(stores, @page)
  end

  private

  def paginate(stores, page)
    if stores[((page * 10) - 1)]
      @stores = stores[((page - 1) * 10)..((page * 10) - 1)]
    else
      @stores = stores[((page - 1) * 10)..-1]
    end
  end

end
