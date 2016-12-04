class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        Rails.cache.fetch('categories/admin') do
          scope.all
        end
      else
        Rails.cache.fetch('categories/public') do
          scope.approved
        end
      end
    end
  end

  def update?
    user.admin?
  end
end
