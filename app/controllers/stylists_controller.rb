class StylistsController < ApplicationController
    before_action :find_stylist, only:[:show, :edit, :update, :destroy]

    def index
    @stylists = Stylist.all
    end
    
    def show
    @clients = Client.all 
    @appointment = @stylist.appointments.new()
    end
    
    def new
    @stylist= Stylist.new
    end

    def create
    @stylist= Stylist.create(stylist_params)
        if @stylist.valid?
            redirect_to(@stylist)
        else 
            flash[:errors] = @stylist.errors.full_messages
            redirect_to(new_stylist_path)
        end
    end

    def edit
    end
    
    def update
        @stylist.update(stylist_params)
        if @stylist.valid?
            redirect_to(@stylist)
        else 
            flash[:errors] = @stylist.errors.full_messages
            redirect_to(edit_stylist_path)
        end
    end

    def destroy
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
