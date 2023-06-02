class Post
  attr_reader :title, :body, :user_id
  
  def initialize(data)
    @title = data[:attributes][:title]
    @body = data[:attributes][:body]
    @user_id = data[:attributes][:user_id]
  end
end