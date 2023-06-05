class Post
  attr_reader :title, :body, :user_id, :parent_plates, :plate, :created_at, :comments, :user, :photo, :id
  
  def initialize(data)
    @id = data[:id]
    @title = data[:attributes][:title]
    @body = data[:attributes][:body]
    @user_id = data[:attributes][:user_id]
    @parent_plates = data[:attributes][:parent_plates]
    @plate = data[:attributes][:parent_plates][0][:plate_number]
    @created_at = data[:attributes][:formatted_created_at]
    @comments = data[:attributes][:comments]
    @user = data[:attributes][:username]
    @photo = data[:attributes][:plate_posts][0][:photo_url]
  end
end