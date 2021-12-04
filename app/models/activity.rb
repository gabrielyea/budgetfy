class Activity < ApplicationRecord
  has_and_belongs_to_many :groups
  belongs_to :author, class_name: 'User'

  validates :amount, numericality: true, presence: true
  validates :name, presence: true
end
