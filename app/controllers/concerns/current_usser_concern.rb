module CurrentUsserConcern
    extend ActiveSupport::Concern
    
  def current_usser
    super || guest_usser
  end
  
  def guest_usser
     OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@example.com")
  end
end