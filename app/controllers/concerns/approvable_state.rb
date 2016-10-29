module ApprovableState
  def initial_approvable_state(resource)
    resource.tap do |r|
      r.requested_by = current_user
      r.approved = false
    end
  end

  def approved?(resource)
    resource.approved? || resource.approve!(current_user)
  end
end
