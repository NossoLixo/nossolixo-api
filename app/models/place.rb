class Place < ApplicationRecord
  include Approvable

  validates :name, :street, :city, :state, :lat, :lng, presence: true
  validates :state, length: { is: 2 }

  before_save :upcase_state!

  has_and_belongs_to_many :categories

  def as_json(options = {})
    place = { except: [:requested_by_id, :approved_by_id, :approved_at, :created_at, :updated_at] }
    associations = { include: { categories: { only: [:id, :name, :color] } } }
    super(options.merge(place.merge(associations)))
  end

  private

  def upcase_state!
    state && state.upcase!
  end
end
