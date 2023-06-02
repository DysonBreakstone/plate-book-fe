class Plate
  attr_reader :plate_number, :id
  def initialize(data)
    @id = data[:id]
    @plate_number = data[:attributes][:plate_number]
  end
end