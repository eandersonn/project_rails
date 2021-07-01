class PatientsController < ApplicationController

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            session[:patient_id] = @patient.id
            redirect_to patient_path(@patient)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @patient = Patient.find_by_id(params[:id])
        if !@patient
            redirect_to '/'
        end
    end

    private
    def patient_params
        params.require(:patient).permit(:first_name, :last_name, :email, :address, :password)
    end

end
