class BestBuyHandler

  def initialize(zip_code)
    @zip = zip_code
  end

  def initialize_stores
    conn = new_connection
    response = conn.get
    stores = JSON.parse(response.body)
    stores["stores"].reduce([]) do |output, store_info|
      output << Store.new(name: store_info["longName"],
                          city: store_info["city"],
                          distance: store_info["distance"],
                          phone_number: store_info["phone"],
                          type: store_info["storeType"])
      output
    end
  end

  private

  def new_connection
    Faraday.new("https://api.bestbuy.com/v1/stores(area(#{zip_code},25))") do |f|
      f.adapter Faraday.default_adapter
      f.params["format"] = "json"
      f.params["show"] = "longName,city,distance,phone,storeType"
      f.params["apiKey"]= ENV['api_key']
    end
  end

end
