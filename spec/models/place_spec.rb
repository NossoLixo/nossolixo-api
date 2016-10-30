require 'rails_helper'

RSpec.describe Place, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_presence_of :street }
  it { is_expected.to validate_presence_of :lat }
  it { is_expected.to validate_presence_of :lng }
  it { is_expected.to have_and_belong_to_many :categories }
  it { is_expected.to belong_to :city }

  include_examples 'approvable' do
    let!(:approved) { create(:place, :approved) }
    let!(:disapproved) { create(:place, :disapproved) }
  end
end
