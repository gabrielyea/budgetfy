class Group < ApplicationRecord
  include PgSearch::Model
  has_and_belongs_to_many :activities
  belongs_to :user

  validates :icon, presence: true
  validates :name, presence: true

  scope :sortify, ->(sort_type) { order(created_at: sort_type) }
  pg_search_scope :search, against: [:name],
                           using: {
                             tsearch: {
                               prefix: true
                             }
                           }

  def total_group_cost
    activities.reduce(0) do |sum, item|
      sum + item['amount'].to_int
    end
  end
end
