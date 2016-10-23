class Category < ApplicationRecord
  validates :name, :color, presence: true

  scope :approved, -> { where(approved: true) }
end
