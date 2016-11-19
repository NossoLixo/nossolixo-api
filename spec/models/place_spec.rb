require 'rails_helper'

RSpec.describe Place, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :street }
  it { is_expected.to validate_presence_of :lat }
  it { is_expected.to validate_presence_of :lng }
  it { is_expected.to validate_presence_of :city }
  it { is_expected.to validate_presence_of :state }
  it { is_expected.to validate_length_of(:state).is_equal_to(2) }
  it { is_expected.to have_many :categories_places }
  it { is_expected.to have_many(:categories).through(:categories_places) }

  include_examples 'approvable' do
    let!(:approved) { create(:place, :approved) }
    let!(:disapproved) { create(:place, :disapproved) }
  end

  describe '#upcase_state!' do
    subject { build(:place, state: 'se') }

    it 'transforms the state to upcase' do
      expect do
        subject.save!
      end.to change(subject, :state).from('se').to('SE')
    end
  end
end
