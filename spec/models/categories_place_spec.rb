require 'rails_helper'

RSpec.describe CategoriesPlace, type: :model do
  it { is_expected.to belong_to(:place) }
  it { is_expected.to belong_to(:category) }
end
