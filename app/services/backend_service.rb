class BackendService
  def conn
    @_conn ||= Faraday.new(url: "#{ENV['BACK_END_DOMAIN']}")
  end

  def register_user(google_id, email, token)
    params = {
      uid: google_id,
      email: email,
      token: token
    }
    post_url("/api/v1/users", params)
  end

  def post_url(url, params)
    conn.post(url, params)
  end

  def update_url(url, params)
    conn.put(url, params)
  end

  def update_comment(params)
    update_url("/api/v1/posts/#{params[:post_id]}/comments/#{params[:comment_id]}", params)
  end

  def update_user(params)
    response = update_url("api/v1/users/#{params[:id]}", params)
    JSON.parse(response.body, symbolize_names: true)
  end
end
