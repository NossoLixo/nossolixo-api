class Category < ApplicationRecord
  validates :name, :color, presence: true

  scope :approved, -> { where(approved: true) }

  def as_json(options = {})
    super(options.merge(only: [:id, :name, :color]))
  end

  def approve!
    update(approved: true, approved_at: Time.current)
  end
end
