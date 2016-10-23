class Category < ApplicationRecord
  validates :name, :color, presence: true
end
