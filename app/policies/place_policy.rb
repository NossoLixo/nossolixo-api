class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.approved
      end
    end
  end

  def update?
    user.admin?
  end
end
