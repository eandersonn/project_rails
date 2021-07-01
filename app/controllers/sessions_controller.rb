class SessionsController < ApplicationController
    
    def welcome
    end

    def destroy
        session.delete(:patient_id)
        redirect_to '/'
    end

    def new
    end

    def create
        @patient = Patient.find_by(email: params[:patient][:email])
        if @patient && @patient.authenticate(password: params[:patient][:password])
            session[:patient_id] = @patient.id
            redirect_to patient_path(@patient)
        else
            flash[:error] = "The information you inputted doesn't match what's in our record. Try Again!"
            redirect_to login_path
        end
    end

end