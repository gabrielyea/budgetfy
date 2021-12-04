class IconSelection < ApplicationRecord
  include DataFetch
  def self.fetch_icons
    Rails.cache.fetch([self, :fetch_icons], expires_in: 60.minutes) { DataFetch.read_api_data }
  end
end
