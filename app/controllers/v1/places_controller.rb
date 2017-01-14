module V1
  class PlacesController < ApplicationController
    include ApprovableState

    before_action :authenticate_user!, except: [:index, :show]

    def index
      places = fetch_places

      render json: places, status: :ok
    end

    def show
      place = Rails.cache.fetch("place/#{params[:id]}") do
        Place.find(params[:id]).as_json
      end

      render json: place
    end

    def create
      place = Place.new(place_params)
      place = initial_approvable_state(place)

      if place.save
        invalidate_cache
        render json: place, status: :created
      else
        render json: { errors: place.errors }, status: :unprocessable_entity
      end
    end

    def update
      authorize place = Place.find(params[:id])

      if approved?(place)
        invalidate_cache(place)
        render json: place
      else
        render json: { errors: place.errors }, status: :unprocessable_entity
      end
    end

    private

    def fetch_places
      if current_user&.admin?
        admin_places
      else
        public_places
      end
    end

    def admin_places
      Rails.cache.fetch("places/admin?category=#{params[:category]}") do
        Place.includes(:categories).by_category(params[:category]).to_a
      end
    end

    def public_places
      Rails.cache.fetch("places/public?category=#{params[:category]}") do
        Place.includes(:categories).by_category(params[:category]).approved.to_a
      end
    end

    def invalidate_cache
      Rails.cache.clear
    end

    def place_params
      params.require(:place).permit(:name, :description, :street, :number, :district, :city,
                                    :state, :lat, :lng, :phone_number, :email, :site)
    end
  end
end
