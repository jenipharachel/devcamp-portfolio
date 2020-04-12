module DeviseWhitelist
    extend ActiveSupport::Concern

    #to permit name field in db, email and password will be permitted in devise by default
    included do
        before_action :configure_permitted_parameters, if: :devise_controller?
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end