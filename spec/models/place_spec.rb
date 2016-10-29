require 'rails_helper'

RSpec.describe Place, type: :model do
  include_examples 'approvable' do
    let!(:approved) { create(:place, :approved) }
    let!(:disapproved) { create(:place, :disapproved) }
  end
end
