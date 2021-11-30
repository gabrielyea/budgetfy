class Group < ApplicationRecord
  has_and_belongs_to_many :activities
  belongs_to :user

  validates :icon, presence: true
  validates :name, presence: true
end
