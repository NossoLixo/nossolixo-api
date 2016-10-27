class Category < ApplicationRecord
  include Approvable

  validates :name, :color, presence: true
  validates :color, uniqueness: { case_sensitive: false }

  def as_json(options = {})
    super(options.merge(only: [:id, :name, :color, :approved]))
  end
end
