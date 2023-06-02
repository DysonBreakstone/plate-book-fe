class Post
  attr_reader :title, :body, :user_id, :parent_plates
  
  def initialize(data)
    @title = data[:attributes][:title]
    @body = data[:attributes][:body]
    @user_id = data[:attributes][:user_id]
    @parent_plates = data[:attributes][:parent_plate]
  end
end