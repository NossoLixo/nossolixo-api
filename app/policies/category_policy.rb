class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.admin?
        Rails.cache.fetch('categories/admin') do
          scope.all.insensitive_order(:name).to_a
        end
      else
        Rails.cache.fetch('categories/public') do
          scope.approved.insensitive_order(:name).to_a
        end
      end
    end
  end

  def update?
    user.admin?
  end
end
