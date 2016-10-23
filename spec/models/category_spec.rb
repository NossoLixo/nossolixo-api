require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :color }

  describe '.approved' do
    let!(:approved) { create(:category, :approved) }

    before do
      create(:category, :disapproved)
    end

    it 'returns one item' do
      expect(described_class.approved).to have(1).item
    end

    it 'returns only approved items' do
      expect(described_class.approved).to match_array(approved)
    end
  end
end
