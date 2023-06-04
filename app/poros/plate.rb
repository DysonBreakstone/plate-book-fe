class Plate
  attr_reader :plate_number, :id, :posts
  def initialize(data)
    @id = data[:id]
    @plate_number = data[:attributes][:plate_number]
    @posts = data[:attributes][:posts]
  end
end