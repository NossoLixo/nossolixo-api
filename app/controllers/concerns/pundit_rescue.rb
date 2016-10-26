module PunditRescue
  extend ActiveSupport::Concern

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  def user_not_authorized
    render json: { errors: 'You do not have permission to perform this.' }, status: :forbidden
  end
end
