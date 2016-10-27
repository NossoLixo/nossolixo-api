class City < ApplicationRecord
  validates :name, :state, presence: true
  validates :state, length: { is: 2 }

  before_save :upcase_state!

  private

  def upcase_state!
    state && state.upcase!
  end
end
