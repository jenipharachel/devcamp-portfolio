class ApplicationController < ActionController::Base
    include DeviseWhitelist

    #based on query, any data can be shown in the entire session
    before_action :set_source

    def set_source
        session[:source] = params[:q] if params[:q]
    end
end
