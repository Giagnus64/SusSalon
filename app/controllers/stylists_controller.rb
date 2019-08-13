class StylistsController < ApplicationController
    before_action :find_stylist, only:[:show, :edit, :update, :destroy]

    def index
    @stylists = Stylist.all
    end
    
    def show
    
    end
    
    def new
    @stylist= Stylist.new
    end

    def create
    @stylist= Stylist.create(stylist_params)
        if @stylist.valid?
            redirect_to(@stylist)
        else 
            @errors = @stylist.errors
            render :new
        end
    end

    def edit
    end
    
    def update
        @stylist.update(stylist_params)
        if @stylist.valid?
            redirect_to(@stylist)
        else 
            @errors = @stylist.errors
            find_stylist
            render :edit
        end
    end

    def destroy
        @stylist.appointments.destroy_all
        @stylist.destroy
        redirect_to(appointments_path)
    end

    private

    def stylist_params
    permitted = params.require(:stylist).permit(:name, :specialty)
    end

    def find_stylist
    @stylist = Stylist.find(params[:id])
    end
end
