require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'default role' do
    context 'when it has no a role' do
      subject { build(:user) }

      it 'sets the default role to guest' do
        expect(subject.role).to eql 'guest'
      end
    end

    context 'when it has a role' do
      subject { build(:user, :admin) }

      it 'keeps the user role as admin' do
        expect(subject.role).to eql 'admin'
      end
    end
  end
end
