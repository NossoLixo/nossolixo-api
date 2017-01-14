class PlacePolicy < ApplicationPolicy
  def update?
    user.admin?
  end
end
