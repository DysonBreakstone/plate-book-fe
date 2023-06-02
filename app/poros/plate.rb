class Plate
  attr_reader :plate_number
  def initialize(data)
    @plate_number = data[:attributes][:plate_number]
  end
end