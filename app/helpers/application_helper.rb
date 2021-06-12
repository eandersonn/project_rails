module ApplicationHelper

    private
    def current_patient
        if session[:patient_id]
            @current_patient
        else
            @current_patient = Patient.find_by(session[:patient_id])
        end
    end

    def logged_in?
        !!session[:patient_id]
    end

    def redirect_if_not_Logged_in
        if !logged_in?
            redirect_to '/'
        end
    end

end
