module DefaultPageContent
    extend ActiveSupport::Concern

    included do
        before_action :set_page_defaults
    end

    #default title
    def set_page_defaults
        @page_title = "Jenipha Rachel's Portfolio Site"
        @seo_keywords = "Jenipha Rachel Portfolio"
    end
    
end