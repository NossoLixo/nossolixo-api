class Place < ApplicationRecord
  include Approvable

  validates :name, :city, :street, :lat, :lng, presence: true

  belongs_to :city
end
