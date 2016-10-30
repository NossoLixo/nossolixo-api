require 'rails_helper'

RSpec.describe Place, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :street }
  it { is_expected.to validate_presence_of :lat }
  it { is_expected.to validate_presence_of :lng }
  it { is_expected.to have_and_belong_to_many :categories }

  include_examples 'approvable' do
    let!(:approved) { create(:place, :approved) }
    let!(:disapproved) { create(:place, :disapproved) }
  end
end
