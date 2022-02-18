module DefaultPageContent
    extend ActiveSupport::Concern
    
    included do
        before_action :set_title_defaults
        
    end
    
    def set_title_defaults
         @page_title = "TestEnvApp | My TestApp Website" 
         @seo_keywords = "Hugo Ibañez porfolio"
    end
end