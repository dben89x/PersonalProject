class GoogleAPI

  def initialize
    @conn = Faraday.new(:url => 'https://maps.googleapis.com/')
  end

  def get_map(latitude, longitude)
    response = @conn.get do |req|
      req.url "maps/api/staticmap?center=#{latitude},#{longitude}&zoom=14&size=400x400"
      req.headers['Content-Type'] = 'image/png'
    end
  end

end
