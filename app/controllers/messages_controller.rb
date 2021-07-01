class MessagesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def new
        if @appointment = Appointment.find_by_id(params[:appointment_id])
            @message = @appointment.messages.build
        else
            @message = Message.new
        end
    end

    def create
        @message = current_patient.messages.build(message_params)
        if @message.save
            redirect_to message_path(@message)
        else
            render :new
        end
    end

    def show
        @message = Message.find_by_id(params[:id])
    end

    def index
        if @appointment = Appointment.find_by_id(params[:appointment_id])
            @message = @appointment.messages
        else
            @message = Message.all
        end
    end

    private

    def message_params
        params.require(:message).permit(:content, :patient_id, :appointment_id)
    end
    
end
