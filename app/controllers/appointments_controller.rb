class AppointmentsController < ApplicationController

    before_action :set_appointment, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in

    def new
        @appointment = Appointment.new
        @appointment.build_category
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @appointment.patient_id = session[:patient_id]
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            @appointment.build_category
            render :new
        end
    end 

    def index
        @appointments = Appointment.order('title ASC').includes(:category)
    end

    def show
        @appointment = Appointment.find(params[:id])
    end

    def edit
    end

    private
    def appointment_params
        params.require(:appointment).permit(:title, :content, :category_id, category_attributes: [:name])
    end

    def set_appointment
        @appointment = Appointment.find_by(params[:id])
        redirect_to appointments_path if !@appointment
    end

end
