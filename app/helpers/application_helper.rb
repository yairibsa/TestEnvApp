module ApplicationHelper
    def login_helper
     if current_usser.is_a?(Usser) 
       link_to "Logout", destroy_usser_session_path, method: :delete
     else 
       (link_to "Register", new_usser_registration_path) +
       "<br>".html_safe +
       (link_to "Login", new_usser_session_path) 
     end 
    end
end
