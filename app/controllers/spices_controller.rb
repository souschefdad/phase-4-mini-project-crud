class SpicesController < ApplicationController

    

    def index
        spices = Spice.all
        render json: spices
    end

    def show
        single_spice = Spice.find_by(id:params[:id])
        render json: single_spice
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice
    end

    def update
        updated_spice = Spice.find_by(id:params[:id])
        updated_spice.update(spice_params)
        render json: updated_spice

    end

    def destroy
        destroyed_spice = Spice.find_by(id:params[:id]).destroy
        render json: destroyed_spice
    end

private
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
