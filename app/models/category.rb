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

  validates :name, presence: true

  def as_json(options = {})
    super(options.merge(except: REJECTED_ATTRIBUTES))
  end
end
