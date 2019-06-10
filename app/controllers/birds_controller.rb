class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # Explicitly state it
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
    # Or use the slice method for a single hash, not for array of hashes
    # render json: bird.slice(:id, :name, :species)
    # Use only: to limit
    # render json: birds, only: [:id, :name, :species]
    # Or do the opposite of it, Lines 16 and 17 are the same, 17 is explicit
    # render json: birds, except: [:created_at, :updated_at]
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end
end
