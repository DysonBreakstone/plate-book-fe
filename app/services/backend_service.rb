class BackendService 
  def conn
    @_conn ||= Faraday.new(url: "http://#{ENV['BACK_END_DOMAIN']}:5001")
  end

  def register_user(google_id, email, token)
    params = {
      uid: google_id,
      email: email,
      token: token
    }
    post_url("api/v1/users", params)
  end

  def post_url(url, params)
    conn.post(url, params)
  end
end