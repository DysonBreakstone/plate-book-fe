class User
  attr_reader :id, :username, :email, :uid, :token, :created_at, :updated_at, :comments, :plates, :posts
  
  def initialize(data)
    @id = data[:id]
    @username = data[:attributes][:username]
    @email = data[:attributes][:email]
    @uid = data[:attributes][:uid]
    @token = data[:attributes][:token]
    @created_at = data[:attributes][:created_at]
    @updated_at = data[:attributes][:updated_at]
    @comments = data[:attributes][:comments]
    @plates = data[:attributes][:plates]
    @posts = data[:attributes][:posts]
  end
end