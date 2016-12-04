require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :requested_by }
  it { is_expected.to belong_to(:requested_by).class_name('User') }
  it { is_expected.to belong_to(:approved_by).class_name('User') }

  include_examples 'approvable' do
    let!(:approved) { create(:category, :approved) }
    let!(:disapproved) { create(:category, :disapproved) }
  end
end
