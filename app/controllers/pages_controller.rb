class PagesController < ApplicationController
  def home
    @post = Guide.all
    @skills =Skill.all
  end

  def about
  end

  def contact
  end
end
