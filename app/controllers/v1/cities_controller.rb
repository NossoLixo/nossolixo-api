module V1
  class CitiesController < ApplicationController
    include JsonResponse

    def index
      cities = City.all

      render json: success_response(cities), status: :ok
    end
  end
end
