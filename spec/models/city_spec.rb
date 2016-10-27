require 'rails_helper'

RSpec.describe City, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :state }
  it { is_expected.to validate_length_of(:state).is_equal_to(2) }

  describe '#upcase_state!' do
    subject { build(:city, state: 'se') }

    it 'transforms the state to uppcase' do
      expect do
        subject.save!
      end.to change(subject, :state).from('se').to('SE')
    end
  end
end
