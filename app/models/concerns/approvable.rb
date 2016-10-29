module Approvable
  extend ActiveSupport::Concern

  included do
    REJECTED_ATTRIBUTES = [
      :requested_by_id,
      :approved_by_id,
      :approved_at,
      :created_at,
      :updated_at
    ].freeze

    def as_json(options = {})
      super(options.merge(except: REJECTED_ATTRIBUTES))
    end

    belongs_to :requested_by, class_name: 'User'
    belongs_to :approved_by, class_name: 'User', optional: true

    validates :requested_by, presence: true

    scope :approved, -> { where(approved: true) }

    def approve!(approved_by)
      update(approved: true, approved_at: Time.current, approved_by: approved_by)
    end
  end
end
