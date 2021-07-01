class ApplicationController < ActionController::Base
    
    helper_method :current_patient, :logged_in?

    private
    def current_patient
        @current_patient ||= Patient.find_by_id(session[:patient_id]) if session[:patient_id]
    end

    def logged_in?
        !!session[:patient_id]
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to 'login_path'
        end
    end
end
