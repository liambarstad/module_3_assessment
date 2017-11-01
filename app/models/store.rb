class Store
  attr_accessor :name,
                :city,
                :distance,
                :phone_number,
                :type
  def initialize(attrs)
    @name = attrs[:name]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone_number]
    @type = attrs[:type]
  end

  def self.create_from_response(response_arr)
    response_arr.reduce([]) do |output, store_info|
      output << new(name: store_info["longName"],
                    city: store_info["city"],
                    distance: store_info["distance"],
                    phone_number: store_info["phone"],
                    type: store_info["storeType"])
      output
    end
  end

end
