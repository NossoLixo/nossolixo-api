module Approvable
  extend ActiveSupport::Concern

  included do
    belongs_to :requested_by, class_name: 'User'
    belongs_to :approved_by, class_name: 'User', optional: true

    validates :requested_by, presence: true

    scope :approved, -> { where(approved: true) }

    def approve!(approved_by)
      update(approved: true, approved_at: Time.current, approved_by: approved_by)
    end
  end
end
