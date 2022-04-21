class PagesController < ApplicationController
  def home
    flash[:alert] = "I am a sample flash message for the home page"

    @post = Guide.all
    @skills =Skill.all
  end

  def about
    @skills= Skill.all
  end

  def contact
  end
  
  def tech_news
    @tweets = SocialTool.twitter_search  
  end
  
end
