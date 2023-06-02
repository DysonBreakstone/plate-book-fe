class User
  attr_reader :id, :username, :email, :uid, :token, :created_at, :updated_at
  
  def initialize(data)
    @id = data[:id]
    @username = data[:attributes][:username]
    @email = data[:attributes][:email]
    @uid = data[:attributes][:uid]
    @token = data[:attributes][:token]
    @created_at = data[:attributes][:created_at]
    @updated_at = data[:attributes][:updated_at]
  end
end