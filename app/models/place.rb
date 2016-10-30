class Place < ApplicationRecord
  include Approvable

  validates :name, :street, :lat, :lng, presence: true

  has_and_belongs_to_many :categories

  def as_json(options = {})
    place = {
      except: [:requested_by_id, :approved_by_id, :approved_at, :created_at, :updated_at]
    }
    categories = { only: [:id, :name, :color] }
    associations = { include: { categories: categories } }
    super(options.merge(place.merge(associations)))
  end
end
