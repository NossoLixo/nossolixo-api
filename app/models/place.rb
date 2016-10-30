class Place < ApplicationRecord
  include Approvable

  validates :name, :city, :street, :lat, :lng, presence: true

  has_and_belongs_to_many :categories
  belongs_to :city

  def as_json(options = {})
    place = {
      except: [:city_id, :requested_by_id, :approved_by_id, :approved_at, :created_at, :updated_at]
    }
    city = { only: [:id, :name, :state] }
    categories = { only: [:id, :name, :color] }
    associations = { include: { city: city, categories: categories } }
    super(options.merge(place.merge(associations)))
  end
end
