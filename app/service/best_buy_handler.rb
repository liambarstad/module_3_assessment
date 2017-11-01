class BestBuyHandler

  def initialize(zip_code)
    @zip = zip_code
  end

  def get_stores
    conn = new_connection
    response = conn.get
    JSON.parse(response.body)["stores"]
  end

  private

  def new_connection
    Faraday.new("https://api.bestbuy.com/v1/stores(area(#{@zip},25))") do |f|
      f.adapter Faraday.default_adapter
      f.params["format"]   = "json"
      f.params["show"]     = "longName,city,distance,phone,storeType"
      f.params["apiKey"]   = Rails.application.secrets.api_key
      f.params["pageSize"] = "100"
    end
  end

end
