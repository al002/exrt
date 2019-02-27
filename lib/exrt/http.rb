require "faraday"

class Http
  @@api_base = "https://api.exchangeratesapi.io"
  @@conn = Faraday.new(:url => @@api_base)

  public
  def self.get(url, params ={})
    @@conn.get(url, params)
  end
end
