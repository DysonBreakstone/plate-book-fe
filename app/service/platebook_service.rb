require 'faraday'


class PlatebookService
  def conn
    Faraday.new(url: "http://localhost:5000")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_all_users
    get_url("/api/v1/users")
  end

  def get_all_plates
    get_url("/api/v1/plates")
  end
  
end