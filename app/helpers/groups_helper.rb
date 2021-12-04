module GroupsHelper
  def get_useful_info(response)
    result = []
    data = JSON.parse(response.body).dig('pages', 'elements')
    data.each do |entry|
      result << { url: entry['url'], name: entry['iconName'] }
    end
    result
  end
end
