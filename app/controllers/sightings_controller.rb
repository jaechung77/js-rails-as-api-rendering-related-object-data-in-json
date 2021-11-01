class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(include: [:bird, :location])
        else
            render json: { message: 'No sighting found with that id' }
        end
    end

    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
    end
end

# sighting = Sighting.find_by(id: params[:id])
# render json: sighting.to_json(:include => {
#   :bird => {:only => [:name, :species]},
#   :location => {:only => [:latitude, :longitude]}
# }, :except => [:updated_at])

# {
#     "id": 2,
#     "bird_id": 2,
#     "location_id": 2,
#     "created_at": "2019-05-14T11:20:37.228Z",
#     "bird": {
#       "name": "Grackle",
#       "species": "Quiscalus Quiscula"
#     },
#     "location": {
#       "latitude": 30.26715,
#       "longitude": -97.74306
#     }
#   }