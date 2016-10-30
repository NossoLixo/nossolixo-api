module V1
  class PlacesController < ApplicationController
    include ApprovableState

    before_action :authenticate_user!, except: :index

    def index
      places = policy_scope Place.includes(:categories)

      render json: places, status: :ok
    end

    def create
      place = Place.new(place_params)
      place = initial_approvable_state(place)

      if place.save
        render json: place, status: :created
      else
        render json: { errors: place.errors }, status: :unprocessable_entity
      end
    end

    def update
      authorize place = Place.find(params[:id])

      if approved?(place)
        render json: place
      else
        render json: { errors: place.errors }, status: :unprocessable_entity
      end
    end

    private

    def place_params
      params.require(:place).permit(:name, :description, :street, :number, :district, :lat, :lng,
                                    :phone_number, :email, :site)
    end
  end
end
