class Place < ApplicationRecord
  include Approvable

  validates :name, :street, :city, :state, :lat, :lng, presence: true
  validates :state, length: { is: 2 }

  before_save :upcase_state!

  has_many :categories_places
  has_many :categories, through: :categories_places

  scope :by_category, lambda { |category|
    joins(:categories_places)
      .where('categories_places.category_id = ?', category) if category.present?
  }

  def as_json(options = {})
    place = { except: [:requested_by_id, :approved_by_id, :approved_at, :created_at, :updated_at] }
    associations = { include: { categories: { only: [:id, :name] } } }
    super(options.merge(place.merge(associations)))
  end

  private

  def upcase_state!
    state && state.upcase!
  end
end
