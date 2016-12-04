class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        Rails.cache.fetch('places/admin') do
          scope.all
        end
      else
        Rails.cache.fetch('places/public') do
          scope.approved
        end
      end
    end
  end

  def update?
    user.admin?
  end
end
