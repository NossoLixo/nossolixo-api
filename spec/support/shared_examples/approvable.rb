shared_examples_for 'approvable' do
  describe '.approved' do
    it 'returns one item' do
      expect(described_class.approved).to have(1).item
    end

    it 'returns only approved items' do
      expect(described_class.approved).to match_array(approved)
    end
  end

  describe '#approve' do
    let(:current_user) { create(:user) }
    let(:now) { Time.current }

    before do
      Timecop.freeze(now)
    end

    it 'approves it' do
      expect do
        disapproved.approve!(current_user)
      end.to change(disapproved, :approved).to(true)
    end

    it 'updates the approved_by to the current_user' do
      expect do
        disapproved.approve!(current_user)
      end.to change(disapproved, :approved_by).to(current_user)
    end

    it 'updates the approved_at' do
      expect do
        disapproved.approve!(current_user)
      end.to change(disapproved, :approved_at).to(now)
    end
  end
end
