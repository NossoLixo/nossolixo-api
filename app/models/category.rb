class Category < ApplicationRecord
  validates :name, :color, :requested_by, presence: true
  validates :color, uniqueness: { case_sensitive: false }

  belongs_to :requested_by, class_name: 'User'
  belongs_to :approved_by, class_name: 'User', optional: true

  scope :approved, -> { where(approved: true) }

  def as_json(options = {})
    super(options.merge(only: [:id, :name, :color, :approved]))
  end

  def approve!(approved_by)
    update(approved: true, approved_at: Time.current, approved_by: approved_by)
  end
end
