class Group < ApplicationRecord
  has_and_belongs_to_many :activities
  belongs_to :user

  validates :icon, presence: true
  validates :name, presence: true

  def total_group_cost
    activities.reduce(0) do |sum, item|
      sum + item.amount
    end
  end
end
