module SetSource
    extend ActiveSupport::Concern
    
    #based on query, any data can be shown in the entire session
    included do
        before_action :set_source
    end
    
    def set_source
        session[:source] = params[:q] if params[:q]
    end
end