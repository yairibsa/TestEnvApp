class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout 'guide'
  
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    
    if logged_in?(:site_admin,:user) 
      @guides = @topic.guides.recent.page(params[:page]).per(5)
    else
      @guides = @topic.guides.published.recent.page(params[:page]).per(5)
    end
  end
  
  private
  
  def set_sidebar_topics
    @side_bar_topics = Topic.with_guides
  end
end
