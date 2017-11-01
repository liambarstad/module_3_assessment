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

end
