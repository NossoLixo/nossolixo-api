module V1
  class PlacesController < ApplicationController
    include ApprovableState

    before_action :authenticate_user!, except: [:index, :show]

    def index
      places = policy_scope Place.includes(:categories).by_category(params[:category])

      render json: places, status: :ok
    end

    def show
      place = Rails.cache.fetch("place/#{params[:id]}") do
        Place.find(params[:id])
      end

      render json: place
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
      params.require(:place).permit(:name, :description, :street, :number, :district, :city,
                                    :state, :lat, :lng, :phone_number, :email, :site)
    end
  end
end
