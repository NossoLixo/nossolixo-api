module V1
  class CategoriesController < ApplicationController
    include JsonResponse

    before_action :authenticate_user!

    def index
      categories = policy_scope Category

      render json: success_response(categories), status: :ok
    end

    def create
      category = Category.new(category_params)
      category.requested_by = current_user
      category.approved = false

      if category.save
        render json: success_response(category), status: :created
      else
        render json: error_response(category.errors), status: :unprocessable_entity
      end
    end

    def update
      authorize category = Category.find(params[:id])

      if category.approved? || category.approve!(current_user)
        render json: success_response(category)
      else
        render json: error_response(category.errors), status: :unprocessable_entity
      end
    end

    private

    def category_params
      params.require(:category).permit(:name, :color)
    end
  end
end
