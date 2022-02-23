class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include DeviseWhitelist
  include SetSource
  include CurrentUsserConcern
  include DefaultPageContent
  
  before_action :set_copyright
  
  def set_copyright
    @copyright = TestEnvViewTool::Renderer.copyright 'Hugo Ibañez', 'All rights reserved'
  end
  
end

module TestEnvViewTool
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}<b> #{msg}".html_safe
    end
  end
end