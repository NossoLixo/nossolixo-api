require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :color }

  describe 'color uniqueness validation' do
    subject { build(:category) }

    it { is_expected.to validate_uniqueness_of :color }
  end

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

  describe '#approve' do
    subject { create(:category, :disapproved) }
    let(:now) { Time.current }

    before do
      Timecop.freeze(now)
    end

    it 'approves the category' do
      expect do
        subject.approve!
      end.to change(subject, :approved).to(true)
    end

    it 'updates the approved_at' do
      expect do
        subject.approve!
      end.to change(subject, :approved_at).to(now)
    end
  end
end
