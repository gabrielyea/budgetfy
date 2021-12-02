module DataFetch
  extend ActiveSupport::Concern
  def self.read_api_data
    response = RestClient.get('https://iconsapi.com/api/search?appkey=61a6e29ae4b06f7969140bdc&query=icons&size=100')
    result = []
    data = JSON.parse(response.body).dig('pages', 'elements')
    data.each do |entry|
      result << entry['url']
    end
    result
  end
end
