require 'faraday'

class PlatebookService
  def conn
    Faraday.new(url: "#{ENV['BACK_END_DOMAIN']}")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url, params)
    conn.post(url, params)
  end

  def find_url(url, params)
    conn.get(url, params)
  end

  def destroy_url(url)
    conn.delete(url)
  end

  def get_all_users
    get_url("/api/v1/users")
  end

  def get_user(id)
    get_url("/api/v1/users/#{id}")
  end

  def get_all_plates
    get_url("/api/v1/plates")
  end

  def get_plate(id)
    get_url("/api/v1/plates/#{id}")
  end

  def create_post(params)
    post_url("/api/v1/posts", params: params)
  end

  def create_comment(params)
    post_url("/api/v1/posts/#{params[:post_id]}/comments", params: params)
  end

  def get_all_posts
    get_url("/api/v1/posts")
  end

  def get_post(id)
    get_url("/api/v1/posts/#{id}")
  end

  def get_locations
    get_url("/api/v1/locations")
  end

  def get_all_search(params)
    get_url("/api/v1/search?category=#{params[:category]}&query=#{params[:query]}&emotion=#{params[:emotion]}")
  end


  def get_hot_plates
    get_url("/api/v1/search/hot_plates")
  end

  def create_user_plate(params)
    post_url("/api/v1/user_plates", params: { user_id: params[:user_id], plate_id: params[:plate_id] })
  end

  def delete_user_plate(params)
    destroy_url("/api/v1/user_plates/#{params[:user_plate_id]}")
  end

  def get_user_plate(params)
    find_url("/api/v1/userplate", params: { user_id: params[:user_id], plate_id: params[:plate_id] })
  end

end
