class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :name
  
  def first_name
    self.name.split.first
  end
  
  def last_name
    self.name.split.last
  end
  
  def get_facebook_messages
    begin
      contacts_fb
      @messages = retrieves_messages
    rescue => e
      flash[:error] = "Error ocurred contacting Facebook: #{e}"
    end
  end
end
