class MessagesController < ApplicationController
  def user
  end

  def index
    @messages = Message.all
  end
  
  def new
        @messages = Message.new
        #1.times { @messages.users.build }
  end  
  
  def create
        @messages = Message.new(params.require(:messages).permit(:body, :active, 
        users_attributes: [:name]))

        respond_to do |format|
          if @messages.save
            format.html { redirect_to messages_path, notice: "You message is now live." }
            format.json { render :show, status: :created, location: @messages }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @messages.errors, status: :unprocessable_entity }
          end
        end
  end
    
    
    
   def show
        @messages = Message.find(params[:id])
   end
    
end
