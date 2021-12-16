class SpicesController < ApplicationController

    

    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def show
        single_spice = Spice.find_by(id:params[:id])
        render json: single_spice, status: :found
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice, status: :created
    end

    def update
        updated_spice = Spice.find_by(id:params[:id])
        updated_spice.update(spice_params)
        render json: updated_spice, status: :reset_content

    end

    def destroy
        destroyed_spice = Spice.find_by(id:params[:id]).destroy
        render json: destroyed_spice, status: :no_content
    end

private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
