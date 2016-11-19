class Category < ApplicationRecord
  include InsensitiveOrder
  include Approvable

  REJECTED_ATTRIBUTES = [
    :requested_by_id,
    :approved_by_id,
    :approved_at,
    :created_at,
    :updated_at
  ].freeze

  validates :name, :color, presence: true
  validates :color, uniqueness: { case_sensitive: false }

  scope :by_name, ->(name) { where("#{build_criteria('categories.name')} = ?", name) }

  def as_json(options = {})
    super(options.merge(except: REJECTED_ATTRIBUTES))
  end
end
