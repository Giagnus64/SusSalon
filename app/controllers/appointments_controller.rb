class AppointmentsController < ApplicationController
     before_action :find_appointment, only:[:show, :edit, :update, :destroy]

    def index
    @appointments = Appointment.all
    end
    
    def show
    
    end
    
    def new
    @clients = Client.all
    @stylists = Stylist.all
    @appointment = Appointment.new
    end

    def create
    @clients = Client.all
    @stylists = Stylist.all
    @appointment = Appointment.create(appointment_params)
        if @appointment.valid?
            redirect_to(@appointment)
        else 
            flash[:errors] = @appointment.errors.full_messages
            redirect_to(new_appointment_path)
        end
    end

    def edit
    @clients = Client.all
    @stylists = Stylist.all
    end
    
    def update
        @clients = Client.all
        @stylists = Stylist.all
        @appointment.update(appointment_params)
        if @appointment.valid?
            redirect_to(@appointment)
        else 
            flash[:errors] = @appointment.errors.full_messages
            redirect_to(edit_appointment_path)
        end
    end

    def destroy
        @appointment.destroy
        redirect_to(appointments_path)
    end

    private

    def appointment_params
    permitted = params.require(:appointment).permit(:time, :client_id, :stylist_id)
    end

    def find_appointment
    @appointment = Appointment.find(params[:id])
    end
end
