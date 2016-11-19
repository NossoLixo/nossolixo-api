module V1
  class CategoriesController < ApplicationController
    include ApprovableState

    before_action :authenticate_user!, except: :index

    def index
      categories = policy_scope Category

      render json: categories, status: :ok
    end

    def create
      category = Category.new(category_params)
      category = initial_approvable_state(category)

      if category.save
        render json: category, status: :created
      else
        render json: { errors: category.errors }, status: :unprocessable_entity
      end
    end

    def update
      authorize category = Category.find(params[:id])

      if approved?(category)
        render json: category
      else
        render json: { errors: category.errors }, status: :unprocessable_entity
      end
    end

    private

    def category_params
      params.require(:category).permit(:name, :color)
    end
  end
end
