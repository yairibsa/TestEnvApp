class TopicsController < ApplicationController
  layout 'guide'
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    
    if logged_in?(:site_admin) 
      @guides = @topic.guides.recent.page(params[:page]).per(5)
    else
      @guides = @topic.guides.published.recent.page(params[:page]).per(5)
    end
  end
end
