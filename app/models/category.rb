class Category < ApplicationRecord
  validates :name, :color, presence: true

  scope :approved, -> { where(approved: true) }

  def approve!
    update(approved: true, approved_at: Time.current)
  end
end
