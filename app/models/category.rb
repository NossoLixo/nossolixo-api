class Category < ApplicationRecord
  include Approvable

  validates :name, :color, presence: true
  validates :color, uniqueness: { case_sensitive: false }
end
