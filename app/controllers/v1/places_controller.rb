module V1
  class PlacesController < ApplicationController
    include JsonResponse
    include ApprovableState

    before_action :authenticate_user!, except: :index

    def index
      places = policy_scope Place

      render json: success_response(places), status: :ok
    end

    def create
      place = Place.new(place_params)
      place = initial_approvable_state(place)

      if place.save
        render json: success_response(place), status: :created
      else
        render json: error_response(place.errors), status: :unprocessable_entity
      end
    end

    def update
      authorize place = Place.find(params[:id])

      if approved?(place)
        render json: success_response(place)
      else
        render json: error_response(place.errors), status: :unprocessable_entity
      end
    end

    private

    def place_params
      params.require(:place).permit(:name, :city_id, :description, :street, :number, :district,
                                    :lat, :lng, :phone_number, :email, :site)
    end
  end
end
