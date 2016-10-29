class City < ApplicationRecord
  validates :name, :state, presence: true
  validates :state, length: { is: 2 }

  before_save :upcase_state!

  def as_json(options = {})
    super(options.merge(only: [:id, :name, :state]))
  end

  private

  def upcase_state!
    state && state.upcase!
  end
end
