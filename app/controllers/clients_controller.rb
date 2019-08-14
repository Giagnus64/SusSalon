class ClientsController < ApplicationController
    before_action :find_client, only:[:show, :edit, :update, :destroy]

    def index
    @clients = Client.all
    end
    
    def show
    @stylists = Stylist.all
    @appointment = @client.appointments.new()
    end
    
    def new
    @client = Client.new
    end

    def create
    @client = Client.create(client_params)
        if @client.valid?
            redirect_to(@client)
        else 
            flash[:errors] = @client.errors.full_messages
            redirect_to(new_doggo_path)
        end
    end
    
    def edit
    end
    
    def update
        @client.update(client_params)
        if @client.valid?
            redirect_to(@client)
        else 
            flash[:errors] = @client.errors.full_messages
            redirect_to(edit_client_path)
        end
    end

    def destroy
        @client.destroy
        redirect_to(appointments_path)
    end

    private

    def client_params
    permitted = params.require(:client).permit(:name, :age, :gender)
    end

    def find_client
    @client = Client.find(params[:id])
    end

end
