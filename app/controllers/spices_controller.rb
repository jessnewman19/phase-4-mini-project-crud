class SpicesController < ApplicationController

    def index 
        spices = Spice.all
        render json: spices
    end

    # def show 
    #     spice = find_spice
    #     render json: spice
    # end

    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    rescue ActiveRecord::RecordNotFound 
        render_error_message
    end 

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end 

    def destroy 
        spice = find_spice
        spice.destroy 
    rescue ActiveRecord::RecordNotFound 
        render_error_message
    end

    private 

        def find_spice 
            spice = Spice.find(params[:id])
        end

        def spice_params 
            params.permit(:title, :image, :description, :notes, :rating)
        end

        def render_error_message
            render json: { error: "Spice Not Found" }, status: :not_found
        end

end